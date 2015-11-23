
students = %w(:ayano: :chitose: :himawari: :rise: :sakurako:)
goraku = %w(:akari: :chi-nya: :kyoko: :yui:)
slot_sources = [students, goraku]

def slot_hit?(patterns)
  # 揃ったカウント返したほうがいいかもな
  return true if patterns[0,3].uniq.length == 1
  return true if patterns[3,3].uniq.length == 1
  return true if patterns[6,3].uniq.length == 1
  return true if patterns.values_at(0, 4, 8).uniq.length == 1
  return true if patterns.values_at(2, 4, 6).uniq.length == 1
end

hear /slot|スロット/ do |event|
  src = slot_sources.sample
  result = []
  3.times{ result << src.sample }
  say result.join(' '), channel: event.channel
  say("わぁい 揃ったよ♪", channel: event.channel) if result.uniq.length == 1
end

hear /カジノ|casino/ do |event|
  src = slot_sources.sample
  result = []
  9.times{ result << src.sample }

  lines = result.each_slice(3) 
  say lines.map(&:join).join("\n"), channel: event.channel # join join ﾄｷｨ
  
  say("わぁい 揃ったよ♪", channel: event.channel) if slot_hit?(result) 
  say(":bell::moneybag:フィーバー♪♪:bell::moneybag:", channel: event.channel) if result.uniq.length == 1
end

