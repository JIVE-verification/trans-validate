; ModuleID = 'red-1.c'
source_filename = "red-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr global %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer
@1 = private unnamed_addr global %struct.ident_t { i32 0, i32 18, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@2 = private unnamed_addr global %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 10, i32* %2, align 4
  ;call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* @2, i32 1, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* %3)
  store i32 20, i32* %2, align 4
  ret i32 0
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined.(i32* noalias %0, i32* noalias %1, i32* dereferenceable(4) %2) #1 {
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4 ; probably int a
  %14 = alloca i32, align 4
  %15 = alloca [1 x i8*], align 8
  store i32* %0, i32** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32* %2, i32** %6, align 8
  %16 = load i32*, i32** %6, align 8
  store i32 0, i32* %9, align 4 ; %9 = 0 
  store i32 9, i32* %10, align 4 ; %10 = 9
  store i32 1, i32* %11, align 4 ; %11 = 1
  store i32 0, i32* %12, align 4 ; %12 = 0
  store i32 0, i32* %13, align 4 ; %13 = 0
  %17 = load i32*, i32** %4, align 8 
  %18 = load i32, i32* %17, align 4
  ;call void @__kmpc_for_static_init_4(%struct.ident_t* @0, i32 %18, i32 34, i32* %12, i32* %9, i32* %10, i32* %11, i32 1, i32 1)
  %19 = load i32, i32* %10, align 4 ; %19 = 9
  %20 = icmp sgt i32 %19, 9 
  br i1 %20, label %21, label %22 ; jump to %22

21:                                               ; preds = %3
  br label %24

22:                                               ; preds = %3
  %23 = load i32, i32* %10, align 4 ; %23 = 9
  br label %24

24:                                               ; preds = %22, %21
  %25 = phi i32 [ 9, %21 ], [ %23, %22 ]  ; came from %22, so %25 = %23 = 9
  store i32 %25, i32* %10, align 4        ; %10 = %25 = 9
  %26 = load i32, i32* %9, align 4        ; %26 = %9 = 0
  store i32 %26, i32* %7, align 4         ; %7 = %26 = 0
  br label %27  ; jump to %27

27:                                               ; preds = %38, %24
  %28 = load i32, i32* %7, align 4  ; %28 = %7 = 0
  %29 = load i32, i32* %10, align 4 ; %29 = %10 = 9
  %30 = icmp sle i32 %28, %29       ; if %28 <= %29
  br i1 %30, label %31, label %41   ; jump to %31, otherwise jump to %41

31:                                               ; preds = %27
  %32 = load i32, i32* %7, align 4  ; %32 = %7 = 0
  %33 = mul nsw i32 %32, 1          ; %33 = %32*1 = 0*1
  %34 = add nsw i32 0, %33          ; %34 = %33 + 0 = 0 + 0 = 0
  store i32 %34, i32* %14, align 4  ; %14 = %34 = 0
  %35 = load i32, i32* %13, align 4 ; %35 = %13 = 0
  %36 = sub nsw i32 %35, 10         ; %36 = %35 - 10 = -10
  store i32 %36, i32* %13, align 4  ; %13 = %36 = -10
  br label %37                      ; jump to %37

37:                                               ; preds = %31
  br label %38                      ; jump to %38

38:                                               ; preds = %37
  %39 = load i32, i32* %7, align 4  ; %39 = %7 = 0
  %40 = add nsw i32 %39, 1          ; %40 = %49 + 1 = 1
  store i32 %40, i32* %7, align 4   ; %7 = %40 = 1 (%7 is induction var)
  br label %27                      ; jump to %27

41:                                               ; preds = %27
  br label %42                     ; end-of-loop

42:                                               ; preds = %41
  call void @__kmpc_for_static_fini(%struct.ident_t* @0, i32 %18)
  
  %43 = getelementptr inbounds [1 x i8*], [1 x i8*]* %15, i64 0, i64 0
  %44 = bitcast i32* %13 to i8*     ;cast int pointer(value: %13) to char pointer
  store i8* %44, i8** %43, align 8  ;%43 is storing %44
  %45 = bitcast [1 x i8*]* %15 to i8* ; %45 = (pointer to an array of pointers, bitcasted to char pointer)
 
  %46 = call i32 @__kmpc_reduce_nowait(%struct.ident_t* @1, i32 %18, i32 1, i64 8, i8* %45, void (i8*, i8*)* @.omp.reduction.reduction_func, [8 x i32]* @.gomp_critical_user_.reduction.var)
        ;location, threadID(%18), numVars(1), reduceSize(size of data to be reduced: 8 bytes),reduceData(%45),reduceFunc(omp.reduction.reduction_func) , lck(lck pointer to the unique lock data structure)
  
  switch i32 %46, label %54 [ ;switch-case like in c, the first label(%54) is the default
    i32 1, label %47
    i32 2, label %51
  ]

47:                                               ; preds = %42
  %48 = load i32, i32* %16, align 4
  %49 = load i32, i32* %13, align 4
  %50 = add nsw i32 %48, %49
  store i32 %50, i32* %16, align 4
  call void @__kmpc_end_reduce_nowait(%struct.ident_t* @1, i32 %18, [8 x i32]* @.gomp_critical_user_.reduction.var)
  br label %54

51:                                               ; preds = %42
  %52 = load i32, i32* %13, align 4
  %53 = atomicrmw add i32* %16, i32 %52 monotonic
  br label %54

54:                                               ; preds = %51, %47, %42
  ret void
}

declare dso_local void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare dso_local void @__kmpc_for_static_fini(%struct.ident_t*, i32)

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @.omp.reduction.reduction_func(i8* %0, i8* %1) #2 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = bitcast i8* %5 to [1 x i8*]*
  %7 = load i8*, i8** %4, align 8
  %8 = bitcast i8* %7 to [1 x i8*]*
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %8, i64 0, i64 0
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = getelementptr inbounds [1 x i8*], [1 x i8*]* %6, i64 0, i64 0
  %13 = load i8*, i8** %12, align 8
  %14 = bitcast i8* %13 to i32*
  %15 = load i32, i32* %14, align 4
  %16 = load i32, i32* %11, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, i32* %14, align 4
  ret void
}

declare dso_local i32 @__kmpc_reduce_nowait(%struct.ident_t*, i32, i32, i64, i8*, void (i8*, i8*)*, [8 x i32]*)

declare dso_local void @__kmpc_end_reduce_nowait(%struct.ident_t*, i32, [8 x i32]*)

declare !callback !2 dso_local void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
!2 = !{!3}
!3 = !{i64 2, i64 -1, i64 -1, i1 true}
