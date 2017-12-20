class DFA
  @@sensitiveMap=Hash.new

  class << DFA
    def addWord(word)
      nowMap = @@sensitiveMap

      for i in 0 .. word.strip.length-1
        c = word[i].chr
        if nowMap.has_key? c
          nowMap = nowMap[c]
        else
          child = Hash.new
          child["end"] = 0
          nowMap[c] = child
          nowMap = nowMap[c]
        end
      end
      nowMap["end"] = 1
    end
  end

  if File.exist? "E:/RubyProject/dfa-test/data.txt"
    file = File.new("E:/RubyProject/dfa-test/data.txt","r:utf-8")
    file.each do |line|
      addWord line
    end
  else
    puts "file not exists!"
  end

  class << DFA
    def testWord(word)
      words = Array.new
      for i in 0 .. word.length - 1
        c = word[i]
        if @@sensitiveMap.has_key? c
          theword = ''
          nowMap = @@sensitiveMap
          for j in i .. word.length - 1
            c = word[j]
            if nowMap.has_key? c
              theword += c
              nowMap = nowMap[c]
              if nowMap['end'] == 1
                words.push theword
              end
            else
              break
            end
          end
        end
      end
      return words
    end
  end
end

DFA.addWord "知道"

a =DFA.testWord "你是法轮功是？天安门事件你知道吗？淡蓝色的京东方水电费是否时间到了福建省了的咖啡机适得府君书两地分居欧舒丹浇浇水砥砺奋进觉得快见风使舵会计师就是健康精灵就类似觉得快接口旧世纪东方加链接了搜饥饿贾凯里尼健身房健身房加上了的芳姐了开始酒店方就是sb屌"
puts a