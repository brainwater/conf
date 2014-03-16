Config { bgColor = "black"
       , fgColor = "grey"
       , position = TopW L 70
       , lowerOnStart = True
       , commands = [ Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 20
                    , Run MultiCpu ["-t","Cpu: <autototal>%","-m","2","-L","3","-H","50","--normal","green","--high","red"] 20
                    , Run Memory ["-t","Mem: <usedratio>%","-L","50","-H","80","--normal","green","--high","red"] 60
                    , Run Swap [] 600
					, Run DiskU [("/", "<used>/<size>"), ("sdb1", "<usedbar>")] ["-L", "20", "-H", "50", "-m", "1", "-p", "3"] 20
                    , Run Battery ["-L","20","-H","80","--low","red","--normal","green"] 20
                    , Run Date "%a %b %_d %k:%M" "date" 20
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ %cpu% | %multicpu% | %memory% * %swap% | %disku% | %battery% | <fc=#ee9a00>%date%</fc> "
       }