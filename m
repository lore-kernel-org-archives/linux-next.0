From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: linux-next: manual merge of the mmc tree with Linus' tree
Date: Wed, 1 Jun 2011 11:35:54 +0800
Message-ID: <20110601033552.GA1902@S2100-06.ap.freescale.net>
References: <20110601111320.07b07b7f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]:50810
	"EHLO VA3EHSOBE002.bigfish.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933173Ab1FADbD (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Tue, 31 May 2011 23:31:03 -0400
Content-Disposition: inline
In-Reply-To: <20110601111320.07b07b7f.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Chris Ball <cjb@laptop.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, Anton Vorontsov <cbouatmailru@gmail.com>, Grant Likely <grant.likely@secretlab.ca>

Hi Stephen,

On Wed, Jun 01, 2011 at 11:13:20AM +1000, Stephen Rothwell wrote:
> Hi Chris,
> 
> Today's linux-next merge of the mmc tree got a conflict in
> drivers/mmc/host/sdhci-of-core.c between commit b1608d69cb80
> ("drivercore: revert addition of of_match to struct device") from Linus'
> tree and commit e2d0d7dc5542 ("mmc: sdhci: make sdhci-of device drivers
> self registered") from the mmc tree.
> 
> The latter removes the file, so I did that (I *think* that the change
> from the former is no longer needed, but someone should check).

Yes, the change of b1608d69cb80 ("drivercore: revert addition of
of_match to struct device") is no longer needed.

-- 
Regards,
Shawn
