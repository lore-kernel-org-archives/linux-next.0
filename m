From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
Date: Thu, 6 Sep 2018 23:39:56 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1809062339150.1402@nanos.tec.linutronix.de>
References: <20180907072604.3b0019d1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180907072604.3b0019d1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, 7 Sep 2018, Stephen Rothwell wrote:
> Commit
> 
>   760902b24960 ("clocksource: Revert "Remove kthread"")
> 
> is missing a Signed-off-by from its committer.  Reverts are commits, too.

Duh. Fixed.

Thanks for spotting!

       tglx
