Feature: Infinity test
  In order to continuous testing
  As a user
  I want to test my app/gem with rapid feedback

  Background:
    Given a file named "continuous/lib/continuous.rb" with:
    """
    class Continuous
    end
    """
    And a file named "continuous/spec/continuous_spec.rb" with:
    """
    require 'continuous'
    describe Continuous do
      it "should be true" do 
        Continuous.new.should be_true 
      end
    end
    """
    And a file named "continuous/features/continuous.feature" with:
    """
    """

  Scenario: Run with cucumber
    Given I cd to "continuous"
    When I run "ruby ../../../bin/infinity_test --cucumber"
    Then I should see "Style: Cucumber"
    And I should see "ruby"
    And I should see "cucumber"
    And I should see "0 scenarios"
    And I should not see "rspec"
  
  Scenario: Run with Rspec
    Given I cd to "continuous"
    When I run "ruby ../../../bin/infinity_test --rspec"
	Then I should see "Style: Rspec"
	And I should see "ruby"
	And I should see "rspec"
	And I should see "1 example"
	And I should see "0 failures"
	And I should not see "cucumber"
  
  @help
  Scenario: Show help
    When I run "ruby ../../bin/infinity_test --help"
    Then I should see exactly:
    """
    Starts a continuous test server.

    Specify the Test library using in options:
      --testunit : Test::Unit Library
      --rspec    : Rspec Framework
      --cucumber :  Cucumber Library

    Specify the Ruby Versions with:
      --rvm-versions 1.8.6 1.8.7 1.8.9
    """
