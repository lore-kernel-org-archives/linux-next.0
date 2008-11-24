From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Sun, 23 Nov 2008 21:23:39 -0800 (PST)
Message-ID: <20081123.212339.131214270.davem@davemloft.net>
References: <20081124154938.bac22cd5.sfr@canb.auug.org.au>
	<20081123.210452.160784844.davem@davemloft.net>
	<20081124162044.f3333fcf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:51058
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750701AbYKXFXj (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 00:23:39 -0500
In-Reply-To: <20081124162044.f3333fcf.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, shemminger@vyatta.com, sam@ravnborg.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 24 Nov 2008 16:20:44 +1100

> Yeah, and including it does turn CONFIG_PCMCIA on. But I am genuinely
> curious as there is a CONFIG_PCMCIA entry (with a really ancient comment)
> in arch/sparc64/Kconfig, so why is that not sufficient to get
> CONFIG_PCMCIA turned on?  There is clearly something lacking in my
> understanding ...

Probably it didn't build for some obscure reason a long time
ago.  I'll try to get it turned back on, but better is to
bring it in via drivers/Kconfig don't you think? :-)
