; ModuleID = 'func2.cpp'
source_filename = "func2.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local noundef i32 @_Z5func1i(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %arr = alloca [100 x i32], align 16
  %arr2 = alloca [100 x i32], align 16
  %arr3 = alloca [100 x i32], align 16
  %i = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4
  %mul = mul nsw i32 %1, 30
  %2 = load i32, ptr %x.addr, align 4
  %mul1 = mul nsw i32 %mul, %2
  %3 = load i32, ptr %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [100 x i32], ptr %arr, i64 0, i64 %idxprom
  store i32 %mul1, ptr %arrayidx, align 4
  %4 = load i32, ptr %i, align 4
  %mul2 = mul nsw i32 %4, 20
  %5 = load i32, ptr %x.addr, align 4
  %mul3 = mul nsw i32 %mul2, %5
  %6 = load i32, ptr %i, align 4
  %idxprom4 = sext i32 %6 to i64
  %arrayidx5 = getelementptr inbounds [100 x i32], ptr %arr2, i64 0, i64 %idxprom4
  store i32 %mul3, ptr %arrayidx5, align 4
  %7 = load i32, ptr %i, align 4
  %mul6 = mul nsw i32 %7, 40
  %8 = load i32, ptr %x.addr, align 4
  %mul7 = mul nsw i32 %mul6, %8
  %9 = load i32, ptr %i, align 4
  %idxprom8 = sext i32 %9 to i64
  %arrayidx9 = getelementptr inbounds [100 x i32], ptr %arr3, i64 0, i64 %idxprom8
  store i32 %mul7, ptr %arrayidx9, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, ptr %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i32], ptr %arr, i64 0, i64 20
  %11 = load i32, ptr %arrayidx10, align 16
  ret i32 %11
}

attributes #0 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 20.0.0git (https://github.com/llvm/llvm-project.git c557d8520413476221a4f3bf2b7b3fed17681691)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
