From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for January 2
Date: Fri, 2 Jan 2009 09:52:51 -0800
Message-ID: <20090102175251.GA6030@kroah.com>
References: <20090102203303.f314a99a.sfr@canb.auug.org.au> <200901021508.34847.rjw@sisk.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:33136 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757389AbZABRyJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 2 Jan 2009 12:54:09 -0500
Content-Disposition: inline
In-Reply-To: <200901021508.34847.rjw@sisk.pl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jan 02, 2009 at 03:08:34PM +0100, Rafael J. Wysocki wrote:
> On Friday 02 January 2009, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20081231:
> > 
> > Removed tree:
> > 	boot-params (became 2.6.30 material)
> > 
> > Dropped trees (temporarily):
> > 	driver-core (build problem)
> 
> Can you please tell me what exactly the build problem with the driver-core tree
> is?  Maybe I can fix it.

Sorry about that, I've now fixed it, and pushed it up to kernel.org.
But I think I missed the pull time for this release of linux-next.

thanks,

greg k-h
