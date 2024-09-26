; ModuleID = 'reduction.cpp'
source_filename = "reduction.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, ptr }

@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, ptr @0 }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 18, i32 0, i32 22, ptr @0 }, align 8
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, ptr @0 }, align 8

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_Z9reductionPi(ptr noundef %v2) #0 { ;start of function
entry:
  %v2.addr = alloca ptr, align 8  ; v2.addr = ptr
  %v = alloca i32, align 4    ; int v
  store ptr %v2, ptr %v2.addr, align 8  ; store value of %v2 (param) to %v2.addr 
  store i32 0, ptr %v, align 4          ; v = 0

  ;=======================Start_Of_Globally_Required_Among_partitions==========================================
  %v.addr = alloca ptr, align 8
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  ;=======================End_Of_Globally_Required_Among_partitions==========================================
  

  ;========================START_OF_PARTITION_1====================================
  %v1 = alloca i32, align 4 ;local to thread
  %i = alloca i32, align 4  ;local to thread

  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8 ; %0 = %v
  store i32 0, ptr %.omp.lb, align 4    ;change for each partition
  store i32 4, ptr %.omp.ub, align 4    ;change for each partition
  store i32 1, ptr %.omp.stride, align 4
  store i32 0, ptr %.omp.is_last, align 4
  store i32 0, ptr %v1, align 4 ; %v1 = 0
  
  %2 = load i32, ptr %1, align 4

  %3 = load i32, ptr %.omp.ub, align 4
  %cmp = icmp sgt i32 %3, 9
  br i1 %cmp, label %cond.true.one, label %cond.false.one

  cond.true.one:                                        ; preds = %entry
  br label %cond.end.one

cond.false.one:                                       ; preds = %entry
  %4 = load i32, ptr %.omp.ub, align 4  ; %4 = 9
  br label %cond.end.one

cond.end.one:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 9, %cond.true ], [ %4, %cond.false ]  ;%cond = %4 = 9
  store i32 %cond, ptr %.omp.ub, align 4    ; %omp.ub = %cond = %4 = 9
  %5 = load i32, ptr %.omp.lb, align 4      ; %5= %omp.lb = 0
  store i32 %5, ptr %.omp.iv, align 4       ; %omp.iv = %5 = 0 ; iter-val?
  br label %omp.inner.for.cond.one

omp.inner.for.cond.one:                               ; preds = %omp.inner.for.inc, %cond.end
  %6 = load i32, ptr %.omp.iv, align 4      ;%6 = 0
  %7 = load i32, ptr %.omp.ub, align 4      ;%7 = 9
  %cmp2 = icmp sle i32 %6, %7               ; %6 <= %7
  br i1 %cmp2, label %omp.inner.for.body.one, label %omp.inner.for.end.one

omp.inner.for.body.one:                               ; preds = %omp.inner.for.cond
  %8 = load i32, ptr %.omp.iv, align 4  ;%8 = %omp.iv = 0
  %mul = mul nsw i32 %8, 1
  %add = add nsw i32 0, %mul
  store i32 %add, ptr %i, align 4
  %9 = load i32, ptr %i, align 4 ; %9 = i = 0
  %10 = load i32, ptr %v1, align 4  ; %10 = %v1 = 0
  %add3 = add nsw i32 %10, %9 ; %add3 = %9 + %10 = 0
  store i32 %add3, ptr %v1, align 4 ; %v1 = %add3
  br label %omp.body.continue.one

omp.body.continue.one:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc

omp.inner.for.inc.one:                                ; preds = %omp.body.continue
  %11 = load i32, ptr %.omp.iv, align 4 ;%11 = %omp.iv = 0
  %add4 = add nsw i32 %11, 1        ; %add4= %11 + 1 = 1
  store i32 %add4, ptr %.omp.iv, align 4  ; %omp.iv = %add4 = 1
  br label %omp.inner.for.cond.one

omp.inner.for.end.one:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit

omp.loop.exit.one:                                    ; preds = %omp.inner.for.end 
  %16 = load i32, ptr %v1, align 4
  %17 = atomicrmw add ptr %v, i32 %16 monotonic, align 4
  br label %.omp.reduction.default.one

.omp.reduction.default.one:                           ; preds = %.omp.reduction.case2, %.omp.reduction.case1, %omp.loop.exit
  ;br label %partition_two



  ;========================END_OF_PARTITION_1======================================

  ;========================START_OF_PARTITION_2====================================
