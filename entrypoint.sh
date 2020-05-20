#!/bin/sh

cd $GITHUB_WORKSPACE/

bundle install

KNAPSACK_PRO_CI_NODE_TOTAL=$KNAPSACK_PRO_CI_NODE_TOTAL KNAPSACK_PRO_CI_NODE_INDEX=$KNAPSACK_PRO_CI_NODE_INDEX bundle exec rake "knapsack_pro:queue:rspec[--format progress --out $GITHUB_WORKSPACE/reports/test-report${KNAPSACK_PRO_CI_NODE_INDEX}.log]"
