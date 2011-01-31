From: Jaswinder Singh <jaswinderlinux@gmail.com>
Subject: Re: linux-next: build warnings after merge of the tip tree
Date: Mon, 31 Jan 2011 10:38:35 +0530
Message-ID: <AANLkTi=+VtHwRMkxq+BK3wRDE9fiAZCy=5dypn45o=Hz@mail.gmail.com>
References: <20110131152756.0f1b1026.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:59835 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750698Ab1AaFIg (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Jan 2011 00:08:36 -0500
In-Reply-To: <20110131152756.0f1b1026.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Venkatesh Pallipadi <venki@google.com>

Hello,

On Mon, Jan 31, 2011 at 9:57 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the tip tree, today's linux-next build (powerpc
> ppc64_defconfig) produced these warnings:
>
> kernel/sched.c:3719: warning: 'irqtime_account_idle_ticks' defined but not used
> kernel/sched.c:3720: warning: 'irqtime_account_process_tick' defined but not used
>

These functions should move inside ifndef CONFIG_VIRT_CPU_ACCOUNTING

Thanks,
--
Jaswinder Singh.
