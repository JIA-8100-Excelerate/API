class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.unauthorized
    'Unauthorized request'
  end

  def self.account_created
    'Account created successfully'
  end

  def self.account_not_created
    'Account could not be created'
  end

  def self.expired_token
    'Sorry, your token has expired. Please login to continue.'
  end

  def self.not_a_mentor
    'Not a mentor, cannot add a mentee'
  end

  def self.missing_mentee
    'Missing mentee param.'
  end

  def self.mentee_added
    'Mentee added successfully.'
  end

  def self.mentee_already_exists
    'Mentee is already in your account.'
  end

  def self.mentee_dne
    'That mentee does not have an account.'
  end
end
