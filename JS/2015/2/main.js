"use strict";

const fs = require("fs");
const wrappingPaperRequired = require("./dimensions");

const input = process.argv[2];

if (fs.existsSync(input)) {
    const data = fs.readFileSync(input);
    const lines = data.toString().split("\n").map((line) => line.trim());
    let totalPaper = 0;

    lines.forEach((line) => totalPaper += wrappingPaperRequired(line));
    console.log(totalPaper);
} else {
    console.log(wrappingPaperRequired(input));
}
