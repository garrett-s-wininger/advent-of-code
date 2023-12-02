"use strict";

function wrappingPaperRequired(measurement) {
    const components = measurement.split("x");
    const [length, width, height] = components.map(x => parseInt(x));
    const surfaceAreas = [length * width, width * height, length * height];
    const slack = Math.min(...surfaceAreas);

    return surfaceAreas.reduce((acc, x) => acc + (2 * x), 0) + slack;
}

module.exports = wrappingPaperRequired;
