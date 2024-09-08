; ModuleID = 'foromp.c'
source_filename = "foromp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @omp_set_num_threads(i32 noundef 2)
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* @2, i32 0, void (i32*, i32*, ...)* bitcast (void (i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*))
  ret i32 0
}

declare void @omp_set_num_threads(i32 noundef) #1

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined.(i32* noalias noundef %0, i32* noalias noundef %1) #2 {
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i32* %1, i32** %4, align 8

  store i32 0, i32* %7, align 4
  store i32 2147483646, i32* %8, align 4
  store i32 1, i32* %9, align 4
  store i32 0, i32* %10, align 4

  %12 = load i32*, i32** %3, align 8
  %13 = load i32, i32* %12, align 4
  
  //implementation in kmp_csupport.c
  //args: source code location, global thread id, scheduling type, pointer to the "last iteration" flag,
  //      poiter to lower bound, pointer to the upper bound, pointer to the stride, loop increment, chunk size
  //chunk size = loop_count/number_of_threads
  //difference between a stride and a loop increment?
  call void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %13, i32 34, i32* %10, i32* %7, i32* %8, i32* %9, i32 1, i32 1)
  
  //%10 last iteration = 0
  //%7 lower bound = 0 
  //%8 upper bound = INT_MAX -1
  //%9 stride = 1
  //why is chunk size 1???


  %14 = load i32, i32* %8, align 4
  %15 = icmp sgt i32 %14, 2147483646 // %14==INT_MAX-1 < INT_MAX -1
  br i1 %15, label %16, label %17 //always jump to %17

16:                                               ; preds = %2
  br label %19 //jump to 19

17:                                               ; preds = %2
  %18 = load i32, i32* %8, align 4 //%18 = INT_MAX - 1
  br label %19 //jumo to %19

19:                                               ; preds = %17, %16
  %20 = phi i32 [ 2147483646, %16 ], [ %18, %17 ] //%20 gets INT_MAX - 1 from %17
  store i32 %20, i32* %8, align 4 //%8 = INT_MAX - 1
  %21 = load i32, i32* %7, align 4 //%21 = 0
  store i32 %21, i32* %5, align 4 // %5 = 0
  br label %22 //jump to label 22

22:                                               ; preds = %31, %19
  
  %23 = load i32, i32* %5, align 4 //%23 = 0
  %24 = load i32, i32* %8, align 4 //%24 = INT_MAX-1
  %25 = icmp sle i32 %23, %24 // %23 <= %24 
  br i1 %25, label %26, label %34 // if above is true, then jump to label 26, otherwise label 34

26:                                               ; preds = %22
  
  %27 = load i32, i32* %5, align 4 //%27 = 0
  %28 = mul nsw i32 %27, 1 // %28 = 0*1 ???
  %29 = add nsw i32 0, %28 // %29 = 0 + 0
  store i32 %29, i32* %11, align 4 // %11 = 0
  br label %30 //jump to label 30

30:                                               ; preds = %26
  br label %31 //jump to 31

31:                                               ; preds = %30
  
  %32 = load i32, i32* %5, align 4 //%32 = 0
  %33 = add nsw i32 %32, 1  //%33 = 0 + 1
  store i32 %33, i32* %5, align 4 // %5 = 1 //%5 is the loop index var
  br label %22 // jump to 22

34:                                               ; preds = %22
  //loop has reached the limit and jumped to here
  br label %35 //jump to 35

35:                                               ; preds = %34
  //loop finished
  call void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %13)
  ret void
}

declare void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(%struct.ident_t*, i32) #3

; Function Attrs: nounwind
declare !callback !7 void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline norecurse nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

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
