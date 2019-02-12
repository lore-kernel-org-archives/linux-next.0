From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: linux-next: manual merge of the rtc tree with the clk tree
Date: Tue, 12 Feb 2019 22:14:47 +0100
Message-ID: <20190212211447.GB10129@piout.net>
References: <20190211161731.56897159@canb.auug.org.au>
 <155000535897.115909.9366893166102514791@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <155000535897.115909.9366893166102514791@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
List-Id: linux-next.vger.kernel.org

Hi Stephen and Stephen,

On 12/02/2019 13:02:38-0800, Stephen Boyd wrote:
> Quoting Stephen Rothwell (2019-02-10 21:17:31)
> > Hi all,
> > 
> > Today's linux-next merge of the rtc tree got a conflict in:
> > 
> >   drivers/clk/at91/sama5d2.c
> > 
> > between commit:
> > 
> >   77977b800451 ("clk: at91: enable AUDIOPLL as source for PCKx on SAMA5D2")
> > 
> > from the clk tree and commit:
> > 
> >   34d2ff2a6019 ("clk: at91: fix masterck name")
> > 
> > from the rtc tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> 
> Thanks. Looks good to me.

Actually, that was my mistake and I removed it from the RTC tree. I'm
really intending for "clk: at91: fix masterck name" to go through the
clk tree. I simply forgot to remove the patch from this branch after
testing it...

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
