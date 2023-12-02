"use strict";

const calculateFloor = require("./directions.js")

test("ending floors correctly calculated", () => {
    const zero_results = [
        "(())",
        "()()",
    ];

    const three_results = [
        "(((",
        "(()(()(",
        "))(((((",
    ];

    const neg_one_results = [
        "())",
        "))(",
    ];

    const neg_three_results = [
        ")))",
        ")())())",
    ];

    zero_results.forEach(
        (input) => expect(calculateFloor(input).endFloor).toEqual(0)
    );

    three_results.forEach(
        (input) => expect(calculateFloor(input).endFloor).toEqual(3)
    );

    neg_one_results.forEach(
        (input) => expect(calculateFloor(input).endFloor).toEqual(-1)
    );

    neg_three_results.forEach(
        (input) => expect(calculateFloor(input).endFloor).toEqual(-3)
    );
});

test("first character to hit basement correct", () => {
    expect(calculateFloor(")").firstBasement).toEqual(1);
    expect(calculateFloor("()())").firstBasement).toEqual(5);
});
