import * as express from 'express';
import * as path from 'path';
import { getVersion } from '../shared/utils';
import * as config from './config';
import { apiRouter } from './routes/api-router';
import { pagesRouter } from './routes/pages-router';
import { staticsRouter } from './routes/statics-router';
import * as cors from 'cors';
import * as io from 'socket.io';
import { isObject } from 'util';
import * as http from 'http';
import { Server } from 'net';

console.log(`The App version is ${getVersion()} nice!`);

const app = express();
app.set('view engine', 'ejs');

app.use('/assets', express.static(path.join(__dirname, '..', '..', '..', 'assets')));

app.use(staticsRouter());
app.use(apiRouter());

/*app.use('/tink_api', (req, res, next) => {
  server.TinkAPI.main(req, res);
});*/

app.use(pagesRouter());

const httpServer = http.createServer(app);

httpServer.listen(config.SERVER_PORT, () => {
  console.log(`App listening on port ${config.SERVER_PORT}!`);
});

let pot = 0;
let names = [];
let serverNames = [];

io(httpServer).on('connection', socket => {
  socket.on('UPDATE_POT', state => {
    pot = state.pot;
    socket.broadcast.emit('UPDATED_POT', state);
  });

  socket.on('GET_CURRENT_POT', () => socket.emit('CURRENT_POT', pot));

  socket.on('SEND_NAME_TO_SERVER', name => {
    serverNames = [...serverNames, { socketId: socket.id, name }];
    names = [...names, name];
    socket.broadcast.emit('SEND_NAMES_TO_CLIENTS', names);
    socket.emit('SEND_NAMES_TO_CLIENTS', names);
  });

  socket.on('SOMEONE_PITCHED_IN', name => {
    socket.broadcast.emit('GUESS_WHO_PITCHED_IN', name);
  });

  socket.on('SOMEONE_GOT_ONE', name => {
    socket.broadcast.emit('GUESS_WHO_GOT_ONE', name);
  });

  socket.on('disconnect', () => {
    serverNames = serverNames.filter(data => data.socketId !== socket.id);
    names = serverNames.map(data => data.name);
    socket.broadcast.emit('SEND_NAMES_TO_CLIENTS', names);
    socket.emit('SEND_NAMES_TO_CLIENTS', names);
  });
});
