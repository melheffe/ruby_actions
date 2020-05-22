#!/bin/sh

cd $GITHUB_WORKSPACE/

bundle install

# Commands to execute knapsack rspec in regular mode

#KNAPSACK_PRO_CI_NODE_TOTAL=$KNAPSACK_PRO_CI_NODE_TOTAL \
#KNAPSACK_PRO_CI_NODE_INDEX=$KNAPSACK_PRO_CI_NODE_INDEX \
#bundle exec rake "knapsack_pro:queue:rspec[--format documentation \
#--out $GITHUB_WORKSPACE/reports/test-report${KNAPSACK_PRO_CI_NODE_INDEX}.log \
#--deprecation-out $GITHUB_WORKSPACE/reports/deprication-report${KNAPSACK_PRO_CI_NODE_INDEX}.log]"

# Commands to execute knapsack rspec with parallel tests on each node

export PARALLEL_TESTS_CONCURRENCY=2;
RAILS_ENV=test \
KNAPSACK_PRO_TEST_SUITE_TOKEN_RSPEC=$KNAPSACK_PRO_TEST_SUITE_TOKEN_RSPEC \
KNAPSACK_PRO_CI_NODE_TOTAL=$KNAPSACK_PRO_CI_NODE_TOTAL \
KNAPSACK_PRO_CI_NODE_INDEX=$KNAPSACK_PRO_CI_NODE_INDEX \
bundle exec parallel_test -n $PARALLEL_TESTS_CONCURRENCY -e './bin/parallel_tests'
