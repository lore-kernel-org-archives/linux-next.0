From: Greg KH <greg@kroah.com>
Subject: Re: linux-next:  driver-core tree build failure
Date: Fri, 15 Aug 2008 22:31:40 -0700
Message-ID: <20080816053140.GB20161@kroah.com>
References: <20080815182536.133fcad6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:40577 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750707AbYHPFgr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 16 Aug 2008 01:36:47 -0400
Content-Disposition: inline
In-Reply-To: <20080815182536.133fcad6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Fri, Aug 15, 2008 at 06:25:36PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (powerpc allyesconfig) failed like this:
> 
> drivers/usb/gadget/f_ecm.c:737: error: __ksymtab_ecm_bind causes a section type conflict
> 
> You really shouldn't EXPORT static functions.  I applied the patch below.

Ick, sorry about that.  I'm still working with David Brownell how to
handle this kind of change, he has a different proposal now.

thanks,

greg k-h
