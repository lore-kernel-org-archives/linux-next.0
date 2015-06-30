From: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v2] watchdog: omap_wdt: early_enable module parameter
Date: Tue, 30 Jun 2015 08:58:07 +0200
Message-ID: <20150630065807.GA5645@spo001.leaseweb.nl>
References: <1435227711-29875-1-git-send-email-poeschel@lemonage.de> <558C0634.9050802@roeck-us.net> <CAP=VYLr5wVMBdA76U0HKP2GTN07qiCkCTtBmFG5Z_bWE0QvT9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAP=VYLr5wVMBdA76U0HKP2GTN07qiCkCTtBmFG5Z_bWE0QvT9g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, LKML doc <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Hi Paul,

> On Thu, Jun 25, 2015 at 9:46 AM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
> > On 06/25/2015 03:21 AM, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org wrote:
> >>
> >> From: Lars Poeschel <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>
> >>
> >> Add a early_enable module parameter to the omap_wdt that starts the
> >> watchdog on module insertion. The default value is 0 which does not
> >> start the watchdog - which also does not change the behavior if the
> >> parameter is not given.
> >>
> >> Signed-off-by: Lars Poeschel <poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org>
> >
> >
> > Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
> 
> In case the info hasn't looped back around yet, this breaks the
> omap builds in linux-next:
> 
> drivers/watchdog/omap_wdt.c:288:18: error: 'omap_wdt' undeclared
> (first use in this function)
> 
> (Not sure how this could have ever worked as-is.)
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/12452335/
> 
> I see a patch has already been posted to arm-kernel but not
> Cc'd to all originally involved so figured I'd mention it.

It's fixed. The reason why we din't catch it was because of interference
with 'watchdog: omap: put struct watchdog_device into driver data'.

Kind regards,
Wim.

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
