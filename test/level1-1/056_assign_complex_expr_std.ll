; ModuleID = 'test/level1-1/056_assign_complex_expr.sy'
source_filename = "test/level1-1/056_assign_complex_expr.sy"
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
  %7 = load i32, i32* %5, align 4
  %8 = mul nsw i32 %7, 1
  %9 = sdiv i32 %8, 2
  %10 = load i32, i32* %2, align 4
  %11 = load i32, i32* %3, align 4
  %12 = sub nsw i32 %10, %11
  %13 = add nsw i32 %9, %12
  %14 = load i32, i32* %4, align 4
  %15 = add nsw i32 %14, 3
  %16 = sub nsw i32 0, %15
  %17 = srem i32 %16, 2
  %18 = sub nsw i32 %13, %17
  store i32 %18, i32* %6, align 4
  %19 = load i32, i32* %6, align 4
  %20 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %19)
  %21 = load i32, i32* %5, align 4
  %22 = srem i32 %21, 2
  %23 = add nsw i32 %22, 67
  %24 = load i32, i32* %2, align 4
  %25 = load i32, i32* %3, align 4
  %26 = sub nsw i32 %24, %25
  %27 = sub nsw i32 0, %26
  %28 = add nsw i32 %23, %27
  %29 = load i32, i32* %4, align 4
  %30 = add nsw i32 %29, 2
  %31 = srem i32 %30, 2
  %32 = sub nsw i32 0, %31
  %33 = sub nsw i32 %28, %32
  store i32 %33, i32* %6, align 4
  %34 = load i32, i32* %6, align 4
  %35 = add nsw i32 %34, 3
  store i32 %35, i32* %6, align 4
  %36 = load i32, i32* %6, align 4
  %37 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %36)
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
