From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH 2/2] drivers: usb: gadget: add multiple definition guards
Date: Tue, 12 Jun 2012 09:17:25 -0700
Message-ID: <4FD76B95.60708@xenotime.net>
References: <Pine.LNX.4.44L0.1206071646360.1185-100000@iolanthe.rowland.org>
 <1339405995-6298-1-git-send-email-andrzej.p@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devel-bounces@linuxdriverproject.org>
In-Reply-To: <1339405995-6298-1-git-send-email-andrzej.p@samsung.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/devel>
List-Post: <mailto:devel@linuxdriverproject.org>
List-Help: <mailto:devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/devel>,
 <mailto:devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: devel-bounces@linuxdriverproject.org
Sender: devel-bounces@linuxdriverproject.org
To: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: devel@driverdev.osuosl.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Nazarewicz <mnazarewicz@gmail.com>, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-next@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, Benoit Goby <benoit@android.com>, Mike Lockwood <lockwood@android.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-next.vger.kernel.org

On 06/11/2012 02:13 AM, Andrzej Pietrasiewicz wrote:

> If f_fs.c and u_serial.c are combined together using #include, which has
> been a common practice so far, the pr_vdebug macro is defined multiple
> times. Define it only once.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>


Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Thanks.

> ---
>  drivers/usb/gadget/f_fs.c     |    4 ++++
>  drivers/usb/gadget/u_serial.c |    4 ++++
>  2 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/usb/gadget/f_fs.c b/drivers/usb/gadget/f_fs.c
> index dcd1c7f..27c841d 100644
> --- a/drivers/usb/gadget/f_fs.c
> +++ b/drivers/usb/gadget/f_fs.c
> @@ -33,11 +33,15 @@
>  /* Debugging ****************************************************************/
>  
>  #ifdef VERBOSE_DEBUG
> +#ifndef pr_vdebug
>  #  define pr_vdebug pr_debug
> +#endif /* pr_vdebug */
>  #  define ffs_dump_mem(prefix, ptr, len) \
>  	print_hex_dump_bytes(pr_fmt(prefix ": "), DUMP_PREFIX_NONE, ptr, len)
>  #else
> +#ifndef pr_vdebug
>  #  define pr_vdebug(...)                 do { } while (0)
> +#endif /* pr_vdebug */
>  #  define ffs_dump_mem(prefix, ptr, len) do { } while (0)
>  #endif /* VERBOSE_DEBUG */
>  
> diff --git a/drivers/usb/gadget/u_serial.c b/drivers/usb/gadget/u_serial.c
> index 5b3f5ff..da6d479 100644
> --- a/drivers/usb/gadget/u_serial.c
> +++ b/drivers/usb/gadget/u_serial.c
> @@ -132,11 +132,15 @@ static unsigned	n_ports;
>  
>  
>  #ifdef VERBOSE_DEBUG
> +#ifndef pr_vdebug
>  #define pr_vdebug(fmt, arg...) \
>  	pr_debug(fmt, ##arg)
> +#endif /* pr_vdebug */
>  #else
> +#ifndef pr_vdebig
>  #define pr_vdebug(fmt, arg...) \
>  	({ if (0) pr_debug(fmt, ##arg); })
> +#endif /* pr_vdebug */
>  #endif
>  
>  /*-------------------------------------------------------------------------*/



-- 
~Randy
