data ||= SpreadSheetDataSource.new

# TODO:設定ファイルか永続化層へ あとruby新しくなったら "": ""で書こう
sheet_map ||= {'@sho2010': '内藤'}

hear '(.+)のシート名教えて' do |event|
  target = event.matches[1]

  if target =~ /俺|オレ|私|わたし/
    target = sheet_map[event.user.name]
  end

  sheet = data.find_user_sheet(target)
  if sheet
    say "シートの名前は[#{sheet.title}]だよ", channel: event.channel
  else
    say "見つからないよ #{target}さんはダイエット記録してないんじゃないかなぁ？", channel: event.channel
  end
end

hear "test" do |event|
  event.reaction "リアクション"
  logger.info(event.user)
end
