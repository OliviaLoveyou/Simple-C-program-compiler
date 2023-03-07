; ModuleID = 'test/level1-2/1075_max_container.sy'
source_filename = "test/level1-2/1075_max_container.sy"
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

; Function Attrs: noinline nounwind optnone
define i32 @maxArea(i32*, i32) #0 {
  %3 = alloca i32*, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32* %0, i32** %3, align 4
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  %9 = load i32, i32* %4, align 4
  %10 = sub nsw i32 %9, 1
  store i32 %10, i32* %6, align 4
  store i32 -1, i32* %7, align 4
  br label %11

; <label>:11:                                     ; preds = %65, %2
  %12 = load i32, i32* %5, align 4
  %13 = load i32, i32* %6, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %66

; <label>:15:                                     ; preds = %11
  %16 = load i32*, i32** %3, align 4
  %17 = load i32, i32* %5, align 4
  %18 = getelementptr inbounds i32, i32* %16, i32 %17
  %19 = load i32, i32* %18, align 4
  %20 = load i32*, i32** %3, align 4
  %21 = load i32, i32* %6, align 4
  %22 = getelementptr inbounds i32, i32* %20, i32 %21
  %23 = load i32, i32* %22, align 4
  %24 = icmp slt i32 %19, %23
  br i1 %24, label %25, label %34

; <label>:25:                                     ; preds = %15
  %26 = load i32, i32* %6, align 4
  %27 = load i32, i32* %5, align 4
  %28 = sub nsw i32 %26, %27
  %29 = load i32*, i32** %3, align 4
  %30 = load i32, i32* %5, align 4
  %31 = getelementptr inbounds i32, i32* %29, i32 %30
  %32 = load i32, i32* %31, align 4
  %33 = mul nsw i32 %28, %32
  store i32 %33, i32* %8, align 4
  br label %43

; <label>:34:                                     ; preds = %15
  %35 = load i32, i32* %6, align 4
  %36 = load i32, i32* %5, align 4
  %37 = sub nsw i32 %35, %36
  %38 = load i32*, i32** %3, align 4
  %39 = load i32, i32* %6, align 4
  %40 = getelementptr inbounds i32, i32* %38, i32 %39
  %41 = load i32, i32* %40, align 4
  %42 = mul nsw i32 %37, %41
  store i32 %42, i32* %8, align 4
  br label %43

; <label>:43:                                     ; preds = %34, %25
  %44 = load i32, i32* %8, align 4
  %45 = load i32, i32* %7, align 4
  %46 = icmp sgt i32 %44, %45
  br i1 %46, label %47, label %49

; <label>:47:                                     ; preds = %43
  %48 = load i32, i32* %8, align 4
  store i32 %48, i32* %7, align 4
  br label %49

; <label>:49:                                     ; preds = %47, %43
  %50 = load i32*, i32** %3, align 4
  %51 = load i32, i32* %5, align 4
  %52 = getelementptr inbounds i32, i32* %50, i32 %51
  %53 = load i32, i32* %52, align 4
  %54 = load i32*, i32** %3, align 4
  %55 = load i32, i32* %6, align 4
  %56 = getelementptr inbounds i32, i32* %54, i32 %55
  %57 = load i32, i32* %56, align 4
  %58 = icmp sgt i32 %53, %57
  br i1 %58, label %59, label %62

; <label>:59:                                     ; preds = %49
  %60 = load i32, i32* %6, align 4
  %61 = sub nsw i32 %60, 1
  store i32 %61, i32* %6, align 4
  br label %65

; <label>:62:                                     ; preds = %49
  %63 = load i32, i32* %5, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %5, align 4
  br label %65

; <label>:65:                                     ; preds = %62, %59
  br label %11

; <label>:66:                                     ; preds = %11
  %67 = load i32, i32* %7, align 4
  ret i32 %67
}

; Function Attrs: noinline nounwind optnone
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca [10 x i32], align 4
  store i32 0, i32* %1, align 4
  %4 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 0
  store i32 3, i32* %4, align 4
  %5 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 1
  store i32 3, i32* %5, align 4
  %6 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 2
  store i32 9, i32* %6, align 4
  %7 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 3
  store i32 0, i32* %7, align 4
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 4
  store i32 0, i32* %8, align 4
  %9 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 5
  store i32 1, i32* %9, align 4
  %10 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 6
  store i32 1, i32* %10, align 4
  %11 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 7
  store i32 5, i32* %11, align 4
  %12 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 8
  store i32 7, i32* %12, align 4
  %13 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 9
  store i32 8, i32* %13, align 4
  store i32 10, i32* %2, align 4
  %14 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i32 0, i32 0
  %15 = load i32, i32* %2, align 4
  %16 = call i32 @maxArea(i32* %14, i32 %15)
  store i32 %16, i32* %2, align 4
  %17 = load i32, i32* %2, align 4
  ret i32 %17
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"NumRegisterParameters", i32 0}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
