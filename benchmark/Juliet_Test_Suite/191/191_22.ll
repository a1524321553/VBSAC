; ModuleID = './191_22.c'
source_filename = "./191_22.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%u\0A\00", align 1
@staticFive = internal global i32 5, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !12 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !16, metadata !17), !dbg !18
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !19
  %conv = sext i8 %0 to i32, !dbg !20
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !21
  ret void, !dbg !22
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !23 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !28, metadata !17), !dbg !29
  %0 = load i8*, i8** %line.addr, align 8, !dbg !30
  %cmp = icmp ne i8* %0, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !34
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !38
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !39 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !42, metadata !17), !dbg !43
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !44
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !45
  ret void, !dbg !46
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !47 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !53, metadata !17), !dbg !54
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !55
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nounwind uwtable
define void @printUnsignedLine(i32 %unsignedNumber) #0 !dbg !58 {
entry:
  %unsignedNumber.addr = alloca i32, align 4
  store i32 %unsignedNumber, i32* %unsignedNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %unsignedNumber.addr, metadata !62, metadata !17), !dbg !63
  %0 = load i32, i32* %unsignedNumber.addr, align 4, !dbg !64
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i32 %0), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nounwind uwtable
define void @bad22() #0 !dbg !67 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !70, metadata !17), !dbg !71
  store i8 32, i8* %data, align 1, !dbg !72
  %0 = load i32, i32* @staticFive, align 4, !dbg !73
  %cmp = icmp eq i32 %0, 5, !dbg !75
  br i1 %cmp, label %if.then, label %if.end, !dbg !76

if.then:                                          ; preds = %entry
  store i8 -90, i8* %data, align 1, !dbg !77
  br label %if.end, !dbg !79

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* @staticFive, align 4, !dbg !80
  %cmp1 = icmp eq i32 %1, 5, !dbg !82
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !83

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i8* %result, metadata !84, metadata !17), !dbg !87
  %2 = load i8, i8* %data, align 1, !dbg !88
  %conv = sext i8 %2 to i32, !dbg !88
  %sub = sub nsw i32 %conv, 65, !dbg !89
  %conv3 = trunc i32 %sub to i8, !dbg !88
  store i8 %conv3, i8* %result, align 1, !dbg !87
  %3 = load i8, i8* %result, align 1, !dbg !90
  call void @printHexCharLine(i8 signext %3), !dbg !91
  br label %if.end4, !dbg !92

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !93
}

; Function Attrs: nounwind uwtable
define void @good22() #0 !dbg !94 {
entry:
  %data = alloca i8, align 1
  %result = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i8* %data, metadata !95, metadata !17), !dbg !96
  store i8 32, i8* %data, align 1, !dbg !97
  %0 = load i32, i32* @staticFive, align 4, !dbg !98
  %cmp = icmp ne i32 %0, 5, !dbg !100
  br i1 %cmp, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0)), !dbg !102
  br label %if.end, !dbg !104

if.else:                                          ; preds = %entry
  store i8 -2, i8* %data, align 1, !dbg !105
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* @staticFive, align 4, !dbg !107
  %cmp1 = icmp eq i32 %1, 5, !dbg !109
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !110

if.then2:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata i8* %result, metadata !111, metadata !17), !dbg !114
  %2 = load i8, i8* %data, align 1, !dbg !115
  %conv = sext i8 %2 to i32, !dbg !115
  %sub = sub nsw i32 %conv, 1, !dbg !116
  %conv3 = trunc i32 %sub to i8, !dbg !115
  store i8 %conv3, i8* %result, align 1, !dbg !114
  %3 = load i8, i8* %result, align 1, !dbg !117
  call void @printHexCharLine(i8 signext %3), !dbg !118
  br label %if.end4, !dbg !119

