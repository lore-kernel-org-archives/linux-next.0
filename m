From: Greg KH <greg@kroah.com>
Subject: Re: tm6000 compilation breakage on linux-next
Date: Mon, 3 May 2010 09:48:57 -0700
Message-ID: <20100503164857.GA5750@kroah.com>
References: <4BDEFAE4.1060700@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:41511 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933313Ab0ECQtJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 3 May 2010 12:49:09 -0400
Content-Disposition: inline
In-Reply-To: <4BDEFAE4.1060700@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>

On Mon, May 03, 2010 at 01:33:40PM -0300, Mauro Carvalho Chehab wrote:
> Hi Stephen,
> 
> Randy reported a breakage while compiling drivers/staging/tm6000, due to
> this change:
>     commit 1c1b78bee1a94f98deeb9c24b21c4812e191646c
>     Author: Greg Kroah-Hartman <gregkh@suse.de>
>     Date:   Thu Apr 29 15:46:07 2010 -0700
> 
>     USB: remove unused usb_buffer_alloc and usb_buffer_free macros
>     
>     Now that all callers are converted over, remove the compatibility
>     functions and all is good.
>     
>     Cc: Daniel Mack <daniel@caiaq.de>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
> 
> A fix patch is as simple as:
> 	s/usb_buffer_alloc/usb_alloc_coherent/
> 	s/usb_buffer_free/usb_free_coherent/
> 
> The problem is that, if I apply such patch on my tree, it will break compilation
> with upstream.

Not anymore.  Those functions are now in Linus's tree, so you can safely
make the change in your tree now, and all is good :)

thanks,

greg k-h
