# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

#noinspection CucumberUndefinedStep
Feature: TypeQL optional variables

  Background: Open connection and create a simple extensible schema
    Given typedb starts
    Given connection opens with default authentication
    Given connection has been opened
    Given connection reset database: typedb
    Given connection open schema transaction for database: typedb
    Given typeql define
      """
      define
      entity person owns ref @key,
        plays friendship:friend,
        plays employment:employee,
        owns name,
        owns age;
      entity company owns ref @key,
        plays employment:employer,
        owns name;
      relation friendship owns ref @key,
        relates friend;
      relation employment owns ref @key,
        relates employee,
        relates employer;
      attribute name @independent, value string;
      attribute age @independent, value long;
      attribute ref value long;
      """
    Given transaction commits