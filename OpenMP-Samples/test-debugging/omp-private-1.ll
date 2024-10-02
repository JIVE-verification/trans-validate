; ModuleID = 'private-1.c'
source_filename = "private-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr global %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [25 x i8] c";private-1.c;main;14;5;;\00", align 1
@2 = private unnamed_addr constant [26 x i8] c";private-1.c;main;14;40;;\00", align 1
@3 = private unnamed_addr global %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@.str.1 = private unnamed_addr constant [9 x i8] c"Suma %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  %2 = alloca [1000 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.ident_t, align 8
  %6 = bitcast %struct.ident_t* %5 to i8*
  %7 = bitcast %struct.ident_t* @3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %6, i8* align 8 %7, i64 24, i1 false)
  store i32 0, i32* %1, align 4
  call void @llvm.dbg.declare(metadata [1000 x i32]* %2, metadata !11, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.declare(metadata i32* %3, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %4, metadata !18, metadata !DIExpression()), !dbg !19
  store i32 999, i32* %4, align 4, !dbg !19
  %8 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %5, i32 0, i32 4, !dbg !20
  store i8* getelementptr inbounds ([25 x i8], [25 x i8]* @1, i32 0, i32 0), i8** %8, align 8, !dbg !20
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* %5, i32 1, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, [1000 x i32]*)* @.omp_outlined. to void (i32*, i32*, ...)*), [1000 x i32]* %2), !dbg !20
  store i32 0, i32* %3, align 4, !dbg !21
  br label %9, !dbg !23

9:                                                ; preds = %25, %0
  %10 = load i32, i32* %3, align 4, !dbg !24
  %11 = icmp slt i32 %10, 1000, !dbg !26
  br i1 %11, label %12, label %28, !dbg !27

12:                                               ; preds = %9
  %13 = load i32, i32* %3, align 4, !dbg !28
  %14 = sext i32 %13 to i64, !dbg !31
  %15 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %14, !dbg !31
  %16 = load i32, i32* %15, align 4, !dbg !31
  %17 = load i32, i32* %4, align 4, !dbg !32
  %18 = icmp slt i32 %16, %17, !dbg !33
  br i1 %18, label %19, label %24, !dbg !34

19:                                               ; preds = %12
  %20 = load i32, i32* %3, align 4, !dbg !35
  %21 = sext i32 %20 to i64, !dbg !36
  %22 = getelementptr inbounds [1000 x i32], [1000 x i32]* %2, i64 0, i64 %21, !dbg !36
  %23 = load i32, i32* %22, align 4, !dbg !36
  store i32 %23, i32* %4, align 4, !dbg !37
  br label %24, !dbg !38

24:                                               ; preds = %19, %12
  br label %25, !dbg !39

25:                                               ; preds = %24
  %26 = load i32, i32* %3, align 4, !dbg !40
  %27 = add nsw i32 %26, 1, !dbg !40
  store i32 %27, i32* %3, align 4, !dbg !40
  br label %9, !dbg !41, !llvm.loop !42

28:                                               ; preds = %9
  %29 = load i32, i32* %4, align 4, !dbg !44
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i64 0, i64 0), i32 %29), !dbg !45
  ret i32 0, !dbg !46
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined._debug__(i32* noalias %0, i32* noalias %1, [1000 x i32]* dereferenceable(4000) %2) #2 !dbg !47 {
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca [1000 x i32]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca %struct.ident_t, align 8
  %16 = bitcast %struct.ident_t* %15 to i8*
  %17 = bitcast %struct.ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %16, i8* align 8 %17, i64 24, i1 false)
  store i32* %0, i32** %4, align 8
  call void @llvm.dbg.declare(metadata i32** %4, metadata !55, metadata !DIExpression()), !dbg !56
  store i32* %1, i32** %5, align 8
  call void @llvm.dbg.declare(metadata i32** %5, metadata !57, metadata !DIExpression()), !dbg !56
  store [1000 x i32]* %2, [1000 x i32]** %6, align 8
  call void @llvm.dbg.declare(metadata [1000 x i32]** %6, metadata !58, metadata !DIExpression()), !dbg !59
  %18 = load [1000 x i32]*, [1000 x i32]** %6, align 8, !dbg !60
  call void @llvm.dbg.declare(metadata i32* %7, metadata !61, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i32* %9, metadata !62, metadata !DIExpression()), !dbg !56
  store i32 0, i32* %9, align 4, !dbg !63
  call void @llvm.dbg.declare(metadata i32* %10, metadata !64, metadata !DIExpression()), !dbg !56
  store i32 999, i32* %10, align 4, !dbg !63
  call void @llvm.dbg.declare(metadata i32* %11, metadata !65, metadata !DIExpression()), !dbg !56
  store i32 1, i32* %11, align 4, !dbg !63
  call void @llvm.dbg.declare(metadata i32* %12, metadata !66, metadata !DIExpression()), !dbg !56
  store i32 0, i32* %12, align 4, !dbg !63
  call void @llvm.dbg.declare(metadata i32* %13, metadata !67, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i32* %14, metadata !67, metadata !DIExpression()), !dbg !56
  %19 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %15, i32 0, i32 4, !dbg !60
  store i8* getelementptr inbounds ([25 x i8], [25 x i8]* @1, i32 0, i32 0), i8** %19, align 8, !dbg !60
  %20 = load i32*, i32** %4, align 8, !dbg !60
  %21 = load i32, i32* %20, align 4, !dbg !60
  call void @__kmpc_for_static_init_4(%struct.ident_t* %15, i32 %21, i32 34, i32* %12, i32* %9, i32* %10, i32* %11, i32 1, i32 1), !dbg !60
  %22 = load i32, i32* %10, align 4, !dbg !63
  %23 = icmp sgt i32 %22, 999, !dbg !63
  br i1 %23, label %24, label %25, !dbg !63

