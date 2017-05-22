From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Date: Mon, 22 May 2017 09:32:15 +0100
Message-ID: <20170522083214.GA1478@leverpostej>
References: <20170522132711.22b80ff5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:33034 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751645AbdEVIdV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 May 2017 04:33:21 -0400
Content-Disposition: inline
In-Reply-To: <20170522132711.22b80ff5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>

On Mon, May 22, 2017 at 01:27:11PM +1000, Stephen Rothwell wrote:
> Hi all,

Hi,

> Today's linux-next merge of the tip tree got a conflict in:
> 
>   arch/arm64/include/asm/cpufeature.h
> 
> between commit:
> 
>   63a1e1c95e60 ("arm64/cpufeature: don't use mutex in bringup path")
> 
> from Linus' tree and commit:
> 
>   d54bb72551b9 ("arm64/cpufeature: Use static_branch_enable_cpuslocked()")
> 
> from the tip tree.

Just to check, is your copy of tip up-to-date?

That latter commit was in the tip smp/hotplug branch, but that branch
was reset to v4.12-rc1 a few days ago (before the first commit was sent
to Linus), specifically to avoid this conflict.

... did we miss another branch that was merged into, perhaps?

> I have no idea what the correct resolution is here, so I have just gone
> with the former for now (i.e. removed the
> static_branch_enable_cpuslocked() call).  This will probably need a
> better (or even correct :-)) fix.

The good news is that the commit in Linus' tree is the correct fix. :)

The other commit was a slightly broken prior attempt, and shouldn't be
in the tip tree any more.

> I fixed it up (see above) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

We tried, but evidently something went wrong. :/

Thanks,
Mark.
