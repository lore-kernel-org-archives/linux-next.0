From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: concerns over the perfmon3 tree
Date: Wed, 26 Nov 2008 11:47:26 +0100
Message-ID: <20081126104726.GA8580@elte.hu>
References: <20081126213449.ab269449.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:36691 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751364AbYKZKrt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 05:47:49 -0500
Content-Disposition: inline
In-Reply-To: <20081126213449.ab269449.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: stephane eranian <eranian@googlemail.com>, linux-next@vger.kernel.org, paulus@samba.org, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Stephane,
> 
> Given the concerns expressed by Ingo, I have dropped the perfmon3 
> tree from linux-next until they have been addressed.  Hopefully that 
> will not be loo long.  Let us all know how we can help with this.

Thanks, we'll try to finish the review ASAP (today+tomorrow) so that 
it can be added back in 1-2 days. And it's sensible to keep it in the 
separate perfmon3 tree as well (as long as it's not rebased) - that's 
a convenient initial structure for new features.

( and the powerpc bits would be nice as well, they seem to be missing
  from the current lineup - the more architectures keep hitting on 
  that code, the better the end result. )

	Ingo
