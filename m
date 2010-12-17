From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the final tree (tty
 tree related)
Date: Thu, 16 Dec 2010 23:04:31 -0800
Message-ID: <20101217070431.GA25192@kroah.com>
References: <20101217171120.295b0c0c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:34069 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751156Ab0LQHDo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Dec 2010 02:03:44 -0500
Content-Disposition: inline
In-Reply-To: <20101217171120.295b0c0c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>

On Fri, Dec 17, 2010 at 05:11:20PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/serial/apbuart.c:596: error: conflicting types for 'grlib_apbuart_configure'
> drivers/serial/apbuart.c:523: note: previous declaration of 'grlib_apbuart_configure' was here
> 
> Caused by commit 35c64e5d13c3d7d8c4ad061ad5e20498b9160c24 ("drivers:
> serial: apbuart: Handle OF failures gracefully").  This build has
> CONFIG_SERIAL_GRLIB_GAISLER_APBUART_CONSOLE set ...
> 
> I have reverted this commit for today.

Ugh.  Thomas, care to send me a patch?

thanks,

greg k-h
