; ModuleID = 'test/level1-1/099_skip_spaces.sy'
source_filename = "test/level1-1/099_skip_spaces.sy"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [100 x i32], align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 0, i32* %3, align 4
  store i32 0, i32* %4, align 4
  br label %5

; <label>:5:                                      ; preds = %8, %0
  %6 = call i32 bitcast (i32 (...)* @getint to i32 ()*)()
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %14

; <label>:8:                                      ; preds = %5
  %9 = call i32 bitcast (i32 (...)* @getint to i32 ()*)()
  %10 = load i32, i32* %3, align 4
  %11 = getelementptr inbounds [100 x i32], [100 x i32]* %2, i32 0, i32 %10
  store i32 %9, i32* %11, align 4
  %12 = load i32, i32* %3, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %3, align 4
  br label %5

; <label>:14:                                     ; preds = %5
  br label %15

; <label>:15:                                     ; preds = %18, %14
  %16 = load i32, i32* %3, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %26

; <label>:18:                                     ; preds = %15
  %19 = load i32, i32* %3, align 4
  %20 = sub nsw i32 %19, 1
  store i32 %20, i32* %3, align 4
  %21 = load i32, i32* %4, align 4
  %22 = load i32, i32* %3, align 4
  %23 = getelementptr inbounds [100 x i32], [100 x i32]* %2, i32 0, i32 %22
  %24 = load i32, i32* %23, align 4
  %25 = add nsw i32 %21, %24
  store i32 %25, i32* %4, align 4
  br label %15

; <label>:26:                                     ; preds = %15
  %27 = load i32, i32* %4, align 4
  %28 = srem i32 %27, 79
  ret i32 %28
}

declare i32 @getint(...) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
