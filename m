From: "Gregory Haskins" <ghaskins@novell.com>
Subject: Re: [PATCH 06/17] vbus: update gfp/slab.h includes
Date: Wed, 31 Mar 2010 05:51:28 -0600
Message-ID: <4BB2FF000200005A0006349E@soto.provo.novell.com>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
 <1269885165-18617-7-git-send-email-tj@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1269885165-18617-7-git-send-email-tj@kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

>>> On 3/29/2010 at 01:52 PM, in message
<1269885165-18617-7-git-send-email-tj@kernel.org>, Tejun Heo <tj@kernel.org>
wrote: 
> Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
> gfp.h or slab.h is included as necessary.
> 
> Signed-off-by: Tejun Heo <tj@kernel.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Gregory Haskins <ghaskins@novell.com>

Thanks Tejun,

Acked-by: Gregory Haskins <ghaskins@novell.com>

(will add to my tree)

> ---
>  drivers/vbus/pci-bridge.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/vbus/pci-bridge.c b/drivers/vbus/pci-bridge.c
> index 0d51324..36de7c4 100644
> --- a/drivers/vbus/pci-bridge.c
> +++ b/drivers/vbus/pci-bridge.c
> @@ -22,6 +22,7 @@
>  #include <linux/pci.h>
>  #include <linux/mm.h>
>  #include <linux/workqueue.h>
> +#include <linux/slab.h>
>  #include <linux/debugfs.h>
>  #include <linux/seq_file.h>
>  #include <linux/ioq.h
