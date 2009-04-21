From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: [PATCH 1/2] fs/compat_ioctl: fix build when !BLOCK
Date: Tue, 21 Apr 2009 09:32:34 +0200
Message-ID: <20090421073234.GB4593@kernel.dk>
References: <1240215264-8096-1-git-send-email-a.beregalov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754394AbZDUHdH@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1240215264-8096-1-git-send-email-a.beregalov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk, alexb <alexb@localhost>
List-Id: linux-next.vger.kernel.org

On Mon, Apr 20 2009, Alexander Beregalov wrote:
> From: alexb <alexb@localhost.(none)>
> 
> In file included from fs/compat_ioctl.c:61:
> include/linux/loop.h:59: error: field 'lo_bio_list' has incomplete type
> 
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

Thanks, applied.

> ---
>  fs/compat_ioctl.c |    7 +++----
>  1 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
> index 3e87ce4..b83f6bc 100644
> --- a/fs/compat_ioctl.c
> +++ b/fs/compat_ioctl.c
> @@ -58,7 +58,6 @@
>  #include <linux/i2c.h>
>  #include <linux/i2c-dev.h>
>  #include <linux/atalk.h>
> -#include <linux/loop.h>
>  
>  #include <net/bluetooth/bluetooth.h>
>  #include <net/bluetooth/hci.h>
> @@ -68,6 +67,7 @@
>  #include <linux/gigaset_dev.h>
>  
>  #ifdef CONFIG_BLOCK
> +#include <linux/loop.h>
>  #include <scsi/scsi.h>
>  #include <scsi/scsi_ioctl.h>
>  #include <scsi/sg.h>
> @@ -2660,6 +2660,8 @@ HANDLE_IOCTL(SONET_GETFRAMING, do_atm_ioctl)
>  HANDLE_IOCTL(SONET_GETFRSENSE, do_atm_ioctl)
>  /* block stuff */
>  #ifdef CONFIG_BLOCK
> +/* loop */
> +IGNORE_IOCTL(LOOP_CLR_FD)
>  /* Raw devices */
>  HANDLE_IOCTL(RAW_SETBIND, raw_ioctl)
>  HANDLE_IOCTL(RAW_GETBIND, raw_ioctl)
> @@ -2728,9 +2730,6 @@ HANDLE_IOCTL(LPSETTIMEOUT, lp_timeout_trans)
>  IGNORE_IOCTL(VFAT_IOCTL_READDIR_BOTH32)
>  IGNORE_IOCTL(VFAT_IOCTL_READDIR_SHORT32)
>  
> -/* loop */
> -IGNORE_IOCTL(LOOP_CLR_FD)
> -
>  #ifdef CONFIG_SPARC
>  /* Sparc framebuffers, handled in sbusfb_compat_ioctl() */
>  IGNORE_IOCTL(FBIOGTYPE)
> -- 
> 1.6.2.3
> 

-- 
Jens Axboe
