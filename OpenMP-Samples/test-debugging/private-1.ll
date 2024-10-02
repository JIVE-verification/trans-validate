; ModuleID = 'private-1.c'
source_filename = "private-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"Suma %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca [1000 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [1000 x i32]* %2, metadata !11, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %3, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %4, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 999, i32* %4, align 4, !dbg !19
  store i32 0, i32* %3, align 4, !dbg !20
  br label %5, !dbg !22

5:                                                ; preds = %13, %0
  %6 = load i32, i32* %3, align 4, !dbg !23
  %7 = icmp slt i32 %6, 1000, !dbg !25
  br i1 %7, label %8, label %16, !dbg !26

8:                                                ; preds = %5
  %9 = load i32, i32* %3, align 4, !dbg !27
  %10 = load i32, i32* %3, align 4, !dbg !29
  %11 = sext i32 %10 to i64, !dbg !30
  %12 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %11, !dbg !30
  store i32 %9, i32* %12, align 4, !dbg !31
  br label %13, !dbg !32

13:                                               ; preds = %8
  %14 = load i32, i32* %3, align 4, !dbg !33
  %15 = add nsw i32 %14, 1, !dbg !33
  store i32 %15, i32* %3, align 4, !dbg !33
  br label %5, !dbg !34, !llvm.loop !35

16:                                               ; preds = %5
  store i32 0, i32* %3, align 4, !dbg !37
  br label %17, !dbg !39

17:                                               ; preds = %33, %16
  %18 = load i32, i32* %3, align 4, !dbg !40
  %19 = icmp slt i32 %18, 1000, !dbg !42
  br i1 %19, label %20, label %36, !dbg !43

20:                                               ; preds = %17
  %21 = load i32, i32* %3, align 4, !dbg !44
  %22 = sext i32 %21 to i64, !dbg !47
  %23 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %22, !dbg !47
  %24 = load i32, i32* %23, align 4, !dbg !47
  %25 = load i32, i32* %4, align 4, !dbg !48
  %26 = icmp slt i32 %24, %25, !dbg !49
  br i1 %26, label %27, label %32, !dbg !50

27:                                               ; preds = %20
  %28 = load i32, i32* %3, align 4, !dbg !51
  %29 = sext i32 %28 to i64, !dbg !52
  %30 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %29, !dbg !52
  %31 = load i32, i32* %30, align 4, !dbg !52
  store i32 %31, i32* %4, align 4, !dbg !53
  br label %32, !dbg !54

32:                                               ; preds = %27, %20
  br label %33, !dbg !55

33:                                               ; preds = %32
  %34 = load i32, i32* %3, align 4, !dbg !56
  %35 = add nsw i32 %34, 1, !dbg !56
  store i32 %35, i32* %3, align 4, !dbg !56
  br label %17, !dbg !57, !llvm.loop !58

36:                                               ; preds = %17
  %37 = load i32, i32* %4, align 4, !dbg !60
  %38 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0), i32 %37), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "private-1.c", directory: "/home/quazirafi/JIVe/OpenMP-Samples/test-debugging")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0-4ubuntu1 "}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 7, type: !8, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "A", scope: !7, file: !1, line: 9, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 32000, elements: !13)
!13 = !{!14}
!14 = !DISubrange(count: 1000)
!15 = !DILocation(line: 9, column: 9, scope: !7)
!16 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 10, type: !10)
!17 = !DILocation(line: 10, column: 9, scope: !7)
!18 = !DILocalVariable(name: "result", scope: !7, file: !1, line: 11, type: !10)
!19 = !DILocation(line: 11, column: 9, scope: !7)
!20 = !DILocation(line: 15, column: 12, scope: !21)
!21 = distinct !DILexicalBlock(scope: !7, file: !1, line: 15, column: 5)
!22 = !DILocation(line: 15, column: 10, scope: !21)
!23 = !DILocation(line: 15, column: 17, scope: !24)
!24 = distinct !DILexicalBlock(scope: !21, file: !1, line: 15, column: 5)
!25 = !DILocation(line: 15, column: 19, scope: !24)
!26 = !DILocation(line: 15, column: 5, scope: !21)
!27 = !DILocation(line: 17, column: 16, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !1, line: 16, column: 5)
!29 = !DILocation(line: 17, column: 11, scope: !28)
!30 = !DILocation(line: 17, column: 9, scope: !28)
!31 = !DILocation(line: 17, column: 14, scope: !28)
!32 = !DILocation(line: 18, column: 5, scope: !28)
!33 = !DILocation(line: 15, column: 25, scope: !24)
!34 = !DILocation(line: 15, column: 5, scope: !24)
!35 = distinct !{!35, !26, !36}
!36 = !DILocation(line: 18, column: 5, scope: !21)
!37 = !DILocation(line: 21, column: 12, scope: !38)
!38 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 5)
!39 = !DILocation(line: 21, column: 10, scope: !38)
!40 = !DILocation(line: 21, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !1, line: 21, column: 5)
!42 = !DILocation(line: 21, column: 19, scope: !41)
!43 = !DILocation(line: 21, column: 5, scope: !38)
!44 = !DILocation(line: 23, column: 15, scope: !45)
!45 = distinct !DILexicalBlock(scope: !46, file: !1, line: 23, column: 13)
!46 = distinct !DILexicalBlock(scope: !41, file: !1, line: 22, column: 5)
!47 = !DILocation(line: 23, column: 13, scope: !45)
!48 = !DILocation(line: 23, column: 20, scope: !45)
!49 = !DILocation(line: 23, column: 18, scope: !45)
!50 = !DILocation(line: 23, column: 13, scope: !46)
!51 = !DILocation(line: 24, column: 24, scope: !45)
!52 = !DILocation(line: 24, column: 22, scope: !45)
!53 = !DILocation(line: 24, column: 20, scope: !45)
!54 = !DILocation(line: 24, column: 13, scope: !45)
!55 = !DILocation(line: 25, column: 5, scope: !46)
!56 = !DILocation(line: 21, column: 28, scope: !41)
!57 = !DILocation(line: 21, column: 5, scope: !41)
!58 = distinct !{!58, !43, !59}
!59 = !DILocation(line: 25, column: 5, scope: !38)
!60 = !DILocation(line: 27, column: 25, scope: !7)
!61 = !DILocation(line: 27, column: 5, scope: !7)
!62 = !DILocation(line: 28, column: 5, scope: !7)
