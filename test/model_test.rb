require 'test_helper'

class ModelTest < MiniTest::Unit::TestCase

  class TestModel
    attr_accessor :body, :subject, :blurb
    include ActiveModel::Validations

    validates :body, :subject, not_shouting: {threshold: 0.1}
  end

  class TestModelNoThreshold
    attr_accessor :body, :subject, :blurb
    include ActiveModel::Validations

    validates :body, :subject, not_shouting: true
  end

  def test_validates_nil
    m = TestModel.new
    assert(m.valid?)
  end

  def test_validates_shouting
    m = TestModel.new
    m.body = "THIS IS SHOUTING AND SHOULD NOT BE OK"
    m.subject = "THIS IS NOT OK"
    assert !m.valid?
    assert m.errors[:body].present?
    assert m.errors[:subject].present?
  end

  def test_validates_with_threshold
    m = TestModel.new
    m.subject = "This is actually ok" # < 10%
    assert m.valid?

    m = TestModel.new
    m.subject = "THIs is actually ok" # > 10%
    assert !m.valid?
  end

  def test_without_threshold
    m = TestModelNoThreshold.new
    m.body = "ABCabc" # 50% ok
    assert(m.valid?)

    m.body = "ABCDabc" # >50% not ok
    assert(!m.valid?)
  end

end