From: Pierre Ossman <drzeus-list@drzeus.cx>
Subject: Re: linux-next: mmc/driver-core merge conflict
Date: Mon, 9 Jun 2008 09:14:52 +0200
Message-ID: <20080609091452.5240892b@mjolnir.drzeus.cx>
References: <20080606155655.b72cff0d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from server.drzeus.cx ([85.8.24.28]:33739 "EHLO smtp.drzeus.cx"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754860AbYFIHPT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Jun 2008 03:15:19 -0400
In-Reply-To: <20080606155655.b72cff0d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Anton Vorontsov <avorontsov@ru.mvista.com>

On Fri, 6 Jun 2008 15:56:55 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Pierre, Greg,
> 
> Today's linux-next merge of the mmc tree got a conflict in
> drivers/mmc/host/mmc_spi.c between commit
> b16fa5e051064488f241647a080271f1cd41d077 ("driver-core: prepare for
> removal of 20 char limit from struct device") from the driver-core tree
> and commit cd3c93fe826def37abc474e7a91bbf56444d7cd0 ("mmc_spi: add
> support for card-detection polling") from the mmc tree.
> 
> I fixed it up in the obvious manner.  Could be fixed by moving the
> drivers/mmc/host/mmc_spi.c part of the driver-core change to the mmc
> tree ...
> 

Sounds good to me. Greg, can you separate out that portion?

-- 
     -- Pierre Ossman

  Linux kernel, MMC maintainer        http://www.kernel.org
  rdesktop, core developer          http://www.rdesktop.org
