From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Sun, 23 Nov 2008 21:04:52 -0800 (PST)
Message-ID: <20081123.210452.160784844.davem@davemloft.net>
References: <20081124152550.6a06efa4.sfr@canb.auug.org.au>
	<20081123.202847.85900696.davem@davemloft.net>
	<20081124154938.bac22cd5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:59080
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750701AbYKXFEx (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 00:04:53 -0500
In-Reply-To: <20081124154938.bac22cd5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, shemminger@vyatta.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 24 Nov 2008 15:49:38 +1100

> So I wonder what prevents CONFIG_PCMCIA being set on a sparc64
> allmodconfig?  Just looking at the Kconfig files, I thought it
> would, but obviously not.

drivers/Kconfig doesn't include drivers/pcmcia/Kconfig,
each arch Kconfig has to do it explicitly
