; ModuleID = 'order_scrambled.cpp'
source_filename = "order_scrambled.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local void @_Z9function1i(i32 noundef %j) #0 {
entry:
  %j.addr = alloca i32, align 4
  %arr = alloca [100 x float], align 16
  %arr2 = alloca [100 x i32], align 16
  %arr3 = alloca [100 x i8], align 16
  %i = alloca i32, align 4
  store i32 %j, ptr %j.addr, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4
  %rem = srem i32 %1, 2
  %cmp1 = icmp ne i32 %rem, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %2 = load i32, ptr %i, align 4
  %3 = load i32, ptr %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [100 x i32], ptr %arr2, i64 0, i64 %idxprom
  store i32 %2, ptr %arrayidx, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %4 = load i32, ptr %i, align 4
  %rem2 = srem i32 %4, 2
  %cmp3 = icmp eq i32 %rem2, 0
  br i1 %cmp3, label %if.then4, label %if.end8

if.then4:                                         ; preds = %if.end
  %5 = load i32, ptr %i, align 4
  %rem5 = srem i32 %5, 256
  %conv = trunc i32 %rem5 to i8
  %6 = load i32, ptr %i, align 4
  %idxprom6 = sext i32 %6 to i64
  %arrayidx7 = getelementptr inbounds [100 x i8], ptr %arr3, i64 0, i64 %idxprom6
  store i8 %conv, ptr %arrayidx7, align 1
  br label %if.end8

if.end8:                                          ; preds = %if.then4, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end8
  %7 = load i32, ptr %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  ret void
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