partition_two:
  %v1 = alloca i32, align 4 ;local to thread
  %i = alloca i32, align 4  ;local to thread

  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8 ; %0 = %v
  store i32 5, ptr %.omp.lb, align 4    ;change for each partition
  store i32 9, ptr %.omp.ub, align 4    ;change for each partition
  store i32 1, ptr %.omp.stride, align 4
  store i32 0, ptr %.omp.is_last, align 4
  store i32 0, ptr %v1, align 4 ; %v1 = 0
  
  %2 = load i32, ptr %1, align 4

  %3 = load i32, ptr %.omp.ub, align 4
  %cmp = icmp sgt i32 %3, 9
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load i32, ptr %.omp.ub, align 4  ; %4 = 9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 9, %cond.true ], [ %4, %cond.false ]  ;%cond = %4 = 9
  store i32 %cond, ptr %.omp.ub, align 4    ; %omp.ub = %cond = %4 = 9
  %5 = load i32, ptr %.omp.lb, align 4      ; %5= %omp.lb = 0
  store i32 %5, ptr %.omp.iv, align 4       ; %omp.iv = %5 = 0 ; iter-val?
  br label %omp.inner.for.cond

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %6 = load i32, ptr %.omp.iv, align 4      ;%6 = 0
  %7 = load i32, ptr %.omp.ub, align 4      ;%7 = 9
  %cmp2 = icmp sle i32 %6, %7               ; %6 <= %7
  br i1 %cmp2, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %8 = load i32, ptr %.omp.iv, align 4  ;%8 = %omp.iv = 0
  %mul = mul nsw i32 %8, 1
  %add = add nsw i32 0, %mul
  store i32 %add, ptr %i, align 4
  %9 = load i32, ptr %i, align 4 ; %9 = i = 0
  %10 = load i32, ptr %v1, align 4  ; %10 = %v1 = 0
  %add3 = add nsw i32 %10, %9 ; %add3 = %9 + %10 = 0
  store i32 %add3, ptr %v1, align 4 ; %v1 = %add3
  br label %omp.body.continue

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %11 = load i32, ptr %.omp.iv, align 4 ;%11 = %omp.iv = 0
  %add4 = add nsw i32 %11, 1        ; %add4= %11 + 1 = 1
  store i32 %add4, ptr %.omp.iv, align 4  ; %omp.iv = %add4 = 1
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit

omp.loop.exit:                                    ; preds = %omp.inner.for.end 
  %16 = load i32, ptr %v1, align 4
  %17 = atomicrmw add ptr %v, i32 %16 monotonic, align 4
  br label %.omp.reduction.default

.omp.reduction.default:                           ; preds = %.omp.reduction.case2, %.omp.reduction.case1, %omp.loop.exit
  br label %ret.of.function

  ;========================END_OF_PARTITION_2======================================

ret.of.function:
  %0 = load i32, ptr %v, align 4      ; load value of v to %0
  %1 = load ptr, ptr %v2.addr, align 8  ; %1 =  ptr %v2.addr
  store i32 %0, ptr %1, align 4         ; %1 = %0
  ret void
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @_Z9reductionPi.omp_outlined(ptr noalias noundef %.global_tid., ptr noalias noundef %.bound_tid., ptr noundef nonnull align 4 dereferenceable(4) %v) #1 {
entry:
  ;%.global_tid..addr = alloca ptr, align 8
  ;%.bound_tid..addr = alloca ptr, align 8

  %v.addr = alloca ptr, align 8
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4

  %v1 = alloca i32, align 4 ;local to thread??
  %i = alloca i32, align 4  ;local to thread??

  ;%.omp.reduction.red_list = alloca [1 x ptr], align 8  ;reduction list, only 1 var, so size is 1

  ;store ptr %.global_tid., ptr %.global_tid..addr, align 8
  ;store ptr %.bound_tid., ptr %.bound_tid..addr, align 8

  store ptr %v, ptr %v.addr, align 8
  %0 = load ptr, ptr %v.addr, align 8 ; %0 = %v
  store i32 0, ptr %.omp.lb, align 4
  store i32 9, ptr %.omp.ub, align 4
  store i32 1, ptr %.omp.stride, align 4
  store i32 0, ptr %.omp.is_last, align 4
  store i32 0, ptr %v1, align 4 ; %v1 = 0
  ;%1 = load ptr, ptr %.global_tid..addr, align 8
  %2 = load i32, ptr %1, align 4
  ;call void @__kmpc_for_static_init_4(ptr @1, i32 %2, i32 34, ptr %.omp.is_last, ptr %.omp.lb, ptr %.omp.ub, ptr %.omp.stride, i32 1, i32 1)
  
  %3 = load i32, ptr %.omp.ub, align 4
  %cmp = icmp sgt i32 %3, 9
  br i1 %cmp, label %cond.true, label %cond.false ; assume false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %4 = load i32, ptr %.omp.ub, align 4  ; %4 = 9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 9, %cond.true ], [ %4, %cond.false ]  ;%cond = %4 = 9
  store i32 %cond, ptr %.omp.ub, align 4    ; %omp.ub = %cond = %4 = 9
  %5 = load i32, ptr %.omp.lb, align 4      ; %5= %omp.lb = 0
  store i32 %5, ptr %.omp.iv, align 4       ; %omp.iv = %5 = 0 ; iter-val?
  br label %omp.inner.for.cond

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %6 = load i32, ptr %.omp.iv, align 4      ;%6 = 0
  %7 = load i32, ptr %.omp.ub, align 4      ;%7 = 9
  %cmp2 = icmp sle i32 %6, %7               ; %6 <= %7
  br i1 %cmp2, label %omp.inner.for.body, label %omp.inner.for.end

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %8 = load i32, ptr %.omp.iv, align 4  ;%8 = %omp.iv = 0
  %mul = mul nsw i32 %8, 1
  %add = add nsw i32 0, %mul
  store i32 %add, ptr %i, align 4
  %9 = load i32, ptr %i, align 4 ; %9 = i = 0
  %10 = load i32, ptr %v1, align 4  ; %10 = %v1 = 0
  %add3 = add nsw i32 %10, %9 ; %add3 = %9 + %10 = 0
  store i32 %add3, ptr %v1, align 4 ; %v1 = %add3
  br label %omp.body.continue

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %11 = load i32, ptr %.omp.iv, align 4 ;%11 = %omp.iv = 0
  %add4 = add nsw i32 %11, 1        ; %add4= %11 + 1 = 1
  store i32 %add4, ptr %.omp.iv, align 4  ; %omp.iv = %add4 = 1
  br label %omp.inner.for.cond

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  ;call void @__kmpc_for_static_fini(ptr @1, i32 %2)
  ;%12 = getelementptr inbounds [1 x ptr], ptr %.omp.reduction.red_list, i64 0, i64 0

  store ptr %v1, ptr %12, align 8

  ;%13 = call i32 @__kmpc_reduce_nowait(ptr @2, i32 %2, i32 1, i64 8, ptr %.omp.reduction.red_list, ptr @_Z9reductionPi.omp_outlined.omp.reduction.reduction_func, ptr @.gomp_critical_user_.reduction.var)
  ;switch i32 %13, label %.omp.reduction.default [
  ;  i32 1, label %.omp.reduction.case1  ;case1 is for optimization; if it determines no reduction is needed
  ;  i32 2, label %.omp.reduction.case2  ;case2 is the one where we actually need reduction
  ;]

  %16 = load i32, ptr %v1, align 4
  %17 = atomicrmw add ptr %0, i32 %16 monotonic, align 4
  br label %.omp.reduction.default



