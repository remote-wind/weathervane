require 'spec_helper'

describe Weathervane::Env do

  describe ":[]" do

    before(:each) do
      Weathervane::Env.vars = {
          'FOO' => 'BAR',
          'FALSY' => 'FALSE',
          'TRUTHY' => 'true',
          'STRINGY' => 'string'
      }
    end

    it "returns var" do
      expect(Weathervane::Env['FOO']).to eq 'BAR'
    end

    it "accepts symbols" do
      expect(Weathervane::Env[:FOO]).to eq 'BAR'
    end

    it "handles nil gracefully" do
      expect(Weathervane::Env['NIL'].to_bool).to be_nil
    end

    it "extends var with .to_bool" do
      expect(Weathervane::Env['FALSY'].to_bool).to be_false
    end

    it "extends var with .or" do
      expect(Weathervane::Env['NIL'].or(true)).to be_true
      expect(Weathervane::Env['TRUTHY'].or(false)).to be_true
      expect(Weathervane::Env['STRINGY'].or(false)).to eq 'string'
    end


  end


end