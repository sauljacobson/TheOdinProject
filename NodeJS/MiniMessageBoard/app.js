const express = require('express') 

const app = express();
const PORT = 3000; 

const messages = [
    {
        text:
];

app.set("views", "./views");
app.set("view engine", "ejs");

app.get("/*", (req, res) => {
    res.render("index", {message: null}); 
})

app.listen(PORT, () => {
    console.log(`Server Application listening to localhost:${PORT}`);
}); 
