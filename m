From: Andreas Schwab <schwab@linux-m68k.org>
Subject: Re: [BUG -next] "futex: switch to USER_DS for futex test" breaks s390
Date: Fri, 03 Jan 2014 16:41:10 +0100
Message-ID: <87ppo95azt.fsf@igel.home>
References: <20140103141943.GA4219@osiris>
	<CAMuHMdVqP7RpZMMOk7DJYzYcOvXM68zsFeYd0JTvYNLaSAf2DQ@mail.gmail.com>
	<20140103153651.GB4219@osiris>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:42381 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752005AbaACPlP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Jan 2014 10:41:15 -0500
In-Reply-To: <20140103153651.GB4219@osiris> (Heiko Carstens's message of "Fri,
	3 Jan 2014 16:36:51 +0100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Tuxist <tuxist@tuxist.de>, Patrick McCarthy <patrickjmc@gmail.com>, Finn Thain <fthain@telegraphics.com.au>, Rusty Russell <rusty@rustcorp.com.au>, Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@linux.intel.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Linux-Next <linux-next@vger.kernel.org>

Heiko Carstens <heiko.carstens@de.ibm.com> writes:

> There is also other code that relies on this: e.g. copy_mount_options() my be
> called with KERNEL_DS.

With KERNEL_DS you can *only* access kernel memory, which is unpagable.
If you want to access user memory, you _must_ use USER_DS.

> If DEBUG_PAGEALLOC is turned on, it would crash badly in kernel space
> if it crosses page boundaries and touches an invalid page, even though
> it should survive...

Accessing an invalid page in kernel space is _always_ a bug.

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 58CA 54C7 6D53 942B 1756  01D3 44D5 214B 8276 4ED5
"And now for something completely different."
