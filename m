From: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH V3] printk/cache: Mark printk_once test variable
 __read_mostly
Date: Wed, 13 Nov 2013 17:16:14 -0800
Message-ID: <1384391774.32748.22.camel@joe-AO722>
References: <1383128301-20231-1-git-send-email-james.hogan@imgtec.com>
	 <20131030134839.8bdf70cc68d1bf0beb1fb63a@linux-foundation.org>
	 <1383244173.8740.9.camel@joe-AO722>
	 <CA+8MBb+rrAWSTTvO4cx32ju-QOAG6aHHxR9B=sLtGXR3q8DF0A@mail.gmail.com>
	 <1384302563.3665.28.camel@joe-AO722>
	 <CA+8MBbJKN174=ybMNE7Z+oT7KjNBzgdy9cvhb_kACvXAbTo9XA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+8MBbJKN174=ybMNE7Z+oT7KjNBzgdy9cvhb_kACvXAbTo9XA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony Luck <tony.luck-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Wed, 2013-11-13 at 11:31 -0800, Tony Luck wrote:
> On Tue, Nov 12, 2013 at 4:29 PM, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote:
> > try this:
> >
> > https://lkml.org/lkml/2013/10/30/604
> >
> >
> 
> How is that any different from what is in linux-next?  It still
> has the same change to cache.h that reduces the nested
> #includes that currently make the build work.
> 
> -#include <linux/kernel.h>
> +#include <uapi/linux/kernel.h>
> 
> -Tony

I believe you were cc'd on this email as
a reply to a kbuild test robot report:

I don't have an ia64 cross compiler here but
my presumption is this fixes the problem.

I believe Andrew has picked it up for his mm
series which is haphazardly merged into -next.

-----------

On Thu, 2013-11-07 at 10:54 +0800, kbuild test robot wrote:
> tree:   git://git.cmpxchg.org/linux-mmotm.git master
> head:   7610384ab26340452f06d673c46624927c3901b6
> commit: 7231446cc53d71e126acf3d0230239a6b3ad52bf [169/450] printk/cache: Mark printk_once test variable __read_mostly
> config: make ARCH=ia64 alldefconfig
> 
> All error/warnings:

Hello Fengguang.

>    In file included from arch/ia64/kernel/patch.c:12:0:
>    arch/ia64/include/asm/processor.h: In function 'ia64_get_irr':
> >> arch/ia64/include/asm/processor.h:565:2: error: implicit declaration of function 'test_bit' [-Werror=implicit-function-declaration]

I'm a bit confused how the change I made could cause this error.

Is this an existing warning that's now an error because
bitops.h isn't explicitly #included in processor.h?

(possible fix below)

>    In file included from include/linux/bitops.h:22:0,
>                     from include/linux/kernel.h:10,
>                     from include/asm-generic/bug.h:13,
>                     from arch/ia64/include/asm/bug.h:12,
>                     from include/linux/bug.h:4,
>                     from include/linux/thread_info.h:11,
>                     from include/linux/preempt.h:9,
>                     from include/linux/uaccess.h:4,
>                     from arch/ia64/include/asm/sections.h:10,
>                     from arch/ia64/kernel/patch.c:13:
>    arch/ia64/include/asm/bitops.h: At top level:
> >> arch/ia64/include/asm/bitops.h:339:1: error: static declaration of 'test_bit' follows non-static declaration
>    arch/ia64/include/asm/processor.h:565:9: note: previous implicit declaration of 'test_bit' was here
>    cc1: some warnings being treated as errors
> 
> vim +/test_bit +565 arch/ia64/include/asm/processor.h
> 
>    549        #define cpu_relax()     ia64_hint(ia64_hint_pause)
>    550        
>    551        static inline int
>    552        ia64_get_irr(unsigned int vector)
>    553        {
>    554                unsigned int reg = vector / 64;
>    555                unsigned int bit = vector % 64;
>    556                u64 irr;
>    557        
>    558                switch (reg) {
>    559                case 0: irr = ia64_getreg(_IA64_REG_CR_IRR0); break;
>    560                case 1: irr = ia64_getreg(_IA64_REG_CR_IRR1); break;
>    561                case 2: irr = ia64_getreg(_IA64_REG_CR_IRR2); break;
>    562                case 3: irr = ia64_getreg(_IA64_REG_CR_IRR3); break;
>    563                }
>    564        
>  > 565                return test_bit(bit, &irr);
>    566        }
>    567        
>    568        static inline void
>    569        ia64_set_lrr0 (unsigned long val)
>    570        {
>    571                ia64_setreg(_IA64_REG_CR_LRR0, val);
>    572                ia64_srlz_d();
>    573        }
> 
> ---
> 0-DAY kernel build testing backend              Open Source Technology Center
> http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation

Maybe this fixes it?
---
 arch/ia64/include/asm/processor.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/ia64/include/asm/processor.h b/arch/ia64/include/asm/processor.h
index 5a84b3a..efd1b92 100644
--- a/arch/ia64/include/asm/processor.h
+++ b/arch/ia64/include/asm/processor.h
@@ -71,6 +71,7 @@
 #include <linux/compiler.h>
 #include <linux/threads.h>
 #include <linux/types.h>
+#include <linux/bitops.h>
 
 #include <asm/fpu.h>
 #include <asm/page.h>


--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
