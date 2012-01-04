From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with Linus' tree
Date: Wed, 4 Jan 2012 15:08:56 -0800
Message-ID: <20120104230856.GI24583@kroah.com>
References: <20111228162859.50b53b23e90ccf0145f2945a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5.smtp.messagingengine.com ([66.111.4.29]:35127 "EHLO
	out5.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757290Ab2ADXJ3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jan 2012 18:09:29 -0500
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 0ED7C20686
	for <linux-next@vger.kernel.org>; Wed,  4 Jan 2012 18:09:28 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20111228162859.50b53b23e90ccf0145f2945a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Wed, Dec 28, 2011 at 04:28:59PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> arch/arm/mach-s3c64xx/s3c6400.c between commit 71b33a4f7c86 ("ARM:
> S3C64XX: Staticise s3c6400_sysclass") from Linus' tree and commit
> 4a858cfc9af8 ("arm: convert sysdev_class to a regular subsystem") from
> the driver-core tree.
> 
> The latter subsumed the change in the former, so I used that.

That sounds correct, thanks.

greg k-h
