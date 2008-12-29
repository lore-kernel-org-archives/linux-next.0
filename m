From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: timers tree build failure
Date: Mon, 29 Dec 2008 10:31:25 +0100
Message-ID: <20081229093125.GA27293@elte.hu>
References: <20081229133028.363f5094.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:42650 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752971AbYL2Jbm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 04:31:42 -0500
Content-Disposition: inline
In-Reply-To: <20081229133028.363f5094.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Takashi Iwai <tiwai@suse.de>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> sound/core/hrtimer.c: In function 'snd_hrtimer_open':
> sound/core/hrtimer.c:60: error: 'struct hrtimer' has no member named 'cb_mode'
> sound/core/hrtimer.c:60: error: 'HRTIMER_CB_IRQSAFE_UNLOCKED' undeclared (first use in this function)
> 
> See below ... the sound tree changes are now in Linus' tree, so this
> needs fixing before the timers tree gets merged.
> 
> I have applied the merge fix below (which is also in the sound tree) to 
> the timers tree for today.

yes, trivial oneliner conflict, i pushed out a new auto-timers-next tree.

	Ingo
