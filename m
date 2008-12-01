From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of the net tree
Date: Sun, 30 Nov 2008 23:20:55 -0800 (PST)
Message-ID: <20081130.232055.169993731.davem@davemloft.net>
References: <20081201142623.5c38680b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:40431
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750709AbYLAHUz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 1 Dec 2008 02:20:55 -0500
In-Reply-To: <20081201142623.5c38680b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, viro@ftp.linux.org.uk, vapier@gentoo.org, jgarzik@redhat.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 1 Dec 2008 14:26:23 +1100

> Hi Dave,
> 
> Today's linux-next merge of the net tree got a conflict in
> drivers/net/smc91x.c between commit
> f57628d76bd201a444ca822f3622522a44acbf60 ("section errors in
> smc911x/smc91x") from Linus' tree and commit smc_drv_probe ("smc91x: add
> __init markings to smc_drv_probe()") from the net tree.
> 
> The former changed smc_drv_probe() to __devinit while the latter to
> __init.  I used the latter and it can be fixed up in your tree.
> 
> I do wonder why the former change didn't go through Jeff's tree ...

Linus applied a lot of things from Al today he shouldn't have.
