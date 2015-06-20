From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: manual merge of the tip tree with the modules tree
Date: Sat, 20 Jun 2015 10:55:15 +0200
Message-ID: <20150620085515.GM19282@twins.programming.kicks-ass.net>
References: <20150620183558.51a6296c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:33502 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751139AbbFTIzb (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 20 Jun 2015 04:55:31 -0400
Content-Disposition: inline
In-Reply-To: <20150620183558.51a6296c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jun 20, 2015 at 06:35:58PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   include/linux/seqlock.h
> 
> between commit:
> 
>   7fc26327b756 ("seqlock: Introduce raw_read_seqcount_latch()")
> 
> from the modules tree and commit:
> 
>   c4bfa3f5f906 ("seqcount: Introduce raw_write_seqcount_barrier()")
> 
> from the tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Oh my that's unfortunate, those two patches just touching at the edge.
Resolution looks good.

Thanks.
