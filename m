From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the arm-soc tree with the i2c-embedded tree
Date: Thu, 12 Jul 2012 15:54:02 +0000
Message-ID: <201207121554.03240.arnd@arndb.de>
References: <20120710164130.f38e4d1673f925ddb13914c9@canb.auug.org.au> <20120712131231.GH2194@pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.10]:60659 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932676Ab2GLPyV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Jul 2012 11:54:21 -0400
In-Reply-To: <20120712131231.GH2194@pengutronix.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Alessandro Rubini <rubini@gnudd.com>, Linus Walleij <linus.walleij@stericsson.com>

On Thursday 12 July 2012, Wolfram Sang wrote:
> 
> > I fixed it up (I think - see below) and can carry the fix as necessary.
> > Please check this and talk to each other ...
> 
> I also noticed the bindings today [1]. They came in via a seperate
> patch (suboptimal) which has no ack by a devicetree maintainer which I'd
> really like to see here, because the bindings look suspicious to me.
> They look like they mostly export register settings which is usually
> questionable since we might want to abstract bindings so they can be
> useful for a number of drivers.
> 
> Arnd, since you committed the patches, can you please comment? I'd
> prefer to drop this DT conversion for now, otherwise we might have to
> support this possibly rushed bindings forever? LinusW, what do you
> think?

I've dropped the ux500/dt branch for now. and will wait for a new one
to get submitted as a replacement. There were other things wrong with
the submission that Lee already knows about, so I think it's better
to do this the proper way now.

	Arnd
