/// <reference path="../../../moment.d.ts" />
import moment = require('../../../moment');
import { module, test } from '../qunit';

module('days in year');

// https://github.com/moment/moment/issues/3717
test('YYYYDDD should not parse DDD=000', function (assert) {
    assert.equal(moment(7000000, moment.ISO_8601, true).isValid(), false);
    assert.equal(moment('7000000', moment.ISO_8601, true).isValid(), false);
    assert.equal(moment(7000000, moment.ISO_8601, false).isValid(), false);
});
