From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Fri, 18 Jul 2014 12:16:23 -0700
Message-ID: <53C97287.5020509@zytor.com>
References: <20140718150005.73db8eb9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:43008 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755373AbaGRTRR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jul 2014 15:17:17 -0400
In-Reply-To: <20140718150005.73db8eb9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>, Linus Torvalds <torvalds@linux-foundation.org>

On 07/17/2014 10:00 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
> 
> In file included from arch/x86/vdso/vdso2c.c:161:0: 
> arch/x86/vdso/vdso2c.c: In function 'main': 
> arch/x86/vdso/vdso2c.h:118:6: warning: assuming signed overflow
> does not occur when assuming that (X + c) < X is always false
> [-Wstrict-overflow] In file included from
> arch/x86/vdso/vdso2c.c:165:0: arch/x86/vdso/vdso2c.h:118:6:
> warning: assuming signed overflow does not occur when assuming that
> (X + c) < X is always false [-Wstrict-overflow]
> 
> Probably introduced by commit e6577a7ce99a ("x86, vdso: Move the
> vvar area before the vdso text").
> 

This seems toxic.

I always wonder if we shouldn't use -fwrapv for the kernel...

	-hpa
