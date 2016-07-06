From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: next-20160705 build: 2 failures 6 warnings (next-20160705)
Date: Wed, 6 Jul 2016 11:00:15 +0800
Message-ID: <20160706030015.GB5081@shlinux2>
References: <E1bKMRb-0005l2-N2@optimist>
 <20160705095242.GP6247@sirena.org.uk>
 <20160706023156.GA5081@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160706023156.GA5081@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

On Wed, Jul 06, 2016 at 10:31:56AM +0800, Peter Chen wrote:
> On Tue, Jul 05, 2016 at 11:52:42AM +0200, Mark Brown wrote:
> > On Tue, Jul 05, 2016 at 10:15:03AM +0100, Build bot for Mark Brown wrote:
> > 
> > For the past little while both arm and arm64 allmodconfig builds have
> > been failing with:
> > 
> > > drivers/built-in.o: In function `nbu2ss_drv_probe':
> > > binder.c:(.text+0x29438c): undefined reference to `usb_ep_set_maxpacket_limit'
> > > binder.c:(.text+0x294468): undefined reference to `usb_ep_set_maxpacket_limit'
> > 
> > That function is a static inline in linux/usb/gadget.h which does seem
> > to be included (the driver builds fine) so I'm not entirely sure why
> > this is failing - I've not had time to investigate properly, I don't
> > know if the compiler is misfiring here.
> 
> The reason for that is: USB_GADGET is m, but USB_EMXX can be 'y' due to
> it is boolean although it depends on USB_GADGET. Commit 5a8d651a2
> "usb: gadget: move gadget API functions to udc-core" moves gadget APIs
> definitions from .h to .c causes this build error, but this change
> is worthwhile. The udc driver (emxx) should can be built as module
> too. Below patch should fix it:

Oh, I see Arnd has already fixed it, so omit this patch please.

-- 

Best Regards,
Peter Chen
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
