From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] i2c: fix xiic build error
Date: Tue, 16 Feb 2010 08:07:05 -0800
Message-ID: <4B7AC2A9.4070203@oracle.com>
References: <20100204185736.6628ab9a.sfr@canb.auug.org.au> <4B6B29DD.7060502@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4B6B29DD.7060502@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khali@linux-fr.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 02/04/10 12:11, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Add header file to fix build error:
> 
> drivers/i2c/busses/i2c-xiic.c:493: error: implicit declaration of
> function 'mdelay'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
>  drivers/i2c/busses/i2c-xiic.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-next-20100204.orig/drivers/i2c/busses/i2c-xiic.c
> +++ linux-next-20100204/drivers/i2c/busses/i2c-xiic.c
> @@ -31,6 +31,7 @@
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/errno.h>
> +#include <linux/delay.h>
>  #include <linux/platform_device.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
> 


This patch is still needed in linux-next-20100216.

-- 
~Randy
