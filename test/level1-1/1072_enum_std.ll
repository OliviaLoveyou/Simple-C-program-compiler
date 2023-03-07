; ModuleID = 'test/level1-1/1072_enum.sy'
source_filename = "test/level1-1/1072_enum.sy"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %2, align 4
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  br label %6

; <label>:6:                                      ; preds = %41, %0
  %7 = load i32, i32* %2, align 4
  %8 = icmp slt i32 %7, 21
  br i1 %8, label %9, label %44

; <label>:9:                                      ; preds = %6
  br label %10

; <label>:10:                                     ; preds = %38, %9
  %11 = load i32, i32* %3, align 4
  %12 = load i32, i32* %2, align 4
  %13 = sub nsw i32 101, %12
  %14 = icmp slt i32 %11, %13
  br i1 %14, label %15, label %41

; <label>:15:                                     ; preds = %10
  %16 = load i32, i32* %2, align 4
  %17 = sub nsw i32 100, %16
  %18 = load i32, i32* %3, align 4
  %19 = sub nsw i32 %17, %18
  store i32 %19, i32* %4, align 4
  %20 = load i32, i32* %2, align 4
  %21 = mul nsw i32 5, %20
  %22 = load i32, i32* %3, align 4
  %23 = mul nsw i32 1, %22
  %24 = add nsw i32 %21, %23
  %25 = load i32, i32* %4, align 4
  %26 = sdiv i32 %25, 2
  %27 = add nsw i32 %24, %26
  %28 = icmp eq i32 %27, 100
  br i1 %28, label %29, label %38

; <label>:29:                                     ; preds = %15
  %30 = load i32, i32* %2, align 4
  %31 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %30)
  %32 = load i32, i32* %3, align 4
  %33 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %32)
  %34 = load i32, i32* %4, align 4
  %35 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %34)
  store i32 10, i32* %5, align 4
  %36 = load i32, i32* %5, align 4
  %37 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 %36)
  br label %38

; <label>:38:                                     ; preds = %29, %15
  %39 = load i32, i32* %3, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %3, align 4
  br label %10

; <label>:41:                                     ; preds = %10
  %42 = load i32, i32* %2, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %2, align 4
  br label %6

; <label>:44:                                     ; preds = %6
  ret i32 0
}

declare i32 @putint(...) #1

declare i32 @putch(...) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
