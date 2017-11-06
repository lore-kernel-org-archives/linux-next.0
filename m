From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: manual merge of the tip tree with the pm tree
Date: Mon, 06 Nov 2017 14:09:03 +0100
Message-ID: <2116937.mQ1ftdtgHJ@aspire.rjw.lan>
References: <20171106131040.6777cb03@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:53574 "EHLO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752300AbdKFNJG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Nov 2017 08:09:06 -0500
In-Reply-To: <20171106131040.6777cb03@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jason Baron <jbaron@akamai.com>, Andy Lutomirski <luto@kernel.org>

On Monday, November 6, 2017 3:10:40 AM CET Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   drivers/idle/intel_idle.c
> 
> between commit:
> 
>   0563bb7ba67e ("intel_idle: replace conditionals with static_cpu_has(X86_FEATURE_ARAT)")
> 
> from the pm tree and commit:
> 
>   675357362aeb ("Revert "x86/mm: Stop calling leave_mm() in idle code"")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The fix looks good to me, thanks!
