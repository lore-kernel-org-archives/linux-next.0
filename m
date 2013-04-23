From: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: linux-next: Tree for Apr 23 (usb storage)
Date: Tue, 23 Apr 2013 11:53:55 -0700
Message-ID: <5176D8C3.5020701@infradead.org>
References: <20130423180028.e08f92e6cc72105f67b77491@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130423180028.e08f92e6cc72105f67b77491-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, wei_wang-kXabqFNEczNtrwSWzY7KCg@public.gmane.org
List-Id: linux-next.vger.kernel.org

On 04/23/13 01:00, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20130422:
> 


on i386, when CONFIG_PM_RUNTIME is not enabled so REALTEK_AUTOPM is not
enabled:

drivers/usb/storage/realtek_cr.c: In function 'realtek_cr_destructor':
drivers/usb/storage/realtek_cr.c:942:11: error: 'struct rts51x_chip' has no member named 'us'


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
