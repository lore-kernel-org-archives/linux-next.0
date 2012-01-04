From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the arm
 tree
Date: Wed, 4 Jan 2012 15:08:23 -0800
Message-ID: <20120104230823.GG24583@kroah.com>
References: <20111228164052.7357f637a6bece1ef8068da6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5.smtp.messagingengine.com ([66.111.4.29]:51595 "EHLO
	out5.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757314Ab2ADXJZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jan 2012 18:09:25 -0500
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 2770120E96
	for <linux-next@vger.kernel.org>; Wed,  4 Jan 2012 18:09:25 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20111228164052.7357f637a6bece1ef8068da6@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <rmk@arm.linux.org.uk>

On Wed, Dec 28, 2011 at 04:40:52PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> arch/arm/plat-samsung/include/plat/cpu.h between commit b024043b6d0d
> ("ARM: 7245/1: S3C64XX: introduce arch/arm/mach-s3c64xx/common.[ch]")
> from the arm tree and commit 4a858cfc9af8 ("arm: convert sysdev_class to
> a regular subsystem") from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Looks good, thanks.

greg k-h
