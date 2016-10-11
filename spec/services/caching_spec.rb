require 'spec_helper'

describe Services::Caching do

  after do
    Services::Caching.reset
  end

  it '.set' do
    expect(Services::Caching.set(:test, 123)).to eq('OK')
  end

  it '.get' do
    time = Time.now.to_i

    Services::Caching.set(:time, time)

    expect(Services::Caching.get(:time).to_i).to eq(time)
  end
end