From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: Re: linux-next: Tree for July 18: warning at kernel/lockdep.c:2068
	trace_hardirqs_on_caller
Date: Sat, 19 Jul 2008 16:20:21 -0700
Message-ID: <20080719232021.GA6476@suse.de>
References: <20080718195352.e562a00f.sfr@canb.auug.org.au> <200807190928.33978.m.kozlowski@tuxland.pl> <19f34abd0807190255x304173d4wf2bfabb2d5bce511@mail.gmail.com> <19f34abd0807190559y2fe5ebf9h7095793e82de3122@mail.gmail.com> <20080719221723.GB5578@suse.de> <19f34abd0807191527u61c5ed61kffe2279c8d46915d@mail.gmail.com> <19f34abd0807191544nfd73be5nf7dde4b61992a7e8@mail.gmail.com> <20080719225817.GA6264@suse.de> <19f34abd0807191611y7cabf405iad307ba79591e04f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <19f34abd0807191611y7cabf405iad307ba79591e04f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mariusz Kozlowski <m.kozlowski-NWF1p15JEu3VItvQsEIGlw@public.gmane.org>, Dave Hansen <haveblue-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pekka Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>, Bernhard Walle <bwalle-l3A5Bk7waGM@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Sun, Jul 20, 2008 at 01:11:36AM +0200, Vegard Nossum wrote:
> On Sun, Jul 20, 2008 at 12:58 AM, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org> wrote:
> >> firmware_map_add_early() is using bootmem for the allocation. So yes,
> >> I guess it should possible to use kobjects here. That said, this code
> >> is in fact fairly recent:
> >>
> >> commit 69ac9cd629ca96e59f34eb4ccd12d00b2c8276a7
> >> Author: Bernhard Walle <bwalle-l3A5Bk7waGM@public.gmane.org>
> >> Date:   Fri Jun 27 13:12:54 2008 +0200
> >>
> >>     sysfs: add /sys/firmware/memmap
> >>
> >> I'll add the Cc. I still have a feeling that the kobject patch should
> >> expect to run even when slab is not available.
> >
> > I never has been expected to do so in the past, so odds are, lots of
> > things might break :(
> 
> Yeah. Maybe you should withdraw your ack? :-D
> 
>     Signed-off-by: Bernhard Walle <bwalle-l3A5Bk7waGM@public.gmane.org>
>     Acked-by: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
>     Acked-by: Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>     Cc: kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>     Cc: yhlu.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
>     Signed-off-by: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>

Heh, I didn't realize that this ran so early in the boot process, the
code logically looks correct :)

> I'm sorry for having been a bit rash earlier -- it's the combination
> of the patches that produce the failure; they both seem okay on their
> own. On the other hand, this is what -next is for, isn't it?

Yup.

> Maybe the firmware memmap code can simply run a little later in the
> boot sequence?

Possibly.  I wonder why this is only a problem on your machine and not
on anything that Ingo tested?

thanks,

greg k-h
