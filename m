From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: Re: linux-next: Tree for September 9 (usb/otg/langwell)
Date: Thu, 9 Sep 2010 09:26:45 -0700
Message-ID: <20100909092645.11fc3bf0.randy.dunlap@oracle.com>
References: <20100909211249.2c70ac41.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100909211249.2c70ac41.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, lud <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, gregkh-l3A5Bk7waGM@public.gmane.org, Alan Cox <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Alek Du <alek.du-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Thu, 9 Sep 2010 21:12:49 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100908:

on i386 (X86_32), drivers/usb/otg/langwell_otg.c has 429 errors and 2 warnings.

Examples:

include/linux/usb/langwell_otg.h:23:37: error: linux/usb/intel_mid_otg.h: No such file or directory
include/linux/usb/langwell_otg.h:115: error: field 'iotg' has incomplete type
include/linux/usb/langwell_otg.h:136: warning: type defaults to 'int' in declaration of '__mptr'
include/linux/usb/langwell_otg.h:136: warning: initialization from incompatible pointer type
drivers/usb/otg/langwell_otg.c:251: error: dereferencing pointer to incomplete type
drivers/usb/otg/langwell_otg.c:520: warning: its scope is only this definition or declaration, which is probably not what you want
drivers/usb/otg/langwell_otg.c:904: error: 'MID_OTG_NOTIFY_CONNECT' undeclared (first use in this function)
drivers/usb/otg/langwell_otg.c:2132 : error: implicit declaration of function 'intel_mid_otg_register_notifier'
drivers/usb/otg/langwell_otg.c:2191 : error: implicit declaration of function 'intel_mid_otg_unregister_notifier'


Note the missing header file.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
