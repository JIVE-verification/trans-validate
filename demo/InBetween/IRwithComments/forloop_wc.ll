; ModuleID = 'forloop.cpp'
source_filename = "forloop.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@arr = dso_local global [100 x i32] zeroinitializer, align 16

; Function Attrs: mustprogress noinline norecurse nounwind optnone uwtable
define dso_local noundef i32 @main(i32 noundef %0, i8** noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4

  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4

  //%3 = 0
  store i32 0, i32* %3, align 4
  
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8

  //%6 = 0
  store i32 0, i32* %6, align 4
  br label %7

7:                                                ; preds = %16, %2
  //%8 = %6 = 0
  %8 = load i32, i32* %6, align 4

  //if %8 < 100, jump to %10
  %9 = icmp slt i32 %8, 100
  br i1 %9, label %10, label %19

10:                                               ; preds = %7
  //%11 = %6 = 0
  %11 = load i32, i32* %6, align 4

  //%12 = 20 * %11 = 20*0
  %12 = mul nsw i32 20, %11

  //%13 = 0
  %13 = load i32, i32* %6, align 4
  //%14 = sign extend %13 to i64
  %14 = sext i32 %13 to i64

  //%15 = arr[%14]
  %15 = getelementptr inbounds [100 x i32], [100 x i32]* @arr, i64 0, i64 %14
  
  //store %12 to arr[%14]
  store i32 %12, i32* %15, align 4
  br label %16

16:                                               ; preds = %10
  //%17 = %6 = 0
  %17 = load i32, i32* %6, align 4

  //%18 = %17 + 1 = 0 + 1
  %18 = add nsw i32 %17, 1

  //%6 = %18 = 1 
  store i32 %18, i32* %6, align 4
  //jumpm to %7
  br label %7, !llvm.loop !7

19:                                               ; preds = %7
  //end of loop, and return 
  ret i32 0
}

attributes #0 = { mustprogress noinline norecurse nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"openmp", i32 50}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
