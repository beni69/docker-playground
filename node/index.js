const express = require("express");

const PORT = process.env.PORT || 8080;

const app = express();

app.get("/", (_, res) => res.send("Hello World"));

app.listen(PORT, () => console.log(`Listening on http://127.0.0.1:${PORT}`));
