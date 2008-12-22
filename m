From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: usb tree build failure
Date: Sun, 21 Dec 2008 17:31:10 -0800
Message-ID: <20081222013110.GA28196@kroah.com>
References: <20081222113335.667c2d01.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:57466 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751462AbYLVBcV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Dec 2008 20:32:21 -0500
Content-Disposition: inline
In-Reply-To: <20081222113335.667c2d01.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Inaky Perez-Gonzalez <inaky@linux.intel.com>

On Mon, Dec 22, 2008 at 11:33:35AM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> x86_64-linux-ld: drivers/net/wimax/built-in.o: No such file: No such file or directory
> 
> I reverted commit 66aa675719ab82a03a66b75210fd40be6541f8fb ("wimax:
> Makefile, Kconfig and docbook linkage for the stack") just to make the
> build work.

Inaky, any ideas?  This really looks like a build system error that I
ran into with the staging tree in the past.  I had to add a "dummy" file
to the empty directory to get it to build properly.

I tried to duplicate the problem with a sample patch, but never could :(

thanks,

greg k-h
