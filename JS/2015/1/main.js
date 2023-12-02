"use strict";

let fs = require("fs");
let calculateFloor = require("./directions");

const input = process.argv[2];

if (fs.existsSync(input)) {
    const fsData = fs.readFileSync(input);
    console.log(calculateFloor(fsData.toString()));
} else {
    console.log(calculateFloor(input));
}
