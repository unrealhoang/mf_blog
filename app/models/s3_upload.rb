class S3Upload
  def self.upload_form_data
    {
      policy: s3_upload_policy_document,
      signature: s3_upload_signature,
      key: key_strategy,
      success_action_redirect: "/"
    }
  end

  def self.key_strategy
    "uploads/#{SecureRandom.uuid}/${filename}"
  end

  # generate the policy document that amazon is expecting.
  def self.s3_upload_policy_document
    Base64.encode64(
      {
        expiration: 30.minutes.from_now.utc.strftime('%Y-%m-%dT%H:%M:%S.000Z'),
        conditions: [
          { bucket: ENV['S3_BUCKET'] },
          { acl: 'public-read' },
          ["starts-with", "$key", "uploads/"],
          { success_action_status: '201' }
        ]
      }.to_json
    ).gsub(/\n|\r/, '')
  end

  # sign our request by Base64 encoding the policy document.
  def self.s3_upload_signature
    Base64.encode64(
      OpenSSL::HMAC.digest(
        OpenSSL::Digest::Digest.new('sha1'),
        ENV['S3_SECRET_KEY'],
        s3_upload_policy_document
      )
    ).gsub(/\n/, '')
  end

end