if.end4:                                          ; preds = %if.then2, %if.end
  ret void, !dbg !120
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !121 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good22(), !dbg !124
  call void @bad22(), !dbg !125
  ret i32 1, !dbg !126
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !6)
!1 = !DIFile(filename: "191_22.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!2 = !{}
!3 = !{!4, !5}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !{!7}
!7 = distinct !DIGlobalVariable(name: "staticFive", scope: !0, file: !8, line: 39, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFive)
!8 = !DIFile(filename: "./191_22.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!9 = !{i32 2, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!12 = distinct !DISubprogram(name: "printHexCharLine", scope: !8, file: !8, line: 10, type: !13, isLocal: false, isDefinition: true, scopeLine: 11, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!16 = !DILocalVariable(name: "charHex", arg: 1, scope: !12, file: !8, line: 10, type: !15)
!17 = !DIExpression()
!18 = !DILocation(line: 10, column: 29, scope: !12)
!19 = !DILocation(line: 12, column: 25, scope: !12)
!20 = !DILocation(line: 12, column: 20, scope: !12)
!21 = !DILocation(line: 12, column: 5, scope: !12)
!22 = !DILocation(line: 13, column: 1, scope: !12)
!23 = distinct !DISubprogram(name: "printLine", scope: !8, file: !8, line: 15, type: !24, isLocal: false, isDefinition: true, scopeLine: 16, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!24 = !DISubroutineType(types: !25)
!25 = !{null, !26}
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64, align: 64)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!28 = !DILocalVariable(name: "line", arg: 1, scope: !23, file: !8, line: 15, type: !26)
!29 = !DILocation(line: 15, column: 30, scope: !23)
!30 = !DILocation(line: 17, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !23, file: !8, line: 17, column: 8)
!32 = !DILocation(line: 17, column: 13, scope: !31)
!33 = !DILocation(line: 17, column: 8, scope: !23)
!34 = !DILocation(line: 19, column: 24, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !8, line: 18, column: 5)
!36 = !DILocation(line: 19, column: 9, scope: !35)
!37 = !DILocation(line: 20, column: 5, scope: !35)
!38 = !DILocation(line: 21, column: 1, scope: !23)
!39 = distinct !DISubprogram(name: "printIntLine", scope: !8, file: !8, line: 23, type: !40, isLocal: false, isDefinition: true, scopeLine: 24, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!40 = !DISubroutineType(types: !41)
!41 = !{null, !4}
!42 = !DILocalVariable(name: "intNumber", arg: 1, scope: !39, file: !8, line: 23, type: !4)
!43 = !DILocation(line: 23, column: 24, scope: !39)
!44 = !DILocation(line: 25, column: 20, scope: !39)
!45 = !DILocation(line: 25, column: 5, scope: !39)
!46 = !DILocation(line: 26, column: 1, scope: !39)
!47 = distinct !DISubprogram(name: "printLongLine", scope: !8, file: !8, line: 28, type: !48, isLocal: false, isDefinition: true, scopeLine: 29, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !50}
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !51, line: 197, baseType: !52)
!51 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/191")
!52 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!53 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !47, file: !8, line: 28, type: !50)
!54 = !DILocation(line: 28, column: 29, scope: !47)
!55 = !DILocation(line: 30, column: 21, scope: !47)
!56 = !DILocation(line: 30, column: 5, scope: !47)
!57 = !DILocation(line: 31, column: 1, scope: !47)
!58 = distinct !DISubprogram(name: "printUnsignedLine", scope: !8, file: !8, line: 33, type: !59, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!59 = !DISubroutineType(types: !60)
!60 = !{null, !61}
!61 = !DIBasicType(name: "unsigned int", size: 32, align: 32, encoding: DW_ATE_unsigned)
!62 = !DILocalVariable(name: "unsignedNumber", arg: 1, scope: !58, file: !8, line: 33, type: !61)
!63 = !DILocation(line: 33, column: 33, scope: !58)
!64 = !DILocation(line: 35, column: 20, scope: !58)
!65 = !DILocation(line: 35, column: 5, scope: !58)
!66 = !DILocation(line: 36, column: 1, scope: !58)
!67 = distinct !DISubprogram(name: "bad22", scope: !8, file: !8, line: 43, type: !68, isLocal: false, isDefinition: true, scopeLine: 44, isOptimized: false, unit: !0, variables: !2)
!68 = !DISubroutineType(types: !69)
!69 = !{null}
!70 = !DILocalVariable(name: "data", scope: !67, file: !8, line: 45, type: !15)
!71 = !DILocation(line: 45, column: 10, scope: !67)
!72 = !DILocation(line: 46, column: 10, scope: !67)
!73 = !DILocation(line: 47, column: 8, scope: !74)
!74 = distinct !DILexicalBlock(scope: !67, file: !8, line: 47, column: 8)
!75 = !DILocation(line: 47, column: 18, scope: !74)
!76 = !DILocation(line: 47, column: 8, scope: !67)
!77 = !DILocation(line: 49, column: 14, scope: !78)
!78 = distinct !DILexicalBlock(scope: !74, file: !8, line: 48, column: 5)
!79 = !DILocation(line: 50, column: 5, scope: !78)
!80 = !DILocation(line: 51, column: 8, scope: !81)
!81 = distinct !DILexicalBlock(scope: !67, file: !8, line: 51, column: 8)
!82 = !DILocation(line: 51, column: 18, scope: !81)
!83 = !DILocation(line: 51, column: 8, scope: !67)
!84 = !DILocalVariable(name: "result", scope: !85, file: !8, line: 55, type: !15)
!85 = distinct !DILexicalBlock(scope: !86, file: !8, line: 53, column: 9)
!86 = distinct !DILexicalBlock(scope: !81, file: !8, line: 52, column: 5)
!87 = !DILocation(line: 55, column: 18, scope: !85)
!88 = !DILocation(line: 55, column: 27, scope: !85)
!89 = !DILocation(line: 55, column: 32, scope: !85)
!90 = !DILocation(line: 56, column: 30, scope: !85)
!91 = !DILocation(line: 56, column: 13, scope: !85)
!92 = !DILocation(line: 58, column: 5, scope: !86)
!93 = !DILocation(line: 59, column: 1, scope: !67)
!94 = distinct !DISubprogram(name: "good22", scope: !8, file: !8, line: 65, type: !68, isLocal: false, isDefinition: true, scopeLine: 66, isOptimized: false, unit: !0, variables: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !8, line: 67, type: !15)
!96 = !DILocation(line: 67, column: 10, scope: !94)
!97 = !DILocation(line: 68, column: 10, scope: !94)
!98 = !DILocation(line: 69, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !94, file: !8, line: 69, column: 8)
!100 = !DILocation(line: 69, column: 18, scope: !99)
!101 = !DILocation(line: 69, column: 8, scope: !94)
!102 = !DILocation(line: 72, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !8, line: 70, column: 5)
!104 = !DILocation(line: 73, column: 5, scope: !103)
!105 = !DILocation(line: 77, column: 14, scope: !106)
!106 = distinct !DILexicalBlock(scope: !99, file: !8, line: 75, column: 5)
!107 = !DILocation(line: 79, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !94, file: !8, line: 79, column: 8)
!109 = !DILocation(line: 79, column: 18, scope: !108)
!110 = !DILocation(line: 79, column: 8, scope: !94)
!111 = !DILocalVariable(name: "result", scope: !112, file: !8, line: 83, type: !15)
!112 = distinct !DILexicalBlock(scope: !113, file: !8, line: 81, column: 9)
!113 = distinct !DILexicalBlock(scope: !108, file: !8, line: 80, column: 5)
!114 = !DILocation(line: 83, column: 18, scope: !112)
!115 = !DILocation(line: 83, column: 27, scope: !112)
!116 = !DILocation(line: 83, column: 32, scope: !112)
!117 = !DILocation(line: 84, column: 30, scope: !112)
!118 = !DILocation(line: 84, column: 13, scope: !112)
!119 = !DILocation(line: 86, column: 5, scope: !113)
!120 = !DILocation(line: 87, column: 1, scope: !94)
!121 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 92, type: !122, isLocal: false, isDefinition: true, scopeLine: 92, isOptimized: false, unit: !0, variables: !2)
!122 = !DISubroutineType(types: !123)
!123 = !{!4}
!124 = !DILocation(line: 93, column: 5, scope: !121)
!125 = !DILocation(line: 94, column: 2, scope: !121)
!126 = !DILocation(line: 95, column: 5, scope: !121)
