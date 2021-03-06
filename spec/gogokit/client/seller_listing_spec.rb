require 'rspec'
require 'spec_helper'

describe GogoKit::Client::SellerListing do
  let(:client) do
    GogoKit::Client.new(client_id: 'CK', client_secret: 'CS')
  end

  let(:root) do
    self_link = Roar::Hypermedia::Hyperlink.new(href: 'https://api.com/')
    root = GogoKit::Root.new
    root.links = {
      'self' => self_link
    }
    root
  end

  describe '#get_seller_listing' do
    it 'performs a get request' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/).to_return(body: '{}')
      client.get_seller_listing(-1)
      expect(a_request(:get, /.*/)).to have_been_made
    end

    it 'performs a request built from the self link of the root resource' do
      self_link = Roar::Hypermedia::Hyperlink.new(href: 'https://apiroot.com')
      root = GogoKit::Root.new
      root.links = {'self' => self_link}
      expected_url = self_link.href + '/sellerlistings/55'
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.get_seller_listing 55

      expect(client).to have_received(:request).with(anything,
                                                     expected_url,
                                                     anything)
    end

    it 'passes the given options in the request' do
      expected_options = {params: {foo: 5}, headers: {bar: '50'}}
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.get_seller_listing(-1, expected_options)

      expect(client).to have_received(:request) do |_, _, options|
        expect(options).to eq(expected_options)
      end
    end

    it 'returns {GogoKit::SellerListing} created from the response' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/).to_return(body: fixture('seller_listing.json'))
      genres = client.get_seller_listing(-1)
      expect(genres).to be_an_instance_of(GogoKit::SellerListing)
    end
  end

  describe '#get_seller_listings' do
    it 'performs a get request' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/).to_return(body: '{}')
      client.get_seller_listings
      expect(a_request(:get, /.*/)).to have_been_made
    end

    it 'performs a request built from the self link of the root resource' do
      self_link = Roar::Hypermedia::Hyperlink.new(href: 'https://apiroot.com')
      root = GogoKit::Root.new
      root.links = {'self' => self_link}
      expected_url = self_link.href + '/sellerlistings'
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.get_seller_listings

      expect(client).to have_received(:request).with(anything,
                                                     expected_url,
                                                     anything)
    end

    it 'passes the given options in the request' do
      expected_options = {params: {foo: 5}, headers: {bar: '50'}}
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.get_seller_listings expected_options

      expect(client).to have_received(:request) do |_, _, options|
        expect(options).to eq(expected_options)
      end
    end

    it 'returns {GogoKit::PagedResource} with {GogoKit::SellerListing}' \
       ':items created from the response' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/).to_return(body: fixture('seller_listings.json'))
      seller_listings = client.get_seller_listings
      expect(seller_listings).to be_an_instance_of(GogoKit::PagedResource)
      expect(seller_listings.items[0])
        .to be_an_instance_of(GogoKit::SellerListing)
    end
  end

  describe '#get_listing_constraints_for_event' do
    it 'performs a get request' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/).to_return(body: '{}')
      client.get_listing_constraints_for_event(-1)
      expect(a_request(:get, /.*/)).to have_been_made
    end

    it 'performs a request built from the self link of the root resource' do
      self_link = Roar::Hypermedia::Hyperlink.new(href: 'https://apiroot.com')
      root = GogoKit::Root.new
      root.links = {'self' => self_link}
      expected_url = self_link.href + '/events/55/listingconstraints'
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.get_listing_constraints_for_event 55

      expect(client).to have_received(:request).with(anything,
                                                     expected_url,
                                                     anything)
    end

    it 'passes the given options in the request' do
      expected_options = {params: {foo: 5}, headers: {bar: '50'}}
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.get_listing_constraints_for_event(-1, expected_options)

      expect(client).to have_received(:request) do |_, _, options|
        expect(options).to eq(expected_options)
      end
    end

    it 'returns {GogoKit::ListingConstraints} created from the response' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/)
        .to_return(body: fixture('listing_constraints.json'))
      constraints = client.get_listing_constraints_for_event(-1)
      expect(constraints).to be_an_instance_of(GogoKit::ListingConstraints)
    end
  end

  describe '#get_listing_constraints' do
    it 'performs a get request' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/).to_return(body: '{}')
      client.get_listing_constraints(-1)
      expect(a_request(:get, /.*/)).to have_been_made
    end

    it 'performs a request built from the self link of the root resource' do
      self_link = Roar::Hypermedia::Hyperlink.new(href: 'https://apiroot.com')
      root = GogoKit::Root.new
      root.links = {'self' => self_link}
      expected_url = self_link.href + '/sellerlistings/55/constraints'
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.get_listing_constraints 55

      expect(client).to have_received(:request).with(anything,
                                                     expected_url,
                                                     anything)
    end

    it 'passes the given options in the request' do
      expected_options = {params: {foo: 5}, headers: {bar: '50'}}
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.get_listing_constraints(-1, expected_options)

      expect(client).to have_received(:request) do |_, _, options|
        expect(options).to eq(expected_options)
      end
    end

    it 'returns {GogoKit::ListingConstraints} created from the response' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/)
        .to_return(body: fixture('listing_constraints.json'))
      constraints = client.get_listing_constraints(-1)
      expect(constraints).to be_an_instance_of(GogoKit::ListingConstraints)
    end
  end

  describe '#create_seller_listing_preview' do
    it 'performs a post request' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/).to_return(body: '{}')
      client.create_seller_listing_preview(-1, body: {})
      expect(a_request(:post, /.*/)).to have_been_made
    end

    it 'performs a request built from the self link of the root resource' do
      self_link = Roar::Hypermedia::Hyperlink.new(href: 'https://apiroot.com')
      root = GogoKit::Root.new
      root.links = {'self' => self_link}
      expected_url = self_link.href + '/events/55/sellerlistingpreview'
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.create_seller_listing_preview(55, body: {})

      expect(client).to have_received(:request).with(anything,
                                                     expected_url,
                                                     anything)
    end

    it 'passes the given options in the request' do
      expected_options = {params: {foo: 5}, headers: {bar: '50'}}
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.create_seller_listing_preview(-1, expected_options)

      expect(client).to have_received(:request) do |_, _, options|
        expect(options).to eq(expected_options)
      end
    end

    it 'returns {GogoKit::SellerListing} created from the response' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/)
        .to_return(body: fixture('seller_listing.json'))
      preview = client.create_seller_listing_preview(-1, body: {})
      expect(preview).to be_an_instance_of(GogoKit::SellerListing)
    end
  end

  describe '#create_seller_listing_update_preview' do
    it 'performs a post request' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/).to_return(body: '{}')
      client.create_seller_listing_update_preview(-1, body: {})
      expect(a_request(:post, /.*/)).to have_been_made
    end

    it 'performs a request built from the self link of the root resource' do
      self_link = Roar::Hypermedia::Hyperlink.new(href: 'https://apiroot.com')
      root = GogoKit::Root.new
      root.links = {'self' => self_link}
      expected_url = self_link.href + '/sellerlistings/55/updatepreview'
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.create_seller_listing_update_preview(55, body: {})

      expect(client).to have_received(:request).with(anything,
                                                     expected_url,
                                                     anything)
    end

    it 'passes the given options in the request' do
      expected_options = {params: {foo: 5}, headers: {bar: '50'}}
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.create_seller_listing_update_preview(-1, expected_options)

      expect(client).to have_received(:request) do |_, _, options|
        expect(options).to eq(expected_options)
      end
    end

    it 'returns {GogoKit::SellerListing} created from the response' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/)
        .to_return(body: fixture('seller_listing.json'))
      preview = client.create_seller_listing_update_preview(-1, body: {})
      expect(preview).to be_an_instance_of(GogoKit::SellerListing)
    end
  end

  describe '#create_seller_listing' do
    it 'performs a post request' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/).to_return(body: '{}')
      client.create_seller_listing(-1, body: {})
      expect(a_request(:post, /.*/)).to have_been_made
    end

    it 'performs a request built from the self link of the root resource' do
      self_link = Roar::Hypermedia::Hyperlink.new(href: 'https://apiroot.com')
      root = GogoKit::Root.new
      root.links = {'self' => self_link}
      expected_url = self_link.href + '/events/55/sellerlistings'
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.create_seller_listing(55, body: {})

      expect(client).to have_received(:request).with(anything,
                                                     expected_url,
                                                     anything)
    end

    it 'passes the given options in the request' do
      expected_options = {params: {foo: 5}, headers: {bar: '50'}}
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.create_seller_listing(-1, expected_options)

      expect(client).to have_received(:request) do |_, _, options|
        expect(options).to eq(expected_options)
      end
    end

    it 'returns {GogoKit::SellerListing} created from the response' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/)
        .to_return(body: fixture('seller_listing.json'))
      preview = client.create_seller_listing(-1, body: {})
      expect(preview).to be_an_instance_of(GogoKit::SellerListing)
    end
  end

  describe '#update_seller_listing' do
    it 'performs a patch request' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/).to_return(body: '{}')
      client.update_seller_listing(-1, body: {})
      expect(a_request(:patch, /.*/)).to have_been_made
    end

    it 'performs a request built from the self link of the root resource' do
      self_link = Roar::Hypermedia::Hyperlink.new(href: 'https://apiroot.com')
      root = GogoKit::Root.new
      root.links = {'self' => self_link}
      expected_url = self_link.href + '/sellerlistings/55'
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.update_seller_listing(55, body: {})

      expect(client).to have_received(:request).with(anything,
                                                     expected_url,
                                                     anything)
    end

    it 'passes the given options in the request' do
      expected_options = {params: {foo: 5}, headers: {bar: '50'}}
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.update_seller_listing(-1, expected_options)

      expect(client).to have_received(:request) do |_, _, options|
        expect(options).to eq(expected_options)
      end
    end

    it 'returns {GogoKit::SellerListing} created from the response' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/)
        .to_return(body: fixture('seller_listing.json'))
      preview = client.update_seller_listing(-1, body: {})
      expect(preview).to be_an_instance_of(GogoKit::SellerListing)
    end
  end

  describe '#delete_seller_listing' do
    it 'performs a delete request' do
      allow(client).to receive(:get_root).and_return(root)
      stub_request(:any, /.*/).to_return(body: '{}')
      client.delete_seller_listing(-1)
      expect(a_request(:delete, /.*/)).to have_been_made
    end

    it 'performs a request built from the self link of the root resource' do
      self_link = Roar::Hypermedia::Hyperlink.new(href: 'https://apiroot.com')
      root = GogoKit::Root.new
      root.links = {'self' => self_link}
      expected_url = self_link.href + '/sellerlistings/55'
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.delete_seller_listing 55

      expect(client).to have_received(:request).with(anything,
                                                     expected_url,
                                                     anything)
    end

    it 'passes the given options in the request' do
      expected_options = {params: {foo: 5}, headers: {bar: '50'}}
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(body: '{}', status: 200)
      client.delete_seller_listing(-1, expected_options)

      expect(client).to have_received(:request) do |_, _, options|
        expect(options).to eq(expected_options)
      end
    end

    it 'returns the response env Hash' do
      expected_response_hash = {body: 'abc', status: 204}
      allow(client).to receive(:get_root).and_return(root)
      allow(client).to receive(:request).and_return(expected_response_hash)

      actual_response_hash = client.delete_seller_listing 55

      expect(actual_response_hash).to be(expected_response_hash)
    end
  end
end
