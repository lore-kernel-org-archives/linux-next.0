From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: linux-next: build failure after merge of the mmc tree
Date: Mon, 6 Jan 2014 14:30:03 +0800
Message-ID: <20140106063000.GC26128@S2101-09.ap.freescale.net>
References: <20131213125716.f432c59bf8782a489400a5a7@canb.auug.org.au>
 <20131217132838.cc16a4dbac2f4d3218bbed1d@canb.auug.org.au>
 <CAA+hA=Shwn1P25+xB+VogD+9n7gdvCmJ-EG6khgf3a2gjGwTJQ@mail.gmail.com>
 <20131217031600.GG6691@S2101-09.ap.freescale.net>
 <CAA+hA=QU1TApbbohD1iNFiMMMHdQSamRfOsO0r3GpqmCbdiSgw@mail.gmail.com>
 <20140106172243.8067c8e72c666511129a9701@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]:52000
	"EHLO co1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751218AbaAFG3z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Jan 2014 01:29:55 -0500
Content-Disposition: inline
In-Reply-To: <20140106172243.8067c8e72c666511129a9701@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dong Aisheng <dongas86@gmail.com>, Chris Ball <cjb@laptop.org>, linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dong Aisheng <b29396@freescale.com>

Hi Stephen,

On Mon, Jan 06, 2014 at 05:22:43PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 17 Dec 2013 16:06:19 +0800 Dong Aisheng <dongas86@gmail.com> wrote:
> >
> > I tested that Chris tree does not have problem.
> > It's caused by IMX tree updates.
> > 
> > Chris,
> > Is the way Shawn suggested OK for you?
> 
> Can we have some resolution of this please?  This failed to build again
> today so I have used the version of the mmc tree from next-20131212
> again.  I tried the obvious fix (s/pinctrl_usdhc4_1/pinctrl_usdhc4/) but
> that didn't work.

I'm afraid that using a working mmc tree next branch might be the only
option until Chris comes online to drop the patch from his tree.

Shawn
