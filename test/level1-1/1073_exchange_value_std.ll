; ModuleID = 'test/level1-1/1073_exchange_value.sy'
source_filename = "test/level1-1/1073_exchange_value.sy"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@n = common global i32 0, align 4

; Function Attrs: noinline nounwind optnone
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %5 = call i32 bitcast (i32 (...)* @getint to i32 ()*)()
  store i32 %5, i32* %2, align 4
  %6 = call i32 bitcast (i32 (...)* @getint to i32 ()*)()
  store i32 %6, i32* %3, align 4
  %7 = load i32, i32* %2, align 4
  store i32 %7, i32* %4, align 4
  %8 = load i32, i32* %3, align 4
  store i32 %8, i32* %2, align 4
  %9 = load i32, i32* %4, align 4
  store i32 %9, i32* %3, align 4
  %10 = load i32, i32* %2, align 4
  %11 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %10)
  store i32 10, i32* %4, align 4
  %12 = load i32, i32* %4, align 4
  %13 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 %12)
  %14 = load i32, i32* %3, align 4
  %15 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %14)
  store i32 10, i32* %4, align 4
  %16 = load i32, i32* %4, align 4
  %17 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 %16)
  ret i32 0
}

declare i32 @getint(...) #1

declare i32 @putint(...) #1

declare i32 @putch(...) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
