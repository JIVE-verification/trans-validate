; ModuleID = 'func3_omp.cpp'
source_filename = "func3_omp.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8

; Function Attrs: mustprogress noinline norecurse nounwind optnone uwtable
define dso_local noundef i32 @main(i32 noundef %0, i8** noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca [100 x i32], align 16
  %7 = alloca [100 x i32], align 16
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* @2, i32 3, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, [100 x i32]*, i32*, [100 x i32]*)* @.omp_outlined. to void (i32*, i32*, ...)*), [100 x i32]* %6, i32* %4, [100 x i32]* %7)
  %8 = getelementptr inbounds [100 x i32], [100 x i32]* %6, i64 0, i64 20
  %9 = load i32, i32* %8, align 16
  ret i32 %9
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined.(i32* noalias noundef %0, i32* noalias noundef %1, [100 x i32]* noundef nonnull align 4 dereferenceable(400) %2, i32* noundef nonnull align 4 dereferenceable(4) %3, [100 x i32]* noundef nonnull align 4 dereferenceable(400) %4) #1 {
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca [100 x i32]*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca [100 x i32]*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32* %0, i32** %6, align 8
  store i32* %1, i32** %7, align 8
  store [100 x i32]* %2, [100 x i32]** %8, align 8
  store i32* %3, i32** %9, align 8
  store [100 x i32]* %4, [100 x i32]** %10, align 8
  %18 = load [100 x i32]*, [100 x i32]** %8, align 8
  %19 = load i32*, i32** %9, align 8
  %20 = load [100 x i32]*, [100 x i32]** %10, align 8
  store i32 0, i32* %13, align 4
  store i32 99, i32* %14, align 4
  store i32 1, i32* %15, align 4
  store i32 0, i32* %16, align 4
  %21 = load i32*, i32** %6, align 8
  %22 = load i32, i32* %21, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %22, i32 34, i32* %16, i32* %13, i32* %14, i32* %15, i32 1, i32 1)
  %23 = load i32, i32* %14, align 4
  %24 = icmp sgt i32 %23, 99
  br i1 %24, label %25, label %26

25:                                               ; preds = %5
  br label %28

26:                                               ; preds = %5
  %27 = load i32, i32* %14, align 4
  br label %28

28:                                               ; preds = %26, %25
  %29 = phi i32 [ 99, %25 ], [ %27, %26 ]
  store i32 %29, i32* %14, align 4
  %30 = load i32, i32* %13, align 4
  store i32 %30, i32* %11, align 4
  br label %31

31:                                               ; preds = %54, %28
  %32 = load i32, i32* %11, align 4
  %33 = load i32, i32* %14, align 4
  %34 = icmp sle i32 %32, %33
  br i1 %34, label %35, label %57

35:                                               ; preds = %31
  %36 = load i32, i32* %11, align 4
  %37 = mul nsw i32 %36, 1
  %38 = add nsw i32 0, %37
  store i32 %38, i32* %17, align 4
  %39 = load i32, i32* %17, align 4
  %40 = mul nsw i32 %39, 30
  %41 = load i32, i32* %19, align 4
  %42 = mul nsw i32 %40, %41
  %43 = load i32, i32* %17, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [100 x i32], [100 x i32]* %18, i64 0, i64 %44
  store i32 %42, i32* %45, align 4
  %46 = load i32, i32* %17, align 4
  %47 = mul nsw i32 %46, 20
  %48 = load i32, i32* %19, align 4
  %49 = mul nsw i32 %47, %48
  %50 = load i32, i32* %17, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [100 x i32], [100 x i32]* %20, i64 0, i64 %51
  store i32 %49, i32* %52, align 4
  br label %53

53:                                               ; preds = %35
  br label %54

54:                                               ; preds = %53
  %55 = load i32, i32* %11, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %11, align 4
  br label %31

57:                                               ; preds = %31
  br label %58

58:                                               ; preds = %57
  call void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %22)
  ret void
}

declare void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(%struct.ident_t*, i32) #2

; Function Attrs: nounwind
declare !callback !7 void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) #2

attributes #0 = { mustprogress noinline norecurse nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noinline norecurse nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"openmp", i32 50}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!7 = !{!8}
!8 = !{i64 2, i64 -1, i64 -1, i1 true}
