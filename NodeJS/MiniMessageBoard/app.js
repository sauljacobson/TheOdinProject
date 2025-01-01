const express = require('express') 
const path = require("path");
const indexRouter = require("./routes/indexRouter");

const app = express();
const PORT = 3000; 

const messages = [
    {
        text: "Hi there!",
        user: "Amando",
        added: new Date()
    }, 
    {
        text: "Hello World!",
        user: "Charles",
        added: new Date()
    }
];


app.set("views", "./views");
app.set("view engine", "ejs");

app.use(express.static(path.join(__dirname, '.public')))
app.use(express.urlencoded({ extended: true }));

app.use("/", indexRouter);
app.use("/new", indexRouter);



app.listen(PORT, () => {
    console.log(`Server Application listening to localhost:${PORT}`);
}); 
