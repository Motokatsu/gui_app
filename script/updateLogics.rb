#Dir keModules("kamui/Model/KEModule")
def findModuleInfo(paths)
  moduleInfo = {}
  paths.each do |path|
    Dir.entries(path).each do |d|
      fd = "#{path}/#{d}/#{d}Define.h"
      if File.exists?(fd)
        moduleInfo[d] = {:define => fd, :factory => []}
        Dir::glob("#{path}/#{d}/**/*Factory.cpp").each do |ff|
          moduleInfo[d][:factory].push(ff)
        end
      end
    end
  end
  return moduleInfo
end

def preprocessHeader(header, preSymbols = {})
  symbols = preSymbols
  fd = open(header)
  fd.each do |line|
    if line =~ /^\#define\s+(\w+|\w+\([\s\w|]+\))\s+(.+)$/
      name, s = $1, $2
      while s =~ /(0x\d+)/
        s.sub!( /#{$1}/, "#{eval($1)}")
      end
      symbols.each do |key, val|
        if key =~ /^(.+)\(\s*(\w+)\s*\).*$/
          n, v = $1, $2
          if s =~ /^#{n}\(\s*([\s\w|]+)\s*\)$/
            s = val.sub( /#{v}/, "(#{$1})")
          end
        else
          if s =~ /[\s(]#{key}[)|\s]/
            s.sub!( /#{key}/, val.to_s )
          end
        end
      end
#      printf "%s\t%s\n", name, s
      symbols[name] = s
    end
  end
  fd.close
  return symbols
end

def parseFactory(file)
  logics = {}
  symbol = ""
  fd = open(file)
  fd.each do |line|
    if !symbol.empty?
      if line =~ /^\s+return\s+new\s+(\w+)(\(\))?;\s*$/
        logicName = $1
#        printf "%s\t->\t0x%08x\n", logicName, eval(symbols[symbol]).to_i
        logics[logicName] = symbol
        symbol = ""
      end
    else
      if line =~ /^\s+case\s+(\w+):\s*$/
        symbol = $1
      else
        symbol = ""
      end
    end
  end
  return logics
end

searchPaths = ["../demo_app/kamui/Model/KTModule"] 

moduleInfo = findModuleInfo(searchPaths)
commonSymbols = preprocessHeader("../demo_app/kamui/Framework/include/KEModuleDefine.h")

moduleInfo.each do |module_name, val|
  symbols = preprocessHeader(val[:define], commonSymbols)
  val[:factory].each do |f|
    logics = parseFactory(f)
    logics.each do |name, symbol|
      printf "%s: %s -> %s(0x%08x)\n", module_name, name, symbol, eval(symbols[symbol]).to_i
      logic = Gui::Logic.new(:module=>module_name, :name=>name, :symbol=>symbol, :lid=>eval(symbols[symbol]).to_i)
      if logic.save
        p "save success!"
      else
        p "save error!"
      end
    end
  end
end

#Kamuis::ViewKey.all.each do |view_key| 
#  p view_key.id
#end
