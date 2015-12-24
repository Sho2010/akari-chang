require 'google_drive'

class DietUser

  def initialize(personal_sheet)
    @personal_sheet = personal_sheet  
  end

  def today()
    
  end

end

class SpreadSheetDataSource
  def initialize()
    client_id     = ""
    client_secret = ""
    refresh_token = ""
    sheet_id      = ""
    client = OAuth2::Client.new(
        client_id,
        client_secret,
        site: "https://accounts.google.com",
        token_url: "/o/oauth2/token",
        authorize_url: "/o/oauth2/auth")
    auth_token = OAuth2::AccessToken.from_hash(client,{:refresh_token => refresh_token, :expires_at => 3600})
    auth_token = auth_token.refresh!
    session = GoogleDrive.login_with_oauth(auth_token.token)
    @spread_sheet = session.spreadsheet_by_key(sheet_id)

  end

  def find_user_sheet(name, year: Time.now.year)
    @spread_sheet.worksheets.find { |sheet| sheet.title == "#{year}_#{name}" }
  end
end

