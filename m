From: Greg KH <gregkh@suse.de>
Subject: Re: [PATCH -next] staging/sep: fix build error & warning & kconfig
Date: Mon, 17 Aug 2009 13:42:09 -0700
Message-ID: <20090817204209.GA9274@suse.de>
References: <4A89BF12.6020908@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757390AbZHQUnh@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4A89BF12.6020908@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>, Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Mon, Aug 17, 2009 at 01:35:30PM -0700, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix sep_driver build when CONFIG_PCI=n:
> 
> drivers/staging/sep/sep_driver.c:2548: error: implicit declaration of function 'pci_dev_get'

I just merged a patch to fix this a few minutes ago.

> and printk format warning:
> 
> drivers/staging/sep/sep_driver.c:290:
> warning: format '%d' expects type 'int', but argument 2 has type 'long unsigned
>  int'

I think Alan is taking care of this stuff already.

> Also, the default kconfig value should not be 'y'.
> 
> And something should be done about this warning (but I didn't fix it):
> drivers/staging/sep/sep_driver.c:1780: warning: 'error' may be used uninitialized in this function

Alan has already resolved this one.

thanks,

greg k-h
