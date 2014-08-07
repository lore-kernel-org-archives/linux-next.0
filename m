From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: linux-next: Tree for Aug 6 (sun6i-dma.c)
Date: Thu, 07 Aug 2014 09:56:14 +0200
Message-ID: <1407398174.3373.1.camel@paszta.hi.pengutronix.de>
References: <20140806172857.44a2a900@canb.auug.org.au>
	 <53E25AFF.6030409@infradead.org> <53E262BF.7040509@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:50656 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754072AbaHGH4g (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Aug 2014 03:56:36 -0400
In-Reply-To: <53E262BF.7040509@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, Sugar <shuge@allwinnertech.com>, Maxime Ripard <maxime.ripard@free-electrons.com>

Am Mittwoch, den 06.08.2014, 10:15 -0700 schrieb Randy Dunlap:
> On 08/06/14 09:42, Randy Dunlap wrote:
> > On 08/06/14 00:28, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Please do not add code intended for v3.18 until after v3.17-rc1 is
> >> released.
> >>
> >> Changes since 20140805:
> >>
> > 
> > on x86_64:
> > when CONFIG_RESET_CONTROLLER is not enabled:
> > 
> > ../drivers/dma/sun6i-dma.c: In function 'sun6i_dma_probe':
> > ../drivers/dma/sun6i-dma.c:911:2: error: implicit declaration of function 'devm_reset_control_get' [-Werror=implicit-function-declaration]
> > 
> > Add a stub for that function?

There is no stub for this function by choice.
Drivers that can accept stubbed out CONFIG_RESET_CONTROLLER functions
should use devm_reset_control_get_optional instead.

> or that driver's Kconfig entry could select RESET_CONTROLLER.

Yes, please.

regards
Philipp
