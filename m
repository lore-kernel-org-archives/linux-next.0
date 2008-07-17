From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core build failure
Date: Thu, 17 Jul 2008 00:04:13 -0700
Message-ID: <20080717070413.GB22090@kroah.com>
References: <20080717103207.ccced1ca.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:36330 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753160AbYGQHSt (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Jul 2008 03:18:49 -0400
Content-Disposition: inline
In-Reply-To: <20080717103207.ccced1ca.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>

On Thu, Jul 17, 2008 at 10:32:07AM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> I have been carrying the patch below and applying it after the scsi tree
> merge for some time now.  Now that the scsi tree has been merged into
> Linus' tree, can you add this to the driver-core tree, please?
> Preferably merged with the patch that changes the class_find_device API.

Thanks, I will do that.

greg k-h
