# frozen_string_literal: true

require "right_curry"

RSpec.describe RightCurry do
  context "with 0-arity" do
    def dummy_method = Array.new
    subject(:result) do
      method(:dummy_method).right_curry
    end

    let(:expected_result) { Array.new }

    it { is_expected.to eq(expected_result) }
  end

  context "with 1-arity" do
    def dummy_method(first) = [first]
    subject(:result) do
      method(:dummy_method).right_curry[1]
    end

    let(:expected_result) { [1] }

    it { is_expected.to eq(expected_result) }
  end

  context "with 2-arity" do
    def dummy_method(first, second) = [second, first]
    subject(:result) do
      method(:dummy_method).right_curry[1][7]
    end

    let(:expected_result) { [1, 7] }

    it { is_expected.to eq(expected_result) }
  end

  context "with 3-arity" do
    def dummy_method(first, second, third) = [second, third, first]
    subject(:result) do
      method(:dummy_method).right_curry[1][4][7]
    end

    let(:expected_result) { [4, 1, 7] }

    it { is_expected.to eq(expected_result) }
  end

  context "with 4-arity" do
    def dummy_method(first, second, third, fourth)
      [second, fourth, third, first]
    end

    subject(:result) do
      method(:dummy_method).right_curry[1][4][7][3]
    end

    let(:expected_result) { [7, 1, 4, 3] }

    it { is_expected.to eq(expected_result) }
  end
end
