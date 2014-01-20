From: Len Brown <lenb@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Date: Sun, 19 Jan 2014 20:00:19 -0500
Message-ID: <CAJvTdKmdopjSopfHrZRKXJBKqjizrFHich+dQCd6Fq7C3bOogw@mail.gmail.com>
References: <20140116145829.5e4fcab103b1c5c77501ee77@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f44.google.com ([74.125.82.44]:55245 "EHLO
	mail-wg0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752245AbaATBAU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 19 Jan 2014 20:00:20 -0500
In-Reply-To: <20140116145829.5e4fcab103b1c5c77501ee77@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jan 15, 2014 at 10:58 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>
> arch/x86/kernel/process.c: In function 'mwait_idle':
> /scratch/sfr/next/arch/x86/kernel/process.c:434:3: error: implicit declaration of function '__monitor' [-Werror=implicit-function-declaration]
>    __monitor((void *)&current_thread_info()->flags, 0, 0);
>    ^
> arch/x86/kernel/process.c:437:4: error: implicit declaration of function '__sti_mwait' [-Werror=implicit-function-declaration]
>     __sti_mwait(0, 0);
>     ^
>
> Caused by commit 16824255394f ("x86, acpi, idle: Restructure the mwait
> idle routines") interacting with commit 7760518cce95 ("x86 idle: restore
> mwait_idle()") from the idle tree.
>
> I am not sure how to fix this so I just reverted the idle tree commit for
> now (since it reverted cleanly). Please let me know if there is a better
> solution.

IMO, a regression fix (restore mwait_idle()) is more important than a clean up
(restructure mwait routines), and the clean-up should take a back seat;
in -tip, in -next, upstream, and in -stable.

Also, I'm wondering if that clean-up went too far -- as not all users of mwait
are necessarily under the same conditions...

thanks,
Len Brown, Intel Open Source Technology Center
