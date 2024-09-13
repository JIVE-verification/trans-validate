; ModuleID = 'forloopomp.cpp'
source_filename = "forloopomp.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@arr = dso_local global [100 x i32] zeroinitializer, align 16
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8


; Function Attrs: mustprogress noinline norecurse nounwind optnone uwtable
define dso_local noundef i32 @main(i32 noundef %0, i8** noundef %1) #1 {
  //the instructions below were the contents in the @main.omp_outlined
  //this ir was compiled with clang-14 (some lib calls were not supported by alive2 when compiled with clang-20 at the time of this analysis)

  //allocate space for i32
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
 
  //store 0 to %7
  store i32 0, i32* %7, align 4

  //store 99 to %8
  store i32 99, i32* %8, align 4

  //store 1 to %9
  store i32 1, i32* %9, align 4

  //store 0 to %10
  store i32 0, i32* %10, align 4
 
  //%14 = 99
  %14 = load i32, i32* %8, align 4

  //if %14 > 99, jump to %16. Otherwise, jump to %17
  %15 = icmp sgt i32 %14, 99
  br i1 %15, label %16, label %17

16:                                               ; preds = %2
  //jump to block 19 
  br label %19

17:                                               ; preds = %2
  //%18 = %8 // %18 gets 99 in the first iter
  %18 = load i32, i32* %8, align 4
  br label %19

19:                                               ; preds = %17, %16
  //if we jumped from %17, then %20 = %18 = 99
  %20 = phi i32 [ 99, %16 ], [ %18, %17 ]

  //store %20=99 to %8
  store i32 %20, i32* %8, align 4 

  //%21 = %7 = 0
  %21 = load i32, i32* %7, align 4

  //%5 = %21 = 0
  store i32 %21, i32* %5, align 4
  br label %22

22:                                               ; preds = %36, %19
  //%23 = %5 = 0
  %23 = load i32, i32* %5, align 4
  
  //%24 = %8 = 99
  %24 = load i32, i32* %8, align 4

  //if %23 <= %24 (0 <= 99), jump to %26
  %25 = icmp sle i32 %23, %24
  br i1 %25, label %26, label %39

26:                                               ; preds = %22
  //%27 = %5 = 0
  %27 = load i32, i32* %5, align 4

  //%28 = %27*1
  %28 = mul nsw i32 %27, 1

  //%29 = 0 + %28
  %29 = add nsw i32 0, %28

  //%11 = %29 = 0
  store i32 %29, i32* %11, align 4

  //%30 = %11 = 0
  %30 = load i32, i32* %11, align 4

  //%31 = 20*%30 = 20*0
  %31 = mul nsw i32 20, %30

  //%32 = 0
  %32 = load i32, i32* %11, align 4

  //%33 = sign extend of %32
  %33 = sext i32 %32 to i64

  //%34 = pointer to arr[%33]
                            // type       ,ptr_type base_addr, base_addr, index 
  %34 = getelementptr inbounds [100 x i32], [100 x i32]* @arr, i64 0, i64 %33
  
  //store %31 to arr[%33]
  store i32 %31, i32* %34, align 4
  br label %35

35:                                               ; preds = %26
  br label %36

36:                                               ; preds = %35
  
  //%37 = %5 = 0 
  %37 = load i32, i32* %5, align 4
  //%38 = %37 + 1
  %38 = add nsw i32 %37, 1

  //%5 = %38 = 1
  store i32 %38, i32* %5, align 4
  br label %22

39:                                               ; preds = %22
  //exit-loop
  br label %40

40:                                               ; preds = %39
  ret i32 0
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
