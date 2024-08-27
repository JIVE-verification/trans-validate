; ModuleID = 'red-2.c'
source_filename = "red-2.c"
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
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  store i32 0, i32* %4, align 4
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* @2, i32 2, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* %2, i32* %4)
  %5 = load i32, i32* %4, align 4
  %6 = icmp ne i32 %5, 24768
  br i1 %6, label %7, label %8

7:                                                ; preds = %0
  call void @abort() #4
  unreachable

8:                                                ; preds = %0
  ret i32 0
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined.(i32* noalias %0, i32* noalias %1, i32* dereferenceable(4) %2, i32* dereferenceable(4) %3) #1 {
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca [2 x i8*], align 8
  store i32* %0, i32** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32* %2, i32** %7, align 8
  store i32* %3, i32** %8, align 8
  %19 = load i32*, i32** %7, align 8
  %20 = load i32*, i32** %8, align 8
  store i32 0, i32* %11, align 4
  store i32 127, i32* %12, align 4
  store i32 1, i32* %13, align 4
  store i32 0, i32* %14, align 4
  store i32 0, i32* %15, align 4
  store i32 0, i32* %16, align 4
  %21 = load i32*, i32** %5, align 8
  %22 = load i32, i32* %21, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @0, i32 %22, i32 34, i32* %14, i32* %11, i32* %12, i32* %13, i32 1, i32 1)
  %23 = load i32, i32* %12, align 4
  %24 = icmp sgt i32 %23, 127
  br i1 %24, label %25, label %26

25:                                               ; preds = %4
  br label %28

26:                                               ; preds = %4
  %27 = load i32, i32* %12, align 4
  br label %28

28:                                               ; preds = %26, %25
  %29 = phi i32 [ 127, %25 ], [ %27, %26 ]
  store i32 %29, i32* %12, align 4
  %30 = load i32, i32* %11, align 4
  store i32 %30, i32* %9, align 4
  br label %31

31:                                               ; preds = %45, %28
  %32 = load i32, i32* %9, align 4
  %33 = load i32, i32* %12, align 4
  %34 = icmp sle i32 %32, %33
  br i1 %34, label %35, label %48

35:                                               ; preds = %31
  %36 = load i32, i32* %9, align 4
  %37 = mul nsw i32 %36, 1
  %38 = add nsw i32 0, %37
  store i32 %38, i32* %17, align 4
  %39 = load i32, i32* %15, align 4
  %40 = add nsw i32 %39, 3
  store i32 %40, i32* %15, align 4
  %41 = load i32, i32* %16, align 4
  %42 = load i32, i32* %15, align 4
  %43 = add nsw i32 %41, %42
  store i32 %43, i32* %16, align 4
  br label %44

44:                                               ; preds = %35
  br label %45

45:                                               ; preds = %44
  %46 = load i32, i32* %9, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %9, align 4
  br label %31

48:                                               ; preds = %31
  br label %49

49:                                               ; preds = %48
  call void @__kmpc_for_static_fini(%struct.ident_t* @0, i32 %22)
  %50 = getelementptr inbounds [2 x i8*], [2 x i8*]* %18, i64 0, i64 0
  %51 = bitcast i32* %15 to i8*
  store i8* %51, i8** %50, align 8
  %52 = getelementptr inbounds [2 x i8*], [2 x i8*]* %18, i64 0, i64 1
  %53 = bitcast i32* %16 to i8*
  store i8* %53, i8** %52, align 8
  %54 = bitcast [2 x i8*]* %18 to i8*
  %55 = call i32 @__kmpc_reduce_nowait(%struct.ident_t* @1, i32 %22, i32 2, i64 16, i8* %54, void (i8*, i8*)* @.omp.reduction.reduction_func, [8 x i32]* @.gomp_critical_user_.reduction.var)
  switch i32 %55, label %68 [
    i32 1, label %56
    i32 2, label %63
  ]

56:                                               ; preds = %49
  %57 = load i32, i32* %19, align 4
  %58 = load i32, i32* %15, align 4
  %59 = add nsw i32 %57, %58
  store i32 %59, i32* %19, align 4
  %60 = load i32, i32* %20, align 4
  %61 = load i32, i32* %16, align 4
  %62 = add nsw i32 %60, %61
  store i32 %62, i32* %20, align 4
  call void @__kmpc_end_reduce_nowait(%struct.ident_t* @1, i32 %22, [8 x i32]* @.gomp_critical_user_.reduction.var)
  br label %68

63:                                               ; preds = %49
  %64 = load i32, i32* %15, align 4
  %65 = atomicrmw add i32* %19, i32 %64 monotonic
  %66 = load i32, i32* %16, align 4
  %67 = atomicrmw add i32* %20, i32 %66 monotonic
  br label %68

68:                                               ; preds = %63, %56, %49
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
  %6 = bitcast i8* %5 to [2 x i8*]*
  %7 = load i8*, i8** %4, align 8
  %8 = bitcast i8* %7 to [2 x i8*]*
  %9 = getelementptr inbounds [2 x i8*], [2 x i8*]* %8, i64 0, i64 0
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast i8* %10 to i32*
  %12 = getelementptr inbounds [2 x i8*], [2 x i8*]* %6, i64 0, i64 0
  %13 = load i8*, i8** %12, align 8
  %14 = bitcast i8* %13 to i32*
  %15 = getelementptr inbounds [2 x i8*], [2 x i8*]* %8, i64 0, i64 1
  %16 = load i8*, i8** %15, align 8
  %17 = bitcast i8* %16 to i32*
  %18 = getelementptr inbounds [2 x i8*], [2 x i8*]* %6, i64 0, i64 1
  %19 = load i8*, i8** %18, align 8
  %20 = bitcast i8* %19 to i32*
  %21 = load i32, i32* %14, align 4
  %22 = load i32, i32* %11, align 4
  %23 = add nsw i32 %21, %22
  store i32 %23, i32* %14, align 4
  %24 = load i32, i32* %20, align 4
  %25 = load i32, i32* %17, align 4
  %26 = add nsw i32 %24, %25
  store i32 %26, i32* %20, align 4
  ret void
}

declare dso_local i32 @__kmpc_reduce_nowait(%struct.ident_t*, i32, i32, i64, i8*, void (i8*, i8*)*, [8 x i32]*)

declare dso_local void @__kmpc_end_reduce_nowait(%struct.ident_t*, i32, [8 x i32]*)

declare !callback !2 dso_local void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...)

; Function Attrs: noreturn nounwind
declare dso_local void @abort() #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
!2 = !{!3}
!3 = !{i64 2, i64 -1, i64 -1, i1 true}