24:                                               ; preds = %3
  br label %27, !dbg !63

25:                                               ; preds = %3
  %26 = load i32, i32* %10, align 4, !dbg !63
  br label %27, !dbg !63

27:                                               ; preds = %25, %24
  %28 = phi i32 [ 999, %24 ], [ %26, %25 ], !dbg !63
  store i32 %28, i32* %10, align 4, !dbg !63
  %29 = load i32, i32* %9, align 4, !dbg !63
  store i32 %29, i32* %7, align 4, !dbg !63
  br label %30, !dbg !60

30:                                               ; preds = %43, %27
  %31 = load i32, i32* %7, align 4, !dbg !63
  %32 = load i32, i32* %10, align 4, !dbg !63
  %33 = icmp sle i32 %31, %32, !dbg !60
  br i1 %33, label %34, label %46, !dbg !60

34:                                               ; preds = %30
  %35 = load i32, i32* %7, align 4, !dbg !63
  %36 = mul nsw i32 %35, 1, !dbg !68
  %37 = add nsw i32 0, %36, !dbg !68
  store i32 %37, i32* %13, align 4, !dbg !68
  %38 = load i32, i32* %13, align 4, !dbg !69
  %39 = load i32, i32* %13, align 4, !dbg !71
  %40 = sext i32 %39 to i64, !dbg !72
  %41 = getelementptr inbounds [1000 x i32], [1000 x i32]* %18, i64 0, i64 %40, !dbg !72
  store i32 %38, i32* %41, align 4, !dbg !73
  br label %42, !dbg !74

42:                                               ; preds = %34
  br label %43, !dbg !75

43:                                               ; preds = %42
  %44 = load i32, i32* %7, align 4, !dbg !63
  %45 = add nsw i32 %44, 1, !dbg !60
  store i32 %45, i32* %7, align 4, !dbg !60
  br label %30, !dbg !75, !llvm.loop !76

46:                                               ; preds = %30
  br label %47, !dbg !75

47:                                               ; preds = %46
  %48 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %15, i32 0, i32 4, !dbg !75
  store i8* getelementptr inbounds ([26 x i8], [26 x i8]* @2, i32 0, i32 0), i8** %48, align 8, !dbg !75
  call void @__kmpc_for_static_fini(%struct.ident_t* %15, i32 %21), !dbg !75
  ret void, !dbg !78
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare dso_local void @__kmpc_for_static_fini(%struct.ident_t*, i32)

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined.(i32* noalias %0, i32* noalias %1, [1000 x i32]* dereferenceable(4000) %2) #2 !dbg !79 {
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca [1000 x i32]*, align 8
  store i32* %0, i32** %4, align 8
  call void @llvm.dbg.declare(metadata i32** %4, metadata !80, metadata !DIExpression()), !dbg !81
  store i32* %1, i32** %5, align 8
  call void @llvm.dbg.declare(metadata i32** %5, metadata !82, metadata !DIExpression()), !dbg !81
  store [1000 x i32]* %2, [1000 x i32]** %6, align 8
  call void @llvm.dbg.declare(metadata [1000 x i32]** %6, metadata !83, metadata !DIExpression()), !dbg !81
  %7 = load [1000 x i32]*, [1000 x i32]** %6, align 8, !dbg !84
  %8 = load i32*, i32** %4, align 8, !dbg !84
  %9 = load i32*, i32** %5, align 8, !dbg !84
  %10 = load [1000 x i32]*, [1000 x i32]** %6, align 8, !dbg !84
  call void @.omp_outlined._debug__(i32* %8, i32* %9, [1000 x i32]* %10) #5, !dbg !84
  ret void, !dbg !84
}

