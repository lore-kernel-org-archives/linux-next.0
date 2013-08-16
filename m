From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH] usb: phy: am335x-control: make it compile with
Date: Fri, 16 Aug 2013 11:00:09 -0700
Message-ID: <520E68A9.1020406@infradead.org>
References: <20130815165829.6a401f104ee2a98dd48bcb58@canb.auug.org.au> <520D0AD7.6050002@infradead.org> <520E0304.5050906@ti.com> <20130816153249.GA3570@breakpoint.cc>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130816153249.GA3570-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Andrzej Siewior <sebastian-E0PNVn5OA6ohrxcnuTQ+TQ@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On 08/16/13 08:32, Sebastian Andrzej Siewior wrote:
> From: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> 
> Randy reported this
> |drivers/usb/phy/phy-am335x-control.c:45:3: error: implicit declaration
> |of function '__WARN' [-Werror=implicit-function-declaration]
> 
> and left it as an excercice to figure out that this happens only with
> CONFIG_BUG=n. As a fix I replace it with WARN_ON(). And there is a space
> before return so fix this, too.
> 
> Reported-by: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>

Acked-by: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>

Thanks.

> ---
>  drivers/usb/phy/phy-am335x-control.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/phy/phy-am335x-control.c b/drivers/usb/phy/phy-am335x-control.c
> index 7597545..22cf07d 100644
> --- a/drivers/usb/phy/phy-am335x-control.c
> +++ b/drivers/usb/phy/phy-am335x-control.c
> @@ -42,8 +42,8 @@ static void am335x_phy_power(struct phy_control *phy_ctrl, u32 id, bool on)
>  		reg = AM335X_USB1_CTRL;
>  		break;
>  	default:
> -		__WARN();
> -		 return;
> +		WARN_ON(1);
> +		return;
>  	}
>  
>  	val = readl(usb_ctrl->phy_reg + reg);
> 


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
