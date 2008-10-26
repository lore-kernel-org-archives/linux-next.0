From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: Tree for October 24 (usbip)
Date: Sat, 25 Oct 2008 22:41:08 -0700
Message-ID: <20081026054108.GA1573@kroah.com>
References: <20081024171932.1e8131d0.sfr@canb.auug.org.au> <20081025171840.94b36cf8.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:43450 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752499AbYJZFnW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 26 Oct 2008 01:43:22 -0400
Content-Disposition: inline
In-Reply-To: <20081025171840.94b36cf8.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org

On Sat, Oct 25, 2008 at 05:18:40PM -0700, Randy Dunlap wrote:
> On Fri, 24 Oct 2008 17:19:32 +1100 Stephen Rothwell wrote:
> 
> 
> build-r5216.out:/local/linsrc/linux-next-20081024/drivers/usb/misc/vstusb.c:623:
>  warning: format '%d' expects type 'int', but argument 5 has type 'size_t'

Thanks, will fix on Monday.

> 
> build-r5216.out:ERROR: "kernel_sendmsg" [drivers/staging/usbip/vhci-hcd.ko] unde
> fined!
> build-r5216.out:ERROR: "sock_release" [drivers/staging/usbip/vhci-hcd.ko] undefi
> ned!

Hm, needs CONFIG_NET, I'll fix this too.

thanks,

greg k-h
