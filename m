From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the s5p
 tree
Date: Wed, 4 Jan 2012 14:52:31 -0800
Message-ID: <20120104225231.GB24583@kroah.com>
References: <20111228160045.21ef706d279fef338ac5d7e0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out5.smtp.messagingengine.com ([66.111.4.29]:60102 "EHLO
	out5.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757243Ab2ADXFE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Jan 2012 18:05:04 -0500
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 1272B20A59
	for <linux-next@vger.kernel.org>; Wed,  4 Jan 2012 18:05:04 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20111228160045.21ef706d279fef338ac5d7e0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>

On Wed, Dec 28, 2011 at 04:00:45PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in
> arch/arm/mach-exynos/cpu.c between commit f983575aa90c ("ARM: EXYNOS:
> Enable conversion of GIC dt irq specifier to linux virq") from the s5p
> tree and commit 4a858cfc9af8 ("arm: convert sysdev_class to a regular
> subsystem") from the driver-core tree.
> 
> Just context changes.  I fixed it up (see below) and can carry the fix as
> necessary.

Looks fine, thanks.

greg k-h
