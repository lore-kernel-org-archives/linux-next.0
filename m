From: Jonathan Cameron <jic23@cam.ac.uk>
Subject: Re: linux-next: build failure after merge of the moduleh tree
Date: Tue, 04 Oct 2011 16:24:40 +0100
Message-ID: <4E8B2538.10607@cam.ac.uk>
References: <20111004182111.d180e11f61c23740e6d6988f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ppsw-51.csi.cam.ac.uk ([131.111.8.151]:46980 "EHLO
	ppsw-51.csi.cam.ac.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932520Ab1JDPQQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Oct 2011 11:16:16 -0400
In-Reply-To: <20111004182111.d180e11f61c23740e6d6988f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Hennerich <michael.hennerich@analog.com>, Greg KH <greg@kroah.com>

On 10/04/11 08:21, Stephen Rothwell wrote:
> Hi Paul,
> 
> After merging the moduleh tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/staging/iio/adc/ad7746.c:345:8: error: 'S_IWUSR' undeclared here (not in a function)
> drivers/staging/iio/adc/ad7746.c:436:8: error: 'S_IRUGO' undeclared here (not in a function)
> drivers/staging/iio/adc/ad7746.c:681:19: error: 'THIS_MODULE' undeclared here (not in a function)
> drivers/staging/iio/adc/ad7746.c:778:1: warning: data definition has no type or storage class [enabled by default]
> drivers/staging/iio/adc/ad7746.c:778:1: warning: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE' [-Wimplicit-int]
> drivers/staging/iio/adc/ad7746.c:778:1: warning: parameter names (without types) in function declaration [enabled by default]
> drivers/staging/iio/adc/ad7746.c:799:15: error: expected declaration specifiers or '...' before string constant
> drivers/staging/iio/adc/ad7746.c:800:20: error: expected declaration specifiers or '...' before string constant
> drivers/staging/iio/adc/ad7746.c:801:16: error: expected declaration specifiers or '...' before string constant
> 
> Caused by commit 83e416f458d5 ("staging: iio: adc: Replace, rewrite
> ad7745 from scratch") from the staging tree interacting with the module.h
> split.
> 
> I added the following patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 4 Oct 2011 18:18:28 +1100
> Subject: [PATCH] staging: iio: adc: add includes of module.h and stat.h
> 
> fixes these build problems:
> 
> drivers/staging/iio/adc/ad7746.c:345:8: error: 'S_IWUSR' undeclared here (not in a function)
> drivers/staging/iio/adc/ad7746.c:436:8: error: 'S_IRUGO' undeclared here (not in a function)
> drivers/staging/iio/adc/ad7746.c:681:19: error: 'THIS_MODULE' undeclared here (not in a function)
> drivers/staging/iio/adc/ad7746.c:778:1: warning: data definition has no type or storage class [enabled by default]
> drivers/staging/iio/adc/ad7746.c:778:1: warning: type defaults to 'int' in declaration of 'MODULE_DEVICE_TABLE' [-Wimplicit-int]
> drivers/staging/iio/adc/ad7746.c:778:1: warning: parameter names (without types) in function declaration [enabled by default]
> drivers/staging/iio/adc/ad7746.c:799:15: error: expected declaration specifiers or '...' before string constant
> drivers/staging/iio/adc/ad7746.c:800:20: error: expected declaration specifiers or '...' before string constant
> drivers/staging/iio/adc/ad7746.c:801:16: error: expected declaration specifiers or '...' before string constant
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Acked-by: Jonathan Cameron <jic23@cam.ac.uk>

> ---
>  drivers/staging/iio/adc/ad7746.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/staging/iio/adc/ad7746.c b/drivers/staging/iio/adc/ad7746.c
> index 0b251ad..3fe0c17 100644
> --- a/drivers/staging/iio/adc/ad7746.c
> +++ b/drivers/staging/iio/adc/ad7746.c
> @@ -13,6 +13,8 @@
>  #include <linux/sysfs.h>
>  #include <linux/i2c.h>
>  #include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/stat.h>
>  
>  #include "../iio.h"
>  #include "../sysfs.h"
