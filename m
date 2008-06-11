From: Greg KH <greg@kroah.com>
Subject: Re: [ANNOUNCE] linux-staging tree created
Date: Wed, 11 Jun 2008 09:25:05 -0700
Message-ID: <20080611162505.GC22134@kroah.com>
References: <20080610190540.GA25066@kroah.com> <484F9A7B.4080004@panasas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:57465 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753232AbYFKQ1s (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Jun 2008 12:27:48 -0400
Content-Disposition: inline
In-Reply-To: <484F9A7B.4080004@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Benny Halevy <bhalevy@panasas.com>
Cc: linux-kernel@vger.kernel.org, devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Boaz Harrosh <bharrosh@panasas.com>

On Wed, Jun 11, 2008 at 12:27:23PM +0300, Benny Halevy wrote:
> Greg,
> 
> The OSD initiator (see
> http://git.open-osd.org/gitweb.cgi?p=open-osd.git;a=summary)
> looks in principle like a great fit for linux-staging.

Why isn't that just going directly into the linux-scsi tree when ready?

It doesn't look like it has coding style issues, does it?  What is
keeping it from being included today?

> What would be the mechanics of including it?

Just send me a patch :)

thanks,

greg k-h
