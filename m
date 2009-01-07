From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for January 6 (staging/android #2)
Date: Tue, 6 Jan 2009 16:53:24 -0800
Message-ID: <20090107005324.GA3606@kroah.com>
References: <20090106182311.525e4b14.sfr@canb.auug.org.au> <20090106163931.5c275833.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:47519 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1757137AbZAGAyZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 19:54:25 -0500
Content-Disposition: inline
In-Reply-To: <20090106163931.5c275833.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Jan 06, 2009 at 04:39:31PM -0800, Randy Dunlap wrote:
> On Tue, 6 Jan 2009 18:23:11 +1100 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > This tree will not build a powerpc ppc4xx_defconfig due to a kvm problem.
> > 
> > Changes since 20090105:
> > 
> > New tree:
> > 	squashfs
> > 
> > Undropped tree:
> > 	usb
> > 	staging
> 
> 
> drivers/staging/android/timed_gpio.c:21:27: error: asm/arch/gpio.h: No such file or directory

Crap, this is an ARM specific thing :(

I'll fix this up after dinner...

thanks,

greg k-h
