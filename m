From: Tony Luck <tony.luck@gmail.com>
Subject: Re: [PATCH V3] printk/cache: Mark printk_once test variable __read_mostly
Date: Tue, 12 Nov 2013 16:23:19 -0800
Message-ID: <CA+8MBb+rrAWSTTvO4cx32ju-QOAG6aHHxR9B=sLtGXR3q8DF0A@mail.gmail.com>
References: <1383128301-20231-1-git-send-email-james.hogan@imgtec.com>
	<20131030134839.8bdf70cc68d1bf0beb1fb63a@linux-foundation.org>
	<1383244173.8740.9.camel@joe-AO722>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vb0-f52.google.com ([209.85.212.52]:43099 "EHLO
	mail-vb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755457Ab3KMAXU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2013 19:23:20 -0500
In-Reply-To: <1383244173.8740.9.camel@joe-AO722>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, James Hogan <james.hogan@imgtec.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, linux-metag@vger.kernel.org

Trying this again with HTML disabled in gmail so mailing lists will see=
 it ...

On Thu, Oct 31, 2013 at 11:29 AM, Joe Perches <joe@perches.com> wrote:
> diff --git a/include/linux/cache.h b/include/linux/cache.h
> index 4c57065..17e7e82 100644
> --- a/include/linux/cache.h
> +++ b/include/linux/cache.h
> @@ -1,11 +1,11 @@
>  #ifndef __LINUX_CACHE_H
>  #define __LINUX_CACHE_H
>
> -#include <linux/kernel.h>
> +#include <uapi/linux/kernel.h>
>  #include <asm/cache.h>

This bit seems to be responsible for breaking the ia64 build
in today's linux-next (tag: next-20131112)

Compiler barfs at:
   CC      arch/ia64/kernel/patch.o
In file included from arch/ia64/kernel/patch.c:12:
/home/aegl/zx1-smp/arch/ia64/include/asm/processor.h: In function
=91ia64_get_irr=92:
/home/aegl/zx1-smp/arch/ia64/include/asm/processor.h:565: error:
implicit declaration of function =91test_bit=92
In file included from include/linux/bitops.h:33,
                 from include/linux/kernel.h:10,
                 from include/asm-generic/bug.h:13,
                 from /home/aegl/zx1-smp/arch/ia64/include/asm/bug.h:12=
,
                 from include/linux/bug.h:4,
                 from include/linux/thread_info.h:11,
                 from include/asm-generic/preempt.h:4,
                 from arch/ia64/include/generated/asm/preempt.h:1,
                 from include/linux/preempt.h:18,
                 from include/linux/uaccess.h:4,
                 from /home/aegl/zx1-smp/arch/ia64/include/asm/sections=
=2Eh:10,
                 from arch/ia64/kernel/patch.c:13:
/home/aegl/zx1-smp/arch/ia64/include/asm/bitops.h: At top level:
/home/aegl/zx1-smp/arch/ia64/include/asm/bitops.h:339: error: static
declaration of =91test_bit=92 follows non-static declaration
/home/aegl/zx1-smp/arch/ia64/include/asm/processor.h:565: error:
previous implicit declaration of =91test_bit=92 was here
make[1]: *** [arch/ia64/kernel/patch.o] Error 1
make: *** [arch/ia64/kernel/patch.o] Error 2

Other files choke in the similar way because they no longer implicitly
get <linux/kernel.h>
(and all the other files that pulls in). Just backing out that one
line of diff fixes it for me.
But presumably is a problem someplace else given the "avoid recursive #=
includes"
bit of the commit message.

-Tony
