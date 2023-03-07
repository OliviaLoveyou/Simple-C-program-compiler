; ModuleID = 'test/level1-2/035_while_test2.sy'
source_filename = "test/level1-2/035_while_test2.sy"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone
define i32 @FourWhile() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 5, i32* %1, align 4
  store i32 6, i32* %2, align 4
  store i32 7, i32* %3, align 4
  store i32 10, i32* %4, align 4
  br label %5

; <label>:5:                                      ; preds = %35, %0
  %6 = load i32, i32* %1, align 4
  %7 = icmp slt i32 %6, 20
  br i1 %7, label %8, label %38

; <label>:8:                                      ; preds = %5
  %9 = load i32, i32* %1, align 4
  %10 = add nsw i32 %9, 3
  store i32 %10, i32* %1, align 4
  br label %11

; <label>:11:                                     ; preds = %32, %8
  %12 = load i32, i32* %2, align 4
  %13 = icmp slt i32 %12, 10
  br i1 %13, label %14, label %35

; <label>:14:                                     ; preds = %11
  %15 = load i32, i32* %2, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %2, align 4
  br label %17

; <label>:17:                                     ; preds = %29, %14
  %18 = load i32, i32* %3, align 4
  %19 = icmp eq i32 %18, 7
  br i1 %19, label %20, label %32

; <label>:20:                                     ; preds = %17
  %21 = load i32, i32* %3, align 4
  %22 = sub nsw i32 %21, 1
  store i32 %22, i32* %3, align 4
  br label %23

; <label>:23:                                     ; preds = %26, %20
  %24 = load i32, i32* %4, align 4
  %25 = icmp slt i32 %24, 20
  br i1 %25, label %26, label %29

; <label>:26:                                     ; preds = %23
  %27 = load i32, i32* %4, align 4
  %28 = add nsw i32 %27, 3
  store i32 %28, i32* %4, align 4
  br label %23

; <label>:29:                                     ; preds = %23
  %30 = load i32, i32* %4, align 4
  %31 = sub nsw i32 %30, 1
  store i32 %31, i32* %4, align 4
  br label %17

; <label>:32:                                     ; preds = %17
  %33 = load i32, i32* %3, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %3, align 4
  br label %11

; <label>:35:                                     ; preds = %11
  %36 = load i32, i32* %2, align 4
  %37 = sub nsw i32 %36, 2
  store i32 %37, i32* %2, align 4
  br label %5

; <label>:38:                                     ; preds = %5
  %39 = load i32, i32* %1, align 4
  %40 = load i32, i32* %2, align 4
  %41 = load i32, i32* %4, align 4
  %42 = add nsw i32 %40, %41
  %43 = add nsw i32 %39, %42
  %44 = load i32, i32* %3, align 4
  %45 = add nsw i32 %43, %44
  ret i32 %45
}

; Function Attrs: noinline nounwind optnone
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %2 = call i32 @FourWhile()
  ret i32 %2
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
