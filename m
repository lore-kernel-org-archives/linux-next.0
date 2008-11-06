From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: testing of new cpumask API introduction patch
Date: Thu, 6 Nov 2008 09:08:37 +0100
Message-ID: <20081106080837.GA22574@elte.hu>
References: <20081106110539.22fd7426.sfr@canb.auug.org.au> <20081106055947.GA4031@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:58463 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752034AbYKFII6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Nov 2008 03:08:58 -0500
Content-Disposition: inline
In-Reply-To: <20081106055947.GA4031@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>


* Ingo Molnar <mingo@elte.hu> wrote:

> > Today I have temporarily dropped the cpus4096 tree from linux-next 
> > in order to integrate and test Rusty's API introducing only patch.  
> > Linus has said he will consider this patch for 2.6.28 if it is 
> > very contained and has no net effect - which is what it looks like 
> > (having reviewed the patch).
> > 
> > Of course, if Linus' takes Rusty's patch, it will mean significant 
> > changes for the cpus4096 tree and this may be one case where 
> > rebasing the tree makes sense.  But we should burn that bridge 
> > when we come to it.
> 
> Rusty, could you please send a patch that introduces the new header 
> on the cpus4096 tree, without killing all the stuff that's tested in 
> there?

Stephen, could you please re-pickup the cpus4096 branch and drop the 
out-of-flow patch (which is the same patch)? I've added Rusty's patch 
and disabled the topic that had the other, more intrusive changes - 
and started testing it.

	Ingo
