From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 15 Jun 2017 11:35:48 +1000
Message-ID: <20170615113548.3e4edcf4@canb.auug.org.au>
References: <20170605170117.6a1fc15e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45117 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750770AbdFOBfu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Jun 2017 21:35:50 -0400
In-Reply-To: <20170605170117.6a1fc15e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Micay <danielmicay@gmail.com>, Kees Cook <keescook@chromium.org>

Hi all,

On Mon, 5 Jun 2017 17:01:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> sound/pcmcia/pdaudiocf/pdaudiocf.o: warning: objtool: .text: unexpected end of section
> arch/x86/ras/mce_amd_inj.o: warning: objtool: inj_readme_read() falls through to next function extcpu_fops_open()
> sound/sound_core.o: warning: objtool: register_sound_special_device() falls through to next function register_sound_special()
> 
> and many more like those. Also:
> 
> In file included from /home/sfr/next/next/include/linux/bitmap.h:8:0,
>                  from /home/sfr/next/next/include/linux/cpumask.h:11,
>                  from /home/sfr/next/next/arch/x86/include/asm/cpumask.h:4,
>                  from /home/sfr/next/next/arch/x86/include/asm/msr.h:10,
>                  from /home/sfr/next/next/arch/x86/include/asm/processor.h:20,
>                  from /home/sfr/next/next/arch/x86/include/asm/cpufeature.h:4,
>                  from /home/sfr/next/next/arch/x86/include/asm/thread_info.h:52,
>                  from /home/sfr/next/next/include/linux/thread_info.h:37,
>                  from /home/sfr/next/next/arch/x86/include/asm/preempt.h:6,
>                  from /home/sfr/next/next/include/linux/preempt.h:80,
>                  from /home/sfr/next/next/include/linux/spinlock.h:50,
>                  from /home/sfr/next/next/include/linux/mmzone.h:7,
>                  from /home/sfr/next/next/include/linux/gfp.h:5,
>                  from /home/sfr/next/next/arch/x86/power/hibernate_64.c:11:
> In function 'memcpy',
>     inlined from 'relocate_restore_code' at /home/sfr/next/next/arch/x86/power/hibernate_64.c:150:2,
>     inlined from 'swsusp_arch_resume' at /home/sfr/next/next/arch/x86/power/hibernate_64.c:185:8:
> /home/sfr/next/next/include/linux/string.h:309:4: error: call to '__read_overflow2' declared with attribute error: detected read beyond size of object passed as 2nd parameter
>     __read_overflow2();
>     ^
> 
> Caused by commit
> 
>   088a5ecf7581 ("include/linux/string.h: add the option of fortified string.h functions")
> 
> We really need to fix all the known problems it detects *before*
> merging this commit ...
> 
> I have reverted it for today.

I am still needing to revert this every day ...

-- 
Cheers,
Stephen Rothwell
