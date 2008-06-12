From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: powerpc build failure
Date: Thu, 12 Jun 2008 09:47:02 +0200
Message-ID: <20080612074702.GA18419@elte.hu>
References: <20080611192748.686236fd.sfr@canb.auug.org.au> <20080611095951.GB14033@elte.hu> <18512.32267.636550.47385@cargo.ozlabs.ibm.com> <20080612053335.GA22035@bubble.grove.modra.org> <20080612170505.6049fa75.sfr@canb.auug.org.au> <20080612071612.GB28590@elte.hu> <20080612172754.91460af2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:54791 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751958AbYFLHrt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 03:47:49 -0400
Content-Disposition: inline
In-Reply-To: <20080612172754.91460af2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alan Modra <amodra@bigpond.net.au>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linuxppc-dev@ozlabs.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> On Thu, 12 Jun 2008 09:16:12 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > ugh, please do that hack only privately in your allyesconfig testing 
> > and do not commit that change to linux-next!
> 
> See my other email, I have removed the ftrace disabling patch and 
> reverted one of Sam Ravnborg's instead.

thanks.

	Ingo
