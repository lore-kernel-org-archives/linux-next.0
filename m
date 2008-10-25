From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: left over things in linux-next after 2.6.28-c1
Date: Sat, 25 Oct 2008 14:20:37 -0700
Message-ID: <20081025212037.GB32027@kroah.com>
References: <20081026005009.50dbbb33.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:52985 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751356AbYJYVWu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 25 Oct 2008 17:22:50 -0400
Content-Disposition: inline
In-Reply-To: <20081026005009.50dbbb33.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Sun, Oct 26, 2008 at 12:50:09AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following is an approximate list of commits left in linux-next
> relative to 2.6.28-rc1.  Some things here may have been included in
> Linus' tree in a slightly different form.  The kvm tree is excluded from
> this list because the bits of it submitted to Linus are often different
> to what is in linux-next (my scipt says that it has ~1400 outstanding
> commits).

Nice report, thanks for doing this.

> driver-core.current
> 
> 	Andi Kleen (1):
> 	      sysfs: Fix return values for sysdev_store_{ulong,int}
> 
> 	Greg Kroah-Hartman (1):
> 	      Document kernel taint flags properly
> 
> 	Qinghuang Feng (1):
> 	      driver core: drivers/base/sys.c: update comments

Yes, all of these will be sent to Linus soon.

> usb
> 
> 	Denis Joseph Barrow (2):
> 	      HSO: fix hso_serial_close refcounting
> 	      HSO: put linefeeds on printk's in hso.c

I'm holding on to these so they don't get lost, but Denis is reworking
them at the moment to make them fix the problems correctly.

> 	Greg Kroah-Hartman (2):
> 	      USB: remove warn() macro from usb.h
> 	      USB: remove info() macro from usb.h

I had hopes for these to be merged, but don't think they will be due to
some remaining usages in the media tree.  I'll wait until 2.6.29 to push
them in.

> xfs

<snip>

wow, did XFS ever merge with Linus?  That looks like a lot of
outstanding patches :(

thanks,

greg k-h
