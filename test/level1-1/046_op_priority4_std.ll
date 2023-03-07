; ModuleID = 'test/level1-1/046_op_priority4.sy'
source_filename = "test/level1-1/046_op_priority4.sy"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@a = common global i32 0, align 4
@b = common global i32 0, align 4
@c = common global i32 0, align 4
@d = common global i32 0, align 4
@e = common global i32 0, align 4

; Function Attrs: noinline nounwind optnone
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %3 = call i32 bitcast (i32 (...)* @getint to i32 ()*)()
  store i32 %3, i32* @a, align 4
  %4 = call i32 bitcast (i32 (...)* @getint to i32 ()*)()
  store i32 %4, i32* @b, align 4
  %5 = call i32 bitcast (i32 (...)* @getint to i32 ()*)()
  store i32 %5, i32* @c, align 4
  %6 = call i32 bitcast (i32 (...)* @getint to i32 ()*)()
  store i32 %6, i32* @d, align 4
  %7 = call i32 bitcast (i32 (...)* @getint to i32 ()*)()
  store i32 %7, i32* @e, align 4
  store i32 0, i32* %2, align 4
  %8 = load i32, i32* @a, align 4
  %9 = load i32, i32* @b, align 4
  %10 = load i32, i32* @c, align 4
  %11 = mul nsw i32 %9, %10
  %12 = sub nsw i32 %8, %11
  %13 = load i32, i32* @d, align 4
  %14 = load i32, i32* @a, align 4
  %15 = load i32, i32* @c, align 4
  %16 = sdiv i32 %14, %15
  %17 = sub nsw i32 %13, %16
  %18 = icmp ne i32 %12, %17
  br i1 %18, label %39, label %19

; <label>:19:                                     ; preds = %0
  %20 = load i32, i32* @a, align 4
  %21 = load i32, i32* @b, align 4
  %22 = mul nsw i32 %20, %21
  %23 = load i32, i32* @c, align 4
  %24 = sdiv i32 %22, %23
  %25 = load i32, i32* @e, align 4
  %26 = load i32, i32* @d, align 4
  %27 = add nsw i32 %25, %26
  %28 = icmp eq i32 %24, %27
  br i1 %28, label %39, label %29

; <label>:29:                                     ; preds = %19
  %30 = load i32, i32* @a, align 4
  %31 = load i32, i32* @b, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32, i32* @c, align 4
  %34 = add nsw i32 %32, %33
  %35 = load i32, i32* @d, align 4
  %36 = load i32, i32* @e, align 4
  %37 = add nsw i32 %35, %36
  %38 = icmp eq i32 %34, %37
  br i1 %38, label %39, label %40

; <label>:39:                                     ; preds = %29, %19, %0
  store i32 1, i32* %2, align 4
  br label %40

; <label>:40:                                     ; preds = %39, %29
  %41 = load i32, i32* %2, align 4
  ret i32 %41
}

declare i32 @getint(...) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
