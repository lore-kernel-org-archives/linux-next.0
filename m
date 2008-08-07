From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb.current tree build failure
Date: Wed, 6 Aug 2008 21:23:53 -0700
Message-ID: <20080807042353.GB25803@kroah.com>
References: <20080807105321.5aad96a4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:48038 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751995AbYHGEpX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Aug 2008 00:45:23 -0400
Content-Disposition: inline
In-Reply-To: <20080807105321.5aad96a4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kevin Lloyd <klloyd@sierrawireless.com>

On Thu, Aug 07, 2008 at 10:53:21AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> In file included from drivers/usb/storage/usb.c:177:
> drivers/usb/storage/unusual_devs.h:1577: error: 'sierra_ms_init' undeclared here (not in a function)
> 
> Caused by commit ff28a24426410aa193b47a5e9ec091d46eaa66d1 ("USB Storage
> Sierra: TRU-Install feature update").
> 
> I applied the following patch.

Thanks, now merged in.

greg k-h
