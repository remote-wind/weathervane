require "spec_helper"

describe Weathervane::ForecastProvider do
  it { should have_many :forecasts }

  let(:uri) { 'http://example.com/10/10' }
  let(:request_stub) { stub_request(:get, uri) }
  let(:provider) do
    provider = Weathervane::ForecastProvider.new
    provider.uri_template = "http://example.com/%s/%s"
    provider
  end

  it "requests the correct url" do
    request_stub
    provider.get_forecasts(10,10)
    WebMock.should have_requested(:get, uri)
  end

  it "extracts forecasts" do
    request_stub.to_return(:status => 200, :body => '{}', :headers => {})
    provider.should_receive(:extract_forecasts).with('{}')
    provider.get_forecasts(10,10)
  end

end