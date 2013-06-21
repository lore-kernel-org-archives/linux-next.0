From: Yuan-Hsin Chen <yuanlmm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] usb: gadget: fotg210-udc: Use module_platform_driver_probe
 macro
Date: Fri, 21 Jun 2013 14:36:45 +0800
Message-ID: <CADB-GoLWrML8jjt5n_qBZJoqK2w-5ot+Dg5LZ4w5K-ik_UPD+w@mail.gmail.com>
References: <51C20F3D.1060700@windriver.com>
	<1371736393-5518-1-git-send-email-yhchen@faraday-tech.com>
	<20130620121610.GE9817@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130620121610.GE9817-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Yuan-Hsin Chen <yhchen-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Hi,


On Thu, Jun 20, 2013 at 8:16 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
>
> Hi,
>
> On Thu, Jun 20, 2013 at 01:53:13PM +0000, Yuan-Hsin Chen wrote:
> > Because fotg210-udc is configured as a non-hotpluggable device,
> > that makes sense to use module_platform_driver_probe() instead of
> > module_platform_driver(). This also fixes the section mismatch issue.
> >
> > Signed-off-by: Yuan-Hsin Chen <yhchen-w0jeGXs5+AWXmMXjJBpWqg@public.gmane.org>
>
> I would rather see you remove __init annotation from your probe()
> function. The reason being that it will users to bind/unbind the driver
> through sysfs, which is pretty good for testing, at least.

I see and will send a patch later. Thanks.

Yuan-Hsin

>
>
> --
> balbi
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
