; ModuleID = 'test/level1-2/102_short_circuit3.sy'
source_filename = "test/level1-2/102_short_circuit3.sy"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@a = common global i32 0, align 4
@b = common global i32 0, align 4
@d = common global i32 0, align 4

; Function Attrs: noinline nounwind optnone
define i32 @set_a(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  store i32 %3, i32* @a, align 4
  %4 = load i32, i32* @a, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone
define i32 @set_b(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  store i32 %3, i32* @b, align 4
  %4 = load i32, i32* @b, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone
define i32 @set_d(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  store i32 %3, i32* @d, align 4
  %4 = load i32, i32* @d, align 4
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 2, i32* @a, align 4
  store i32 3, i32* @b, align 4
  %8 = call i32 @set_a(i32 0)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %0
  %11 = call i32 @set_b(i32 1)
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  br label %14

; <label>:14:                                     ; preds = %13, %10, %0
  %15 = load i32, i32* @a, align 4
  %16 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %15)
  %17 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 32)
  %18 = load i32, i32* @b, align 4
  %19 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %18)
  %20 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 32)
  store i32 2, i32* @a, align 4
  store i32 3, i32* @b, align 4
  %21 = call i32 @set_a(i32 0)
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %27

; <label>:23:                                     ; preds = %14
  %24 = call i32 @set_b(i32 1)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %27

; <label>:26:                                     ; preds = %23
  br label %27

; <label>:27:                                     ; preds = %26, %23, %14
  %28 = load i32, i32* @a, align 4
  %29 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %28)
  %30 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 32)
  %31 = load i32, i32* @b, align 4
  %32 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %31)
  %33 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 10)
  store i32 1, i32* %2, align 4
  store i32 2, i32* @d, align 4
  %34 = call i32 @set_d(i32 3)
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %37

; <label>:36:                                     ; preds = %27
  br label %37

; <label>:37:                                     ; preds = %36, %27
  %38 = load i32, i32* @d, align 4
  %39 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %38)
  %40 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 32)
  %41 = load i32, i32* @d, align 4
  %42 = call i32 bitcast (i32 (...)* @putint to i32 (i32)*)(i32 %41)
  %43 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 10)
  %44 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 65)
  %45 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 68)
  %46 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 70)
  %47 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 10)
  store i32 0, i32* %3, align 4
  store i32 1, i32* %4, align 4
  store i32 2, i32* %5, align 4
  store i32 3, i32* %6, align 4
  store i32 4, i32* %7, align 4
  br label %48

; <label>:48:                                     ; preds = %56, %37
  %49 = load i32, i32* %3, align 4
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %54

; <label>:51:                                     ; preds = %48
  %52 = load i32, i32* %4, align 4
  %53 = icmp ne i32 %52, 0
  br label %54

; <label>:54:                                     ; preds = %51, %48
  %55 = phi i1 [ false, %48 ], [ %53, %51 ]
  br i1 %55, label %56, label %58

; <label>:56:                                     ; preds = %54
  %57 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 32)
  br label %48

; <label>:58:                                     ; preds = %54
  %59 = load i32, i32* %3, align 4
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %64, label %61

; <label>:61:                                     ; preds = %58
  %62 = load i32, i32* %4, align 4
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %66

; <label>:64:                                     ; preds = %61, %58
  %65 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 67)
  br label %66

; <label>:66:                                     ; preds = %64, %61
  %67 = load i32, i32* %3, align 4
  %68 = load i32, i32* %4, align 4
  %69 = icmp sge i32 %67, %68
  br i1 %69, label %74, label %70

; <label>:70:                                     ; preds = %66
  %71 = load i32, i32* %4, align 4
  %72 = load i32, i32* %3, align 4
  %73 = icmp sle i32 %71, %72
  br i1 %73, label %74, label %76

; <label>:74:                                     ; preds = %70, %66
  %75 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 72)
  br label %76

; <label>:76:                                     ; preds = %74, %70
  %77 = load i32, i32* %5, align 4
  %78 = load i32, i32* %4, align 4
  %79 = icmp sge i32 %77, %78
  br i1 %79, label %80, label %86

; <label>:80:                                     ; preds = %76
  %81 = load i32, i32* %7, align 4
  %82 = load i32, i32* %6, align 4
  %83 = icmp ne i32 %81, %82
  br i1 %83, label %84, label %86

; <label>:84:                                     ; preds = %80
  %85 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 73)
  br label %86

; <label>:86:                                     ; preds = %84, %80, %76
  %87 = load i32, i32* %3, align 4
  %88 = load i32, i32* %4, align 4
  %89 = icmp ne i32 %88, 0
  %90 = xor i1 %89, true
  %91 = zext i1 %90 to i32
  %92 = icmp eq i32 %87, %91
  br i1 %92, label %93, label %97

; <label>:93:                                     ; preds = %86
  %94 = load i32, i32* %6, align 4
  %95 = load i32, i32* %6, align 4
  %96 = icmp slt i32 %94, %95
  br i1 %96, label %101, label %97

; <label>:97:                                     ; preds = %93, %86
  %98 = load i32, i32* %7, align 4
  %99 = load i32, i32* %7, align 4
  %100 = icmp sge i32 %98, %99
  br i1 %100, label %101, label %103

; <label>:101:                                    ; preds = %97, %93
  %102 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 74)
  br label %103

; <label>:103:                                    ; preds = %101, %97
  %104 = load i32, i32* %3, align 4
  %105 = load i32, i32* %4, align 4
  %106 = icmp ne i32 %105, 0
  %107 = xor i1 %106, true
  %108 = zext i1 %107 to i32
  %109 = icmp eq i32 %104, %108
  br i1 %109, label %118, label %110

; <label>:110:                                    ; preds = %103
  %111 = load i32, i32* %6, align 4
  %112 = load i32, i32* %6, align 4
  %113 = icmp slt i32 %111, %112
  br i1 %113, label %114, label %120

; <label>:114:                                    ; preds = %110
  %115 = load i32, i32* %7, align 4
  %116 = load i32, i32* %7, align 4
  %117 = icmp sge i32 %115, %116
  br i1 %117, label %118, label %120

; <label>:118:                                    ; preds = %114, %103
  %119 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 75)
  br label %120

; <label>:120:                                    ; preds = %118, %114, %110
  %121 = call i32 bitcast (i32 (...)* @putch to i32 (i32)*)(i32 10)
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
