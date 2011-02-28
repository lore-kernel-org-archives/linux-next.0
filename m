From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: [PATCH] rtlwifi: usb parts should depend on CONFIG_USB
Date: Mon, 28 Feb 2011 21:08:51 +0100
Message-ID: <1298923731.10109.0.camel@jlt3.sipsolutions.net>
References: <alpine.DEB.2.00.1102171354200.16788@ayla.of.borg>
	 <1298922500-21632-1-git-send-email-linville@tuxdriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298922500-21632-1-git-send-email-linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Larry Finger <Larry.Finger-tQ5ms3gMjBLk1uMJSBkQmQ@public.gmane.org>, George <george0505-Rasf1IRRPZFBDgjK7y7TUQ@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Mon, 2011-02-28 at 14:48 -0500, John W. Linville wrote:
>  
> +ifeq ($(CONFIG_USB),y)
> +rtlwifi-objs	+= usb.o
> +endif

That reads weird, shouldn't

rtlwifi-$(CONFIG_USB) += usb.o

do? Or more likely actually use CONFIG_RTL8192CU?

johannes

--
To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
