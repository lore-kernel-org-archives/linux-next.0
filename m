From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the timers tree
Date: Tue, 21 Oct 2008 14:15:08 +0200
Message-ID: <20081021121508.GB9672@elte.hu>
References: <20081021124305.e6cdd2cc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:44444 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751954AbYJUMP3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Oct 2008 08:15:29 -0400
Content-Disposition: inline
In-Reply-To: <20081021124305.e6cdd2cc.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Arjan van de Ven <arjan@linux.intel.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the timers tree got a conflict in
> kernel/time/tick-sched.c between commit
> c34bec5a44e9486597d78e7a686b2f9088a0564c ("") from Linus' tree and commit
> cc584b213f252bf698849cf4be2377cd3ec7501a ("hrtimer: convert kernel/* to
> the new hrtimer apis") from the timers tree.
> 
> The former moved the code that the latter modified.  I fixed it up (see
> below).

thanks Stephen!

I have also pushed out a new tip/auto-timers-next tree which is 
conflict-free with latest -git. (it is the same)

	Ingo
