; ModuleID = 'func1.cpp'
source_filename = "func1.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local noundef i32 @_Z7mulamodii(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = mul nsw i32 5, %6
  %8 = load i32, ptr %4, align 4
  %9 = add nsw i32 %7, %8
  store i32 %9, ptr %5, align 4
  %10 = load i32, ptr %3, align 4
  %11 = srem i32 %10, 2
  ret i32 %11
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define dso_local noundef i32 @_Z8mulamod2ii(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %3, align 4
  %8 = mul nsw i32 8, %7
  %9 = load i32, ptr %4, align 4
  %10 = add nsw i32 %8, %9
  %11 = sext i32 %10 to i64
  store i64 %11, ptr %5, align 8
  %12 = load i64, ptr %5, align 8
  %13 = add nsw i64 %12, 0
  %14 = mul nsw i64 %13, 1
  store i64 %14, ptr %5, align 8
  %15 = load i64, ptr %5, align 8
  %16 = mul nsw i64 %15, 2
  store i64 %16, ptr %6, align 8
  %17 = load i64, ptr %6, align 8
  %18 = srem i64 %17, 2
  %19 = trunc i64 %18 to i32
  ret i32 %19
}

attributes #0 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 18.1.8"}