;.omp.reduction.case1:                             ; preds = %omp.loop.exit
;  %14 = load i32, ptr %0, align 4
;  %15 = load i32, ptr %v1, align 4
;  %add5 = add nsw i32 %14, %15
;  store i32 %add5, ptr %0, align 4
;  call void @__kmpc_end_reduce_nowait(ptr @2, i32 %2, ptr @.gomp_critical_user_.reduction.var)
;  br label %.omp.reduction.default

;.omp.reduction.case2:                             ; preds = %omp.loop.exit
;  %16 = load i32, ptr %v1, align 4
;  %17 = atomicrmw add ptr %0, i32 %16 monotonic, align 4
;  br label %.omp.reduction.default

.omp.reduction.default:                           ; preds = %.omp.reduction.case2, %.omp.reduction.case1, %omp.loop.exit
  ret void
}

; Function Attrs: nounwind
declare void @__kmpc_for_static_init_4(ptr, i32, i32, ptr, ptr, ptr, ptr, i32, i32) #2

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(ptr, i32) #2

; Function Attrs: noinline norecurse uwtable
define internal void @_Z9reductionPi.omp_outlined.omp.reduction.reduction_func(ptr noundef %0, ptr noundef %1) #3 {
entry:
  
  ;%1 must be the array of pointers to the local copy of the var
  ;%0 must be the array of pointers to the original vars

  %.addr = alloca ptr, align 8
  %.addr1 = alloca ptr, align 8
  store ptr %0, ptr %.addr, align 8
  store ptr %1, ptr %.addr1, align 8
  %2 = load ptr, ptr %.addr, align 8
  %3 = load ptr, ptr %.addr1, align 8
  %4 = getelementptr inbounds [1 x ptr], ptr %3, i64 0, i64 0
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds [1 x ptr], ptr %2, i64 0, i64 0
  %7 = load ptr, ptr %6, align 8
  %8 = load i32, ptr %7, align 4
  %9 = load i32, ptr %5, align 4
  %add = add nsw i32 %8, %9
  store i32 %add, ptr %7, align 4
  ret void
}

; Function Attrs: convergent nounwind
declare i32 @__kmpc_reduce_nowait(ptr, i32, i32, i64, ptr, ptr, ptr) #4

; Function Attrs: convergent nounwind
declare void @__kmpc_end_reduce_nowait(ptr, i32, ptr) #4

; Function Attrs: nounwind
declare !callback !7 void @__kmpc_fork_call(ptr, i32, ptr, ...) #2

attributes #0 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noinline norecurse nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }
attributes #3 = { noinline norecurse uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { convergent nounwind }

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
