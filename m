From: Daniel Micay <danielmicay@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 05 Jun 2017 09:06:16 -0400
Message-ID: <1496667976.343.3.camel@gmail.com>
References: <20170605170117.6a1fc15e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:37756 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751382AbdFENGT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Jun 2017 09:06:19 -0400
In-Reply-To: <20170605170117.6a1fc15e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>

On Mon, 2017-06-05 at 17:01 +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> sound/pcmcia/pdaudiocf/pdaudiocf.o: warning: objtool: .text:
> unexpected end of section
> arch/x86/ras/mce_amd_inj.o: warning: objtool: inj_readme_read() falls
> through to next function extcpu_fops_open()
> sound/sound_core.o: warning: objtool: register_sound_special_device()
> falls through to next function register_sound_special()
> 
> and many more like those.

It looks like that's complaining about the __noreturn fortify_panic. It
isn't a compile-time error, just a false positive warning which needs to
be fixed in objtool. I guess it needs another symbol added to a hard-
wired list of __noreturn functions which sounds like it exists.

> In file included from /home/sfr/next/next/include/linux/bitmap.h:8:0,
>                  from /home/sfr/next/next/include/linux/cpumask.h:11,
>                  from
> /home/sfr/next/next/arch/x86/include/asm/cpumask.h:4,
>                  from
> /home/sfr/next/next/arch/x86/include/asm/msr.h:10,
>                  from
> /home/sfr/next/next/arch/x86/include/asm/processor.h:20,
>                  from
> /home/sfr/next/next/arch/x86/include/asm/cpufeature.h:4,
>                  from
> /home/sfr/next/next/arch/x86/include/asm/thread_info.h:52,
>                  from
> /home/sfr/next/next/include/linux/thread_info.h:37,
>                  from
> /home/sfr/next/next/arch/x86/include/asm/preempt.h:6,
>                  from /home/sfr/next/next/include/linux/preempt.h:80,
>                  from /home/sfr/next/next/include/linux/spinlock.h:50,
>                  from /home/sfr/next/next/include/linux/mmzone.h:7,
>                  from /home/sfr/next/next/include/linux/gfp.h:5,
>                  from
> /home/sfr/next/next/arch/x86/power/hibernate_64.c:11:
> In function 'memcpy',
>     inlined from 'relocate_restore_code' at
> /home/sfr/next/next/arch/x86/power/hibernate_64.c:150:2,
>     inlined from 'swsusp_arch_resume' at
> /home/sfr/next/next/arch/x86/power/hibernate_64.c:185:8:
> /home/sfr/next/next/include/linux/string.h:309:4: error: call to
> '__read_overflow2' declared with attribute error: detected read beyond
> size of object passed as 2nd parameter
>     __read_overflow2();
>     ^
> 
> Caused by commit
> 
>   088a5ecf7581 ("include/linux/string.h: add the option of fortified
> string.h functions")
> 
> We really need to fix all the known problems it detects *before*
> merging this commit ...
> 
> I have reverted it for today.

The errors caught at compile-time including these are all fixed, but not
all the fixes have landed in -next yet. They're in various other trees.
GCC 7 came out which found an extra bug or two which are now fixed too.
I guess those need to be queued up with it in -mm if it's going to land
with -mm but I wasn't sure how things were going to work.

It also probably finds more architecture-specific issues and may need
compatibility fixes for them. I could mark it as compatible with only
arm64 and x86(_64) since they're what I've tested to build and work at
runtime and the compile-time errors could be turned into warnings for
now, if it's mandatory that FORTIFY_SOURCE=y doesn't find problems at
compile-time anywhere. If it's a warning, it will still catch the issue
at runtime like the rest where the size isn't a constant.
