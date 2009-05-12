From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: [PATCH] viocd: needs to depend on BLOCK
Date: Tue, 12 May 2009 13:28:35 +0200
Message-ID: <20090512112834.GJ4140@kernel.dk>
References: <1242123655-4104-1-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:60404 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753738AbZELL2e (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 May 2009 07:28:34 -0400
Content-Disposition: inline
In-Reply-To: <1242123655-4104-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: benh@kernel.crashing.org, linux-next@vger.kernel.org

On Tue, May 12 2009, Alexander Beregalov wrote:
> Fix this build error when CONFIG_BLOCK is not set:
> drivers/cdrom/viocd.c: In function 'viocd_blk_open':
> drivers/cdrom/viocd.c:156: error: dereferencing pointer to incomplete type
> drivers/cdrom/viocd.c: In function 'viocd_blk_release':
> drivers/cdrom/viocd.c:162: error: dereferencing pointer to incomplete type
> drivers/cdrom/viocd.c: In function 'viocd_blk_ioctl':
> drivers/cdrom/viocd.c:170: error: dereferencing pointer to incomplete type
> drivers/cdrom/viocd.c: In function 'viocd_blk_media_changed':
> drivers/cdrom/viocd.c:176: error: dereferencing pointer to incomplete type
> ...

Added to 2.6.30 pending fixes.

> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> ---
>  arch/powerpc/platforms/iseries/Kconfig |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/iseries/Kconfig b/arch/powerpc/platforms/iseries/Kconfig
> index 647e877..47a20cf 100644
> --- a/arch/powerpc/platforms/iseries/Kconfig
> +++ b/arch/powerpc/platforms/iseries/Kconfig
> @@ -17,6 +17,7 @@ config VIODASD
>  
>  config VIOCD
>  	tristate "iSeries Virtual I/O CD support"
> +	depends on BLOCK
>  	select VIOPATH
>  	help
>  	  If you are running Linux on an IBM iSeries system and you want to
> -- 
> 1.6.3
> 

-- 
Jens Axboe
