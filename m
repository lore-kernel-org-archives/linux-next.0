From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the mvebu tree with the arm-soc tree
Date: Wed, 02 Dec 2015 16:09:22 +0100
Message-ID: <241533090.9LSHZ5gDBE@wuerfel>
References: <20151202111244.b7ee49ee06b4a95e407e740d@kernel.org> <2428665.BrOON4cELy@wuerfel> <87bna92c5b.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:59300 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753447AbbLBPKB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Dec 2015 10:10:01 -0500
In-Reply-To: <87bna92c5b.fsf@free-electrons.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mark Brown <broonie@kernel.org>, Jason Cooper <jason@lakedaemon.net>, andrew@lunn.ch, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 02 December 2015 14:49:52 Gregory CLEMENT wrote:
> 
> > least initially. The conflict will go away once it's tested sufficiently and
> > I'm pulling it back.
> 
> By the way, when you will pull our tree, we will still have it our own
> mvebu/for-next branch. Will git managed to automagically resolve the
> conflict by getting the resolution you will do in your branch?

Yes, that should be fine, unless you resolve the same conflict differently.

> A another solution could be to have a separate patch for the
> arch/arm/Kconfig file that you keep in arm-soc.

No, I don't think that will be necessary.

	Arnd 
