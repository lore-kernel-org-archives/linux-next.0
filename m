From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: ftrace tree build failure
Date: Tue, 25 Nov 2008 09:04:10 +0100
Message-ID: <20081125080410.GA28912@elte.hu>
References: <20081125140719.03a8cdfb.sfr@canb.auug.org.au> <20081125072801.GA15592@elte.hu> <20081125184335.330cf28e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:60707 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751390AbYKYIEn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 03:04:43 -0500
Content-Disposition: inline
In-Reply-To: <20081125184335.330cf28e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Steven Rostedt <srostedt@redhat.com>, "Luis R. Rodriguez" <lrodriguez@atheros.com>, "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> On Tue, 25 Nov 2008 08:28:01 +0100 Ingo Molnar <mingo@elte.hu> wrote:
> >
> > this fix is wrong - the intention of that line was to add a proper 
> > WARN(), not a WARN_ON(). Your change loses the message that WARN() 
> > prints.
> > 
> > i posted a tested fix for this two days ago:
> > 
> >   http://marc.info/?l=linux-kernel&m=122745649425646&w=2
> > 
> > see it also below.
> 
> Yeah, Steve told me.  However, it might have been useful to tell the 
> wireless maintainer, the network maintainer and the original author 
> (and probably netdev - which I also left off).

yep, i too forgot to add full Cc:s (it was in the context of a tracing 
discussion) - but lkml was Cc:-ed so it wasnt actually lost.

	Ingo
