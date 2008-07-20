From: Dave Hansen <dave-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: linux-next: Tree for July 18: warning at kernel/lockdep.c:2068
	trace_hardirqs_on_caller
Date: Sun, 20 Jul 2008 02:01:02 -0700
Message-ID: <1216544462.9311.20.camel@nimitz>
References: <20080718195352.e562a00f.sfr@canb.auug.org.au>
	 <200807190928.33978.m.kozlowski@tuxland.pl>
	 <19f34abd0807190255x304173d4wf2bfabb2d5bce511@mail.gmail.com>
	 <19f34abd0807190559y2fe5ebf9h7095793e82de3122@mail.gmail.com>
	 <20080719221723.GB5578@suse.de>
	 <19f34abd0807191527u61c5ed61kffe2279c8d46915d@mail.gmail.com>
	 <19f34abd0807191544nfd73be5nf7dde4b61992a7e8@mail.gmail.com>
	 <20080719225817.GA6264@suse.de>
	 <19f34abd0807191611y7cabf405iad307ba79591e04f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <19f34abd0807191611y7cabf405iad307ba79591e04f-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>, Mariusz Kozlowski <m.kozlowski-NWF1p15JEu3VItvQsEIGlw@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pekka Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>, Bernhard Walle <bwalle-l3A5Bk7waGM@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, kexec <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Sun, 2008-07-20 at 01:11 +0200, Vegard Nossum wrote:
> Maybe the firmware memmap code can simply run a little later in the
> boot sequence?

Heh, I'm catching up on this thread...

It is possible that it could run later.  But, I do know that there are
at least a couple of these tables (on various arches) that we toss out
of memory or become unavailable later in boot.  

I do this this:

    sysfs: add /sys/firmware/memmap

is really being done at the wrong level.  I don't, for instance, see
*any* reference to memory hotplug in these patches.  That's because
they're done against firmware structures, and memory hotplug doesn't
update firmware structures on the two architectures that I can remember
(ppc64 and x86).

In other words, kexec using this probably won't work on a memory hotplug
machine.

Secondly, why don't we just modify the
existing /sys/devices/system/memory things to properly export what exec
needs?  They're already cross-platform *and* they're updated with memory
hotplug events.  

-- Dave