declare !callback !85 dso_local void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...)

declare dso_local i32 @printf(i8*, ...) #4

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noinline norecurse nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

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
!20 = !DILocation(line: 14, column: 5, scope: !7)
!21 = !DILocation(line: 21, column: 12, scope: !22)
!22 = distinct !DILexicalBlock(scope: !7, file: !1, line: 21, column: 5)
!23 = !DILocation(line: 21, column: 10, scope: !22)
!24 = !DILocation(line: 21, column: 17, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !1, line: 21, column: 5)
!26 = !DILocation(line: 21, column: 19, scope: !25)
!27 = !DILocation(line: 21, column: 5, scope: !22)
!28 = !DILocation(line: 23, column: 15, scope: !29)
!29 = distinct !DILexicalBlock(scope: !30, file: !1, line: 23, column: 13)
!30 = distinct !DILexicalBlock(scope: !25, file: !1, line: 22, column: 5)
!31 = !DILocation(line: 23, column: 13, scope: !29)
!32 = !DILocation(line: 23, column: 20, scope: !29)
!33 = !DILocation(line: 23, column: 18, scope: !29)
!34 = !DILocation(line: 23, column: 13, scope: !30)
!35 = !DILocation(line: 24, column: 24, scope: !29)
!36 = !DILocation(line: 24, column: 22, scope: !29)
!37 = !DILocation(line: 24, column: 20, scope: !29)
!38 = !DILocation(line: 24, column: 13, scope: !29)
!39 = !DILocation(line: 25, column: 5, scope: !30)
!40 = !DILocation(line: 21, column: 28, scope: !25)
!41 = !DILocation(line: 21, column: 5, scope: !25)
!42 = distinct !{!42, !27, !43}
!43 = !DILocation(line: 25, column: 5, scope: !22)
!44 = !DILocation(line: 27, column: 25, scope: !7)
!45 = !DILocation(line: 27, column: 5, scope: !7)
!46 = !DILocation(line: 28, column: 5, scope: !7)
!47 = distinct !DISubprogram(name: ".omp_outlined._debug__", scope: !1, file: !1, line: 15, type: !48, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DISubroutineType(types: !49)
!49 = !{null, !50, !50, !54}
!50 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !51)
!51 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !52)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 64)
!53 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!54 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !12, size: 64)
!55 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !47, type: !50, flags: DIFlagArtificial)
!56 = !DILocation(line: 0, scope: !47)
!57 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !47, type: !50, flags: DIFlagArtificial)
!58 = !DILocalVariable(name: "A", arg: 3, scope: !47, file: !1, line: 9, type: !54)
!59 = !DILocation(line: 9, column: 9, scope: !47)
!60 = !DILocation(line: 15, column: 5, scope: !47)
!61 = !DILocalVariable(name: ".omp.iv", scope: !47, type: !10, flags: DIFlagArtificial)
!62 = !DILocalVariable(name: ".omp.lb", scope: !47, type: !10, flags: DIFlagArtificial)
!63 = !DILocation(line: 15, column: 10, scope: !47)
!64 = !DILocalVariable(name: ".omp.ub", scope: !47, type: !10, flags: DIFlagArtificial)
!65 = !DILocalVariable(name: ".omp.stride", scope: !47, type: !10, flags: DIFlagArtificial)
!66 = !DILocalVariable(name: ".omp.is_last", scope: !47, type: !10, flags: DIFlagArtificial)
!67 = !DILocalVariable(name: "i", scope: !47, type: !10, flags: DIFlagArtificial)
!68 = !DILocation(line: 15, column: 24, scope: !47)
!69 = !DILocation(line: 17, column: 16, scope: !70)
!70 = distinct !DILexicalBlock(scope: !47, file: !1, line: 16, column: 5)
!71 = !DILocation(line: 17, column: 11, scope: !70)
!72 = !DILocation(line: 17, column: 9, scope: !70)
!73 = !DILocation(line: 17, column: 14, scope: !70)
!74 = !DILocation(line: 18, column: 5, scope: !70)
!75 = !DILocation(line: 14, column: 5, scope: !47)
!76 = distinct !{!76, !75, !77}
!77 = !DILocation(line: 14, column: 40, scope: !47)
!78 = !DILocation(line: 18, column: 5, scope: !47)
!79 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 15, type: !48, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!80 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !79, type: !50, flags: DIFlagArtificial)
!81 = !DILocation(line: 0, scope: !79)
!82 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !79, type: !50, flags: DIFlagArtificial)
!83 = !DILocalVariable(name: "A", arg: 3, scope: !79, type: !54, flags: DIFlagArtificial)
!84 = !DILocation(line: 15, column: 5, scope: !79)
!85 = !{!86}
!86 = !{i64 2, i64 -1, i64 -1, i1 true}
