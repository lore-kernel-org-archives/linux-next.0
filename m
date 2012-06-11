From: Andrzej Pietrasiewicz <andrzej.p-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: RE: linux-next: Tree for Jun 7 (staging/ccg #2)
Date: Mon, 11 Jun 2012 10:44:28 +0200
Message-ID: <000001cd47ae$6d482a60$47d87f20$%p@samsung.com>
References: <4FD10A30.50707@xenotime.net>
 <Pine.LNX.4.44L0.1206071646360.1185-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <Pine.LNX.4.44L0.1206071646360.1185-100000-IYeN2dnnYyZXsRXLowluHWD2FQJk+8+b@public.gmane.org>
Content-language: pl
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Alan Stern' <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, 'Randy Dunlap' <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
Cc: 'Stephen Rothwell' <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'LKML' <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'USB list' <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, 'Greg Kroah-Hartman' <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, 'Mike Lockwood' <lockwood-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Hello,

On Thursday, June 07, 2012 10:59 PM Alan Stern wrote:

<snip>
> 
> The problems above are caused by the fact that
> drivers/staging/ccg/Kconfig does not make USB_G_CGG dependent on BLOCK.

@Randy: Thanks for finding it.

@Alan: Thanks for suggesting a solution.

> 
> > In file included from drivers/staging/ccg/ccg.c:59:0:
> > drivers/staging/ccg/../../usb/gadget/f_fs.c: At top level:
> > drivers/staging/ccg/../../usb/gadget/f_fs.c:40:0: warning: "pr_vdebug"
> redefined
> > drivers/staging/ccg/../../usb/gadget/u_serial.c:138:0: note: this is the
> location of the previous definition
> 
> This could be fixed by adding a #ifndef guard to f_fs.c and u_serial.c.
> It's a little awkward to combine independent source files this way.
> 
@Randy: Thanks for finding it.

@Alan: Thanks for suggesting a solution.

The patches are on their way.

Andrzej


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
