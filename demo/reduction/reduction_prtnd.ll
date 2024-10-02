; ModuleID = 'reduction.cpp'
source_filename = "reduction.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress noinline nounwind optnone uwtable ptr noundef %v2
define dso_local i32 @_Z9reductionPi() #0 { ;start of function
entry:
  %v = alloca i32, align 4    ; int v
  store i32 0, ptr %v, align 4          ; v = 0
  ;=========================Start_Of_Global_Region===================================
  %vptrt1 = alloca ptr, align 8
  %vptrt2 = alloca ptr, align 8
  ;=========================End_Of_Global_Region=====================================
 

  ;========================START_OF_PARTITION_1====================================
  %v1 = alloca i32, align 4 ;local to thread
  %i = alloca i32, align 4  ;local to thread
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4

  store i32 0, ptr %.omp.lb, align 4    ;change for each partition
  store i32 4, ptr %.omp.ub, align 4    ;change for each partition
  store i32 0, ptr %i, align 4
  store i32 0, ptr %v1, align 4 ; %v1 = 0
  
  %3 = load i32, ptr %.omp.ub, align 4
  %cmp = icmp sgt i32 %3, 9
  br i1 %cmp, label %cond.true.one, label %cond.false.one

cond.true.one:                                        ; preds = %entry
  br label %cond.end.one

cond.false.one:                                       ; preds = %entry
  %4 = load i32, ptr %.omp.ub, align 4  ; %4 = 9
  br label %cond.end.one

cond.end.one:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 9, %cond.true.one ], [ %4, %cond.false.one ]  ;%cond = %4 = 9
  store i32 %cond, ptr %.omp.ub, align 4    ; %omp.ub = %cond = %4 = 9
  %5 = load i32, ptr %.omp.lb, align 4      ; %5= %omp.lb = 0
  store i32 %5, ptr %i, align 4       ; %i = %5 = 0 ; iter-val?
  br label %omp.inner.for.cond.one

omp.inner.for.cond.one:                               ; preds = %omp.inner.for.inc, %cond.end
  %6 = load i32, ptr %i, align 4      ;%6 = 0
  %7 = load i32, ptr %.omp.ub, align 4      ;%7 = 9
  %cmp2 = icmp sle i32 %6, %7               ; %6 <= %7
  br i1 %cmp2, label %omp.inner.for.body.one, label %omp.inner.for.end.one

omp.inner.for.body.one:                               ; preds = %omp.inner.for.cond
  %8 = load i32, ptr %i, align 4  ;%8 = %i = 0
  %mul = mul nsw i32 %8, 1
  %add = add nsw i32 0, %mul
  store i32 %add, ptr %i, align 4
  %9 = load i32, ptr %i, align 4 ; %9 = i = 0
  %10 = load i32, ptr %v1, align 4  ; %10 = %v1 = 0
  %add3 = add nsw i32 %10, %9 ; %add3 = %9 + %10 = 0
  store i32 %add3, ptr %v1, align 4 ; %v1 = %add3
  br label %omp.body.continue.one

omp.body.continue.one:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc.one

omp.inner.for.inc.one:                                ; preds = %omp.body.continue
  %11 = load i32, ptr %i, align 4 ;%11 = %omp.iv = 0
  %add4 = add nsw i32 %11, 1        ; %add4= %11 + 1 = 1
  store i32 %add4, ptr %i, align 4  ; %omp.iv = %add4 = 1
  br label %omp.inner.for.cond.one

omp.inner.for.end.one:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit.one

omp.loop.exit.one:                                    ; preds = %omp.inner.for.end 
  br label %.omp.reduction.default.one

.omp.reduction.default.one:                           ; preds = %.omp.reduction.case2, %.omp.reduction.case1, %omp.loop.exit
  store ptr %v1, ptr %vptrt1, align 8
  br label %partition.two
  ;========================END_OF_PARTITION_1======================================

  ;========================START_OF_PARTITION_2====================================
partition.two:
  %.omp.lb_n = alloca i32, align 4
  %.omp.ub_n = alloca i32, align 4
  %v1_n = alloca i32, align 4 ;local to thread
  %i_n = alloca i32, align 4  ;local to thread
  
  store i32 5, ptr %.omp.lb_n, align 4    ;change for each partition
  store i32 9, ptr %.omp.ub_n, align 4    ;change for each partition
  store i32 0, ptr %v1_n, align 4
  store i32 5, ptr %i_n, align 4 
  
  %19 = load i32, ptr %.omp.ub_n, align 4
  %cmp_n = icmp sgt i32 %19, 9
  br i1 %cmp_n, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %20 = load i32, ptr %.omp.ub_n, align 4  
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond_n = phi i32 [ 9, %cond.true ], [ %20, %cond.false ]  ;%cond = %20 = 9
  store i32 %cond_n, ptr %.omp.ub_n, align 4    ; %omp.ub = %cond = %4 = 9
  %21 = load i32, ptr %.omp.lb_n, align 4      ; %5= %omp.lb = 0
  store i32 %21, ptr %i_n, align 4       ; %omp.iv = %5 = 0 ; iter-val?
  br label %omp.inner.for.cond

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %22 = load i32, ptr %i_n, align 4      ;%6 = 0
  %23 = load i32, ptr %.omp.ub_n, align 4      ;%7 = 9
  %cmp2_n = icmp sle i32 %22, %23               ; %6 <= %7
  br i1 %cmp2_n, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %24 = load i32, ptr %i_n, align 4  ;%8 = %omp.iv = 0
  %mul_n = mul nsw i32 %24, 1
  %add_n = add nsw i32 0, %mul_n
  store i32 %add_n, ptr %i_n, align 4
  %25 = load i32, ptr %i_n, align 4 ; %9 = i = 0
  %26 = load i32, ptr %v1_n, align 4  ; %10 = %v1 = 0
  %add3_n = add nsw i32 %26, %25 ; %add3 = %9 + %10 = 0
  store i32 %add3_n, ptr %v1_n, align 4 ; %v1 = %add3
  br label %omp.body.continue

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %27 = load i32, ptr %i_n, align 4 ;%11 = %omp.iv = 0
  %add4_n = add nsw i32 %27, 1        ; %add4= %11 + 1 = 1
  store i32 %add4_n, ptr %i_n, align 4  ; %omp.iv = %add4 = 1
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit

omp.loop.exit:                                    ; preds = %omp.inner.for.end 
  store ptr %v1_n, ptr %vptrt2, align 8
  br label %.omp.reduction.default

.omp.reduction.default:                           ; preds = %.omp.reduction.case2, %.omp.reduction.case1, %omp.loop.exit
  br label %ret.of.function

  ;========================END_OF_PARTITION_2======================================

ret.of.function:
  %30 = load ptr, ptr %vptrt1, align 8
  %31 = load i32, ptr %30, align 4

  %32 = load ptr, ptr %vptrt2, align 8
  %33 = load i32, ptr %32, align 4

  %34 = add nsw i32 %31, %33
  store i32 %34, ptr %v, align 4         ; %1 = %z
  ret i32 %34
}



attributes #0 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }


!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"openmp", i32 51}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{!"clang version 20.0.0git (https://github.com/llvm/llvm-project.git 0f521931b85e6b5f798af357cf32a7ae782a848d)"}
!7 = !{!8}
!8 = !{i64 2, i64 -1, i64 -1, i1 true}
