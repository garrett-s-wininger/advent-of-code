"use strict";

function calculateFloor(input) {
    let floor = 0;
    let firstBasement = -1;

    for (let i = 0; i < input.trim().length; ++i) {
        switch (input.charAt(i)) {
            case "(":
                ++floor;
                break;
            case ")":
                --floor;
                break;
        }

        if (floor < 0 && firstBasement === -1) {
            firstBasement = i;
        }
    }

    return {
        endFloor: floor,
        firstBasement: firstBasement + 1,
    }
}

module.exports = calculateFloor;
