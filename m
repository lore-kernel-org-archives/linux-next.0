From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH 13/17] hid: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 00:34:15 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1003300033370.24576@pobox.suse.cz>
References: <1269885165-18617-1-git-send-email-tj@kernel.org> <1269885165-18617-14-git-send-email-tj@kernel.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1269885165-18617-14-git-send-email-tj@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, 30 Mar 2010, Tejun Heo wrote:

> Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
> gfp.h or slab.h is included as necessary.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Jiri Kosina <jkosina@suse.cz>
> ---
>  drivers/hid/hid-roccat-kone.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
> index 2b1412e..7b11784 100644
> --- a/drivers/hid/hid-roccat-kone.c
> +++ b/drivers/hid/hid-roccat-kone.c
> @@ -35,6 +35,7 @@
>  #include <linux/hid.h>
>  #include <linux/usb.h>
>  #include <linux/module.h>
> +#include <linux/slab.h>
>  #include "hid-ids.h"
>  #include "hid-roccat-kone.h"

I have applied this to the branch of my tree in which development of 
roccat-kone driver for 2.6.35 is happening.

Thanks,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
