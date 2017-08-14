From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH-next] bus: fsl-mc: fix implicit irq include causing build
 fails
Date: Mon, 14 Aug 2017 15:18:44 -0700
Message-ID: <20170814221844.GA24807@kroah.com>
References: <20170723143652.16445-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:35112 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752275AbdHNWSo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Aug 2017 18:18:44 -0400
Content-Disposition: inline
In-Reply-To: <20170723143652.16445-1-paul.gortmaker@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stuart Yoder <stuyoder@gmail.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>

On Sun, Jul 23, 2017 at 10:36:52AM -0400, Paul Gortmaker wrote:
> To fix:
> 
> In file included from drivers/staging/fsl-dpaa2/ethernet/dpaa2-eth.h:39:0,
>                  from drivers/staging/fsl-dpaa2/ethernet/dpaa2-ethtool.c:34:
> drivers/staging/fsl-dpaa2/ethernet/../../fsl-mc/include/dpaa2-io.h:86:1: error: unknown type name ‘irqreturn_t’
>  irqreturn_t dpaa2_io_irq(struct dpaa2_io *obj);
>  ^
> 
> as seen on arm64 allmodconfig builds.
> 
> Cc: Stuart Yoder <stuyoder@gmail.com>
> Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
> 
> [Seen on current linux-next tree.]
> 
>  drivers/staging/fsl-mc/include/dpaa2-io.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/fsl-mc/include/dpaa2-io.h b/drivers/staging/fsl-mc/include/dpaa2-io.h
> index 002829cecd75..afc5d5bb1698 100644
> --- a/drivers/staging/fsl-mc/include/dpaa2-io.h
> +++ b/drivers/staging/fsl-mc/include/dpaa2-io.h
> @@ -34,6 +34,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/cpumask.h>
> +#include <linux/interrupt.h>
>  
>  #include "dpaa2-fd.h"
>  #include "dpaa2-global.h"

This does not apply to my tree :(
