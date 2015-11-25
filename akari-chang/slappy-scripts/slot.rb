
students = %w(:ayano: :chitose: :himawari: :rise: :sakurako:)
goraku = %w(:akari: :chi-nya: :kyoko: :yui:)
all_members = students + goraku
slot_sources = [students, goraku, all_members]

def casino_hit?(patterns)
  # 揃ったカウント返したほうがいいかもな
  patterns.each_slice(3) do |line|
    return true if line.uniq.one?
  end
  return true if patterns.values_at(0, 4, 8).uniq.one?
  return true if patterns.values_at(2, 4, 6).uniq.one?
end

hear /slot|スロット/ do |event|
  src = slot_sources.sample
  result = []
  3.times{ result << src.sample }
  say result.join(' '), channel: event.channel
  say("わぁい 揃ったよ♪", channel: event.channel) if result.uniq.one?
end

hear /pair|couple|ペア|カップル/ do |event|
  src = slot_sources.sample
  say %W(#{src.sample} #{src.sample}).join(" ") , channel: event.channel
end

hear /カジノ|casino/ do |event|
  src = slot_sources.sample
  result = []
  9.times{ result << src.sample }

  lines = result.each_slice(3) 
  say lines.map(&:join).join("\n"), channel: event.channel # join join ﾄｷｨ
  
  say("わぁい 揃ったよ♪", channel: event.channel) if casino_hit?(result) 
  say(":bell::moneybag:フィーバー♪♪:bell::moneybag:", channel: event.channel) if result.uniq.one?
end

