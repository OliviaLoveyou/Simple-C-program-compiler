; ModuleID = 'test/level1-1/057_if_complex_expr.sy'
source_filename = "test/level1-1/057_if_complex_expr.sy"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 5, i32* %2, align 4
  store i32 5, i32* %3, align 4
  store i32 1, i32* %4, align 4
  store i32 -2, i32* %5, align 4
  store i32 2, i32* %6, align 4
  %7 = load i32, i32* %5, align 4
  %8 = mul nsw i32 %7, 1
  %9 = sdiv i32 %8, 2
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %21, label %11

; <label>:11:                                     ; preds = %0
  %12 = load i32, i32* %2, align 4
  %13 = load i32, i32* %3, align 4
  %14 = sub nsw i32 %12, %13
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %24

; <label>:16:                                     ; preds = %11
  %17 = load i32, i32* %4, align 4
  %18 = add nsw i32 %17, 3
  %19 = srem i32 %18, 2
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %24

; <label>:21:                                     ; preds = %16, %0
  %22 = load i32, i32* %6, align 4
  %23 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %22)
  br label %24

; <label>:24:                                     ; preds = %21, %16, %11
  %25 = load i32, i32* %5, align 4
  %26 = srem i32 %25, 2
  %27 = add nsw i32 %26, 67
  %28 = icmp slt i32 %27, 0
  br i1 %28, label %39, label %29

; <label>:29:                                     ; preds = %24
  %30 = load i32, i32* %2, align 4
  %31 = load i32, i32* %3, align 4
  %32 = sub nsw i32 %30, %31
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %42

; <label>:34:                                     ; preds = %29
  %35 = load i32, i32* %4, align 4
  %36 = add nsw i32 %35, 2
  %37 = srem i32 %36, 2
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %42

; <label>:39:                                     ; preds = %34, %24
  store i32 4, i32* %6, align 4
  %40 = load i32, i32* %6, align 4
  %41 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %40)
  br label %42

; <label>:42:                                     ; preds = %39, %34, %29
  ret i32 0
}

declare i32 @putint(...) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
