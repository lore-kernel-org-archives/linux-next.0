From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for October 30
Date: Thu, 30 Oct 2008 23:25:57 -0700
Message-ID: <20081031062557.GB22015@kroah.com>
References: <20081030173030.d8847df6.sfr@canb.auug.org.au> <20081030165532.802375f8.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:49784 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750810AbYJaGaR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 31 Oct 2008 02:30:17 -0400
Content-Disposition: inline
In-Reply-To: <20081030165532.802375f8.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Oct 30, 2008 at 04:55:32PM -0700, Randy Dunlap wrote:
> On Thu, 30 Oct 2008 17:30:30 +1100 Stephen Rothwell wrote:
> 
> 
> Greg told me that he would fix these, but they are still around:
> 
> drivers/staging/poch/poch.c:388: warning: format '%x' expects type 'unsigned int', but argument 4 has type 'dma_addr_t'
> 
> drivers/usb/misc/vstusb.c:623: warning: format '%d' expects type 'int', but argument 5 has type 'size_t'

Hm, sorry about that, I thought I did :(

I'll work on it in the morning.

thanks,

greg k-h
