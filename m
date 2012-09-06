From: Lauri Hintsala <lauri.hintsala@bluegiga.com>
Subject: Re: linux-next: manual merge of the spi-mb tree with the mmc tree
Date: Thu, 06 Sep 2012 09:26:39 +0300
Message-ID: <5048421F.7080101@bluegiga.com>
References: <20120905131539.95d7a613d49f741ab6f123a6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bluegiga.fi ([194.100.31.45]:41772 "EHLO darkblue.bluegiga.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751388Ab2IFG0l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Sep 2012 02:26:41 -0400
In-Reply-To: <20120905131539.95d7a613d49f741ab6f123a6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Ball <cjb@laptop.org>, Marek Vasut <marex@denx.de>

On 09/05/2012 06:15 AM, Stephen Rothwell wrote:
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

Reviewed and tested. Looks good.

Lauri
