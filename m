From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PTCH -next] i2o: fix kernel-doc warnings
Date: Mon, 27 Oct 2008 13:14:01 -0700
Message-ID: <20081027131401.f2f9e535.akpm@linux-foundation.org>
References: <48FFB97E.3020909@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:39780 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751865AbYJ0UOb (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Oct 2008 16:14:31 -0400
In-Reply-To: <48FFB97E.3020909@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-next@vger.kernel.org, viro@zeniv.linux.org.uk

On Wed, 22 Oct 2008 16:38:38 -0700
Randy Dunlap <rdunlap@xenotime.net> wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fixup i2o kernel-doc warnings:
> 
> Warning(linux-next-20081022//drivers/message/i2o/i2o_block.c:579): No description found for parameter 'bdev'
> Warning(linux-next-20081022//drivers/message/i2o/i2o_block.c:579): No description found for parameter 'mode'
> Warning(linux-next-20081022//drivers/message/i2o/i2o_block.c:608): No description found for parameter 'disk'
> Warning(linux-next-20081022//drivers/message/i2o/i2o_block.c:608): No description found for parameter 'mode'
> Warning(linux-next-20081022//drivers/message/i2o/i2o_block.c:657): No description found for parameter 'bdev'
> Warning(linux-next-20081022//drivers/message/i2o/i2o_block.c:657): No description found for parameter 'mode'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> cc: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  drivers/message/i2o/i2o_block.c |   12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> --- linux-next-20081022.orig/drivers/message/i2o/i2o_block.c
> +++ linux-next-20081022/drivers/message/i2o/i2o_block.c
> @@ -567,8 +567,8 @@ static void i2o_block_biosparam(unsigned
>  
>  /**
>   *	i2o_block_open - Open the block device
> - *	@inode: inode for block device being opened
> - *	@file: file to open
> + *	@bdev: block device being opened
> + *	@mode: file open mode
>   *
>   *	Power up the device, mount and lock the media. This function is called,
>   *	if the block device is opened for access.
> @@ -596,8 +596,8 @@ static int i2o_block_open(struct block_d
>  
>  /**
>   *	i2o_block_release - Release the I2O block device
> - *	@inode: inode for block device being released
> - *	@file: file to close
> + *	@disk: gendisk device being released
> + *	@mode: file open mode
>   *
>   *	Unlock and unmount the media, and power down the device. Gets called if
>   *	the block device is closed.
> @@ -643,8 +643,8 @@ static int i2o_block_getgeo(struct block
>  
>  /**
>   *	i2o_block_ioctl - Issue device specific ioctl calls.
> - *	@inode: inode for block device ioctl
> - *	@file: file for ioctl
> + *	@bdev: block device being opened
> + *	@mode: file open mode
>   *	@cmd: ioctl command
>   *	@arg: arg

>From my reading this is needed in current mainline?
