From: "Luis R. Rodriguez" <lrodriguez@atheros.com>
Subject: Re: linux-next: ftrace tree build failure
Date: Tue, 25 Nov 2008 16:14:58 -0800
Message-ID: <20081126001458.GM5950@tesla>
References: <20081125140719.03a8cdfb.sfr@canb.auug.org.au> <20081125072801.GA15592@elte.hu> <20081125184335.330cf28e.sfr@canb.auug.org.au> <20081125080410.GA28912@elte.hu> <20081125145701.GA25962@tuxdriver.com> <20081125184630.GA5950@tesla> <20081126110847.4d9cf9f2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.atheros.com ([12.36.123.2]:26934 "EHLO mail.atheros.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752360AbYKZAPA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 19:15:00 -0500
Received: from mail.atheros.com ([10.10.20.108])
	by sidewinder.atheros.com
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2008 16:15:00 -0800
Content-Disposition: inline
In-Reply-To: <20081126110847.4d9cf9f2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Luis Rodriguez <Luis.Rodriguez@Atheros.com>, "John W. Linville" <linville@tuxdriver.com>, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Steven Rostedt <srostedt@redhat.com>, "David S. Miller" <davem@davemloft.net>

On Tue, Nov 25, 2008 at 04:08:47PM -0800, Stephen Rothwell wrote:
> Hi,
> 
> On Tue, 25 Nov 2008 10:46:30 -0800 "Luis R. Rodriguez" <lrodriguez@atheros.com> wrote:
> >
> > On Tue, Nov 25, 2008 at 06:57:01AM -0800, John W. Linville wrote:
> > > I have the patch now...thanks!
> > > 
> > > Now, if I only knew why my build didn't fail with the original code...
> > 
> > Same here I run tests with sparse too prior to sending patches.
> 
> It is valid C.
> 
> 	if (a, b)
> 
> you evaluate a and discard it then evaluate b and that is the value of
> the conditional expression.  In this case b is just a string which is
> effectively a non NULL "const char *" which is just non zero as far as if
> is concerned. So the conditional expression evaluates to (constant)
> true.  So this was, in fact a bug ...

Thanks, and good catch :)

  Luis
