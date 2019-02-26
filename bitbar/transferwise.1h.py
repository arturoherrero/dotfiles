#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Based on Andrew Keating plugin

import urllib2
import json

TRANSFERWISE_KEY = "dad99d7d8e52c2c8aaf9fda788d8acdc"

currency_from, symbol_from = "GBP", "£"
currency_to, symbol_to = "EUR", "€"
amount = 5000

url = "https://transferwise.com/api/v1/payment/calculate?" \
        "amount={}" \
        "&sourceCurrency={}" \
        "&targetCurrency={}".format(amount, currency_from, currency_to)

request = urllib2.Request(url)
request.add_header("X-Authorization-key", TRANSFERWISE_KEY)

response = json.loads(urllib2.urlopen(request).read())
transferwise_rate    = response["transferwiseRate"]
transferwise_pay_out = response["transferwisePayOut"]

print "{}/{} {}".format(symbol_from, symbol_to, transferwise_rate)
print "---"
print "{} {} ⇢ {} {} | href=https://transferwise.com/".format(amount, currency_from, transferwise_pay_out, currency_to)
