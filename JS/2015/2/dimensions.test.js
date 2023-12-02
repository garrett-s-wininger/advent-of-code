const wrappingPaperRequired = require("./dimensions");

test("wrapping paper calculated correctly", () => {
    expect(wrappingPaperRequired("2x3x4")).toEqual(58);
    expect(wrappingPaperRequired("1x1x10")).toEqual(43);
});
