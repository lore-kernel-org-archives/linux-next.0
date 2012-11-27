From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH -next] staging/fwserial: Fix build breakage when !CONFIG_BUG
Date: Tue, 27 Nov 2012 10:42:13 -0800
Message-ID: <50B50985.1010700@infradead.org>
References: <20121127011738.9ecd7971a7ea2e3d09a9450d@canb.auug.org.au>	 <50B3D767.70604@infradead.org> <1354000267.3284.4.camel@thor>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:44874 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751769Ab2K0Sm1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Nov 2012 13:42:27 -0500
In-Reply-To: <1354000267.3284.4.camel@thor>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Hurley <peter@hurleysoftware.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Andrew Morton <akpm@linux-foundation.org>

On 11/26/2012 11:11 PM, Peter Hurley wrote:

> Use WARN() as intended.
> 
> Signed-off-by: Peter Hurley <peter@hurleysoftware.com>


Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/staging/fwserial/dma_fifo.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/fwserial/dma_fifo.c b/drivers/staging/fwserial/dma_fifo.c
> index 72aa053..5e84634 100644
> --- a/drivers/staging/fwserial/dma_fifo.c
> +++ b/drivers/staging/fwserial/dma_fifo.c
> @@ -33,10 +33,7 @@
>  
>  #define FAIL(fifo, condition, format...) ({				\
>  	fifo->corrupt = !!(condition);					\
> -	if (unlikely(fifo->corrupt)) {					\
> -		__WARN_printf(format);					\
> -	}								\
> -	unlikely(fifo->corrupt);					\
> +	WARN(fifo->corrupt, format);					\
>  })
>  
>  /*



-- 
~Randy
