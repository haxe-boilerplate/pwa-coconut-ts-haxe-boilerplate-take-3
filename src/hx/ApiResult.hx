package;

typedef Result = {
    slideshow:{
        title:String,
        author:String,
        date:String,
        slides:Array<{
            title:String,
            type:String,
            ?items:Array<String>,
        }>,
    }
}
