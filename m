From: Fam Zheng <famz@redhat.com>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Thu, 6 Apr 2017 16:18:54 +0800
Message-ID: <20170406073201.GA4618@lemon>
References: <20170406140455.0ee0058f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:38866 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751226AbdDFIS5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 6 Apr 2017 04:18:57 -0400
Content-Disposition: inline
In-Reply-To: <20170406140455.0ee0058f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, 04/06 14:04, Stephen Rothwell wrote:
> Hi James,
> 
> After merging the scsi tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> In file included from include/linux/list.h:8:0,
>                  from include/linux/module.h:9,
>                  from drivers/scsi/sd.c:35:
> drivers/scsi/sd.c: In function 'sd_revalidate_disk':
> include/linux/kernel.h:755:16: warning: comparison of distinct pointer types lacks a cast
>   (void) (&min1 == &min2);   \
>                 ^
> include/linux/kernel.h:758:2: note: in expansion of macro '__min'
>   __min(typeof(x), typeof(y),   \
>   ^
> include/linux/kernel.h:783:39: note: in expansion of macro 'min'
>   __x == 0 ? __y : ((__y == 0) ? __x : min(__x, __y)); })
>                                        ^
> drivers/scsi/sd.c:2959:12: note: in expansion of macro 'min_not_zero'
>    rw_max = min_not_zero(logical_to_sectors(sdp, dev_max),
>             ^
> 
> Introduced by commit
> 
>   c3e62673ee20 ("scsi: sd: Consider max_xfer_blocks if opt_xfer_blocks is unusable")
> 
> logical_to_sectors() is a sector_t and BLK_DEF_MAX_SECTORS is an "enum
> blk_default_limits" (i.e. int).

Hi Stephen, James,

I will send a patch to fix this warning.

Fam
