From: Marek Vasut <marex@denx.de>
Subject: Re: linux-next: manual merge of the spi-mb tree with the mmc tree
Date: Wed, 5 Sep 2012 05:56:34 +0200
Message-ID: <201209050556.34563.marex@denx.de>
References: <20120905131539.95d7a613d49f741ab6f123a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120905131539.95d7a613d49f741ab6f123a6@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lauri Hintsala <lauri.hintsala@bluegiga.com>, Chris Ball <cjb@laptop.org>
List-Id: linux-next.vger.kernel.org

Dear Stephen Rothwell,

> Hi Mark,
> 
> Today's linux-next merge of the spi-mb tree got a conflict in
> drivers/mmc/host/mxs-mmc.c between commit fc108d24d3a6 ("mmc: mxs-mmc:
> fix deadlock caused by recursion loop") from the mmc tree and commit
> 829c1bf40b92 ("mmc: spi: Pull out parts shared between MMC and SPI") from
> the spi-mb tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

On a quick glance, it seems correct. Thank you!

Best regards,
Marek Vasut
