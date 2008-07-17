From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core build failure
Date: Thu, 17 Jul 2008 00:04:01 -0700
Message-ID: <20080717070401.GA22090@kroah.com>
References: <20080717103611.79b1cecd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:49283 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751967AbYGQHSr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 03:18:47 -0400
Content-Disposition: inline
In-Reply-To: <20080717103611.79b1cecd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>

On Thu, Jul 17, 2008 at 10:36:11AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> I have been carrying the patch below and applying it after the scsi tree
> merge for some time now.  Now that the scsi tree has been merged into
> Linus' tree, can you add this to the driver-core tree, please?
> Preferably merged with the patch that removes KOBJ_NAME_LEN.

Thanks, I will queue this up.

greg k-h
