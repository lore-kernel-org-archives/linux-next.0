From: =?UTF-8?Q?Am=C3=A9rico_Wang?= <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] BUILD_BUG_ON: make it handle more cases
Date: Fri, 23 Oct 2009 09:50:05 +0800
Message-ID: <2375c9f90910221850r584e16a9k924aa2e0861bd358@mail.gmail.com>
References: <4AC1E15502000078000516B5@vpn.id2.novell.com>
	 <200910201142.34006.rusty@rustcorp.com.au>
	 <1256002193.6546.2.camel@slab>
	 <200910201415.34361.rusty@rustcorp.com.au>
	 <20091020135835.GB2462@hack>
	 <9b2b86520910200743h4e134cf8jd2860d42b3936597@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9b2b86520910200743h4e134cf8jd2860d42b3936597-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: kvm-ppc-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Jenkins <sourcejedi.lkml-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>, Hollis Blanchard <hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Jan Beulich <JBeulich-Et1tbQHTxzrQT0dZR+AlfA@public.gmane.org>, sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Tue, Oct 20, 2009 at 10:43 PM, Alan Jenkins
<sourcejedi.lkml-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> On 10/20/09, Am=C3=A9rico Wang <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Tue, Oct 20, 2009 at 02:15:33PM +1030, Rusty Russell wrote:
>>>BUILD_BUG_ON used to use the optimizer to do code elimination or fai=
l
>>>at link time; it was changed to first the size of a negative array (=
a
>>>nicer compile time error), then (in
>>>8c87df457cb58fe75b9b893007917cf8095660a0) to a bitfield.
>>>
>>>bitfields: needs a literal constant at parse time, and can't be put =
under
>>> =C2=A0 =C2=A0 =C2=A0"if (__builtin_constant_p(x))" for example.
>>>negative array: can handle anything, but if the compiler can't tell =
it's
>>> =C2=A0 =C2=A0 =C2=A0a constant, silently has no effect.
>>>link time: breaks link if the compiler can't determine the value, bu=
t the
>>> =C2=A0 =C2=A0 =C2=A0linker output is not usually as informative as =
a compiler error.
>>>
>>>If we use the negative-array-size method *and* the link time trick,
>>>we get the ability to use BUILD_BUG_ON() under __builtin_constant_p(=
)
>>>branches, and maximal ability for the compiler to detect errors at
>>>build time.
>>>
>>>Signed-off-by: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
>>>
>>>diff --git a/include/linux/kernel.h b/include/linux/kernel.h
>>>--- a/include/linux/kernel.h
>>>+++ b/include/linux/kernel.h
>>>@@ -683,12 +683,6 @@ struct sysinfo {
>>> =C2=A0 =C2=A0 =C2=A0char _f[20-2*sizeof(long)-sizeof(int)]; /* Padd=
ing: libc5 uses this.. */
>>> };
>>>
>>>-/* Force a compilation error if condition is true */
>>>-#define BUILD_BUG_ON(condition) ((void)BUILD_BUG_ON_ZERO(condition)=
)
>>>-
>>>-/* Force a compilation error if condition is constant and true */
>>>-#define MAYBE_BUILD_BUG_ON(cond) ((void)sizeof(char[1 - 2 * !!(cond=
)]))
>>>-
>>> /* Force a compilation error if condition is true, but also produce=
 a
>>> =C2=A0 =C2=A0result (of value 0 and type size_t), so the expression=
 can be used
>>> =C2=A0 =C2=A0e.g. in a structure initializer (or where-ever else co=
mma expressions
>>>@@ -696,6 +690,33 @@ struct sysinfo {
>>> #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:-!!(e); }))
>>> #define BUILD_BUG_ON_NULL(e) ((void *)sizeof(struct { int:-!!(e); }=
))
>>>
>>>+/**
>>>+ * BUILD_BUG_ON - break compile if a condition is true.
>>>+ * @cond: the condition which the compiler should know is false.
>>>+ *
>>>+ * If you have some code which relies on certain constants being eq=
ual, or
>>>+ * other compile-time-evaluated condition, you should use BUILD_BUG=
_ON to
>>>+ * detect if someone changes it.
>>>+ *
>>>+ * The implementation uses gcc's reluctance to create a negative ar=
ray,
>>> but
>>>+ * gcc (as of 4.4) only emits that error for obvious cases (eg. not
>>> arguments
>>>+ * to inline functions). =C2=A0So as a fallback we use the optimize=
r; if it
>>> can't
>>>+ * prove the condition is false, it will cause a link error on the
>>> undefined
>>>+ * "__build_bug_on_failed". =C2=A0This error message can be harder =
to track
>>> down
>>>+ * though, hence the two different methods.
>>>+ */
>>>+#ifndef __OPTIMIZE__
>>>+#define BUILD_BUG_ON(condition) ((void)sizeof(char[1 - 2*!!(conditi=
on)]))
>>>+#else
>>>+extern int __build_bug_on_failed;
>>
>> Hmm, what exactly is __build_bug_on_failed?
>
> Well, we haven't added a definition for it in this patch. =C2=A0I'm s=
ure
> grep will tell you it wasn't defined before hand either. =C2=A0So any
> reference to it is an error - which will be reported at link time.
>
>>>+#define BUILD_BUG_ON(condition) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\
>>>+ =C2=A0 =C2=A0 do { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>>>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((void)sizeof(char[1 - 2=
*!!(condition)])); =C2=A0 =C2=A0 =C2=A0\
>>>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (condition) __build_b=
ug_on_failed =3D 1; =C2=A0 =C2=A0 =C2=A0 \
>
> If "condition" is known false at compile time, gcc -O will eliminate
> the code which refers to __build_bug_on_failed. =C2=A0If it's not pro=
ved to
> be false - it will break the build, which is exactly what we want
> BUILD_BUG_ON to do.

Ah, clever trick! Got it.
Thanks!

Reviewed-by: WANG Cong <xiyou.wangcong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
