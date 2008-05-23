From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: i2c build failure
Date: Thu, 22 May 2008 18:58:09 -0700
Message-ID: <20080523015809.GA16743@kroah.com>
References: <20080523113255.258e38bd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pentafluge.infradead.org ([213.146.154.40]:56959 "EHLO
	pentafluge.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758109AbYEWB7S (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 22 May 2008 21:59:18 -0400
Content-Disposition: inline
In-Reply-To: <20080523113255.258e38bd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jean Delvare <khali@linux-fr.org>, linux-next@vger.kernel.org, Dave Young <hidave.darkstar@gmail.com>, Kay Sievers <kay.sievers@vrfy.org>

On Fri, May 23, 2008 at 11:32:55AM +1000, Stephen Rothwell wrote:
> Hi Jean,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> drivers/i2c/i2c-core.c: In function 'i2c_register_driver':
> drivers/i2c/i2c-core.c:697: warning: passing argument 2 of 'class_for_each_device' from incompatible pointer type
> drivers/i2c/i2c-core.c:697: error: too few arguments to function 'class_for_each_device'
> drivers/i2c/i2c-core.c: In function 'i2c_del_driver':
> drivers/i2c/i2c-core.c:749: warning: passing argument 2 of 'class_for_each_device' from incompatible pointer type
> drivers/i2c/i2c-core.c:749: error: too few arguments to function 'class_for_each_device'
> 
> This is caused by commit f79228aaa062668bcbabf9762e819a1d7ee7c5c4 ("i2c:
> Use class_for_each_device") from the i2c tree interacting with commit
> a3ec024649e0095368d38a2e434ad092b79aa7af ("Driver Core: add ability for
> class_for_each_device to start in middle of list") from the driver-core
> tree.  The latter added a parameter to class_for_each_device while the
> former added a new usage.
> 
> I applied the patch below.

The patch looks correct, thanks.

> Greg, is there some better way to handle this interface change?  (e.g. new
> function name?)

There's only what, 5 users in the kernel for it today in 3 different
files?  I'd rather not go through that kind of sequence, can you just
keep this patch and we'll handle it when we merge together once .27
opens.  Sound reasonable?

thanks,

greg k-h
