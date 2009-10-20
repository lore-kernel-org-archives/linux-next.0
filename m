From: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Subject: [PATCH] BUILD_BUG_ON: make it handle more cases
Date: Tue, 20 Oct 2009 14:15:33 +1030
Message-ID: <200910201415.34361.rusty@rustcorp.com.au>
References: <4AC1E15502000078000516B5@vpn.id2.novell.com> <200910201142.34006.rusty@rustcorp.com.au> <1256002193.6546.2.camel@slab>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1256002193.6546.2.camel@slab>
Content-Disposition: inline
Sender: kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
Cc: Jan Beulich <JBeulich-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

BUILD_BUG_ON used to use the optimizer to do code elimination or fail
at link time; it was changed to first the size of a negative array (a
nicer compile time error), then (in
8c87df457cb58fe75b9b893007917cf8095660a0) to a bitfield.

bitfields: needs a literal constant at parse time, and can't be put under
	"if (__builtin_constant_p(x))" for example.
negative array: can handle anything, but if the compiler can't tell it's
	a constant, silently has no effect.
link time: breaks link if the compiler can't determine the value, but the
	linker output is not usually as informative as a compiler error.

If we use the negative-array-size method *and* the link time trick,
we get the ability to use BUILD_BUG_ON() under __builtin_constant_p()
branches, and maximal ability for the compiler to detect errors at
build time.

Signed-off-by: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>

diff --git a/include/linux/kernel.h b/include/linux/kernel.h
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -683,12 +683,6 @@ struct sysinfo {
 	char _f[20-2*sizeof(long)-sizeof(int)];	/* Padding: libc5 uses this.. */
 };
 
-/* Force a compilation error if condition is true */
-#define BUILD_BUG_ON(condition) ((void)BUILD_BUG_ON_ZERO(condition))
-
-/* Force a compilation error if condition is constant and true */
-#define MAYBE_BUILD_BUG_ON(cond) ((void)sizeof(char[1 - 2 * !!(cond)]))
-
 /* Force a compilation error if condition is true, but also produce a
    result (of value 0 and type size_t), so the expression can be used
    e.g. in a structure initializer (or where-ever else comma expressions
@@ -696,6 +690,33 @@ struct sysinfo {
 #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:-!!(e); }))
 #define BUILD_BUG_ON_NULL(e) ((void *)sizeof(struct { int:-!!(e); }))
 
+/**
+ * BUILD_BUG_ON - break compile if a condition is true.
+ * @cond: the condition which the compiler should know is false.
+ *
+ * If you have some code which relies on certain constants being equal, or
+ * other compile-time-evaluated condition, you should use BUILD_BUG_ON to
+ * detect if someone changes it.
+ *
+ * The implementation uses gcc's reluctance to create a negative array, but
+ * gcc (as of 4.4) only emits that error for obvious cases (eg. not arguments
+ * to inline functions).  So as a fallback we use the optimizer; if it can't
+ * prove the condition is false, it will cause a link error on the undefined
+ * "__build_bug_on_failed".  This error message can be harder to track down
+ * though, hence the two different methods.
+ */
+#ifndef __OPTIMIZE__
+#define BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(condition)]))
+#else
+extern int __build_bug_on_failed;
+#define BUILD_BUG_ON(condition)					\
+	do {							\
+		((void)sizeof(char[1 - 2*!!(condition)]));	\
+		if (condition) __build_bug_on_failed = 1;	\
+	} while(0)
+#endif
+#define MAYBE_BUILD_BUG_ON(condition) BUILD_BUG_ON(condition)
+
 /* Trap pasters of __FUNCTION__ at compile-time */
 #define __FUNCTION__ (__func__)
 
