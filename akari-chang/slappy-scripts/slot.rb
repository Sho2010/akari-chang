
students = %w(:ayano: :chitose: :himawari: :rise: :sakurako:)
goraku = %w(:akari: :chi-nya: :kyoko: :yui:)
slot_sources = [students, goraku]

hear /slot|スロット/ do |event|
  src = slot_sources.sample
  result = []
  3.times{ result << src.sample }
  say result.join(' '), channel: event.channel
  say("わぁい 揃ったよ♪", channel: event.channel) if result.uniq.length == 1
end
