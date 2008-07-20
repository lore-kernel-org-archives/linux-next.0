From: Bernhard Walle <bwalle-l3A5Bk7waGM@public.gmane.org>
Subject: Re: linux-next: Tree for July 18: warning at kernel/lockdep.c:2068
 trace_hardirqs_on_caller
Date: Sun, 20 Jul 2008 17:44:56 +0200
Message-ID: <20080720174456.55e41e8b@kopernikus.site>
References: <20080718195352.e562a00f.sfr@canb.auug.org.au>
	<200807190928.33978.m.kozlowski@tuxland.pl>
	<19f34abd0807190255x304173d4wf2bfabb2d5bce511@mail.gmail.com>
	<19f34abd0807190559y2fe5ebf9h7095793e82de3122@mail.gmail.com>
	<20080719221723.GB5578@suse.de>
	<19f34abd0807191527u61c5ed61kffe2279c8d46915d@mail.gmail.com>
	<19f34abd0807191544nfd73be5nf7dde4b61992a7e8@mail.gmail.com>
	<20080719225817.GA6264@suse.de>
	<19f34abd0807191611y7cabf405iad307ba79591e04f@mail.gmail.com>
	<1216544462.9311.20.camel@nimitz>
	<20080720150341.7cd381c2@kopernikus.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080720150341.7cd381c2-Hxm9IJOWyO+kWa+peg0mPg@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bernhard Walle <bwalle-l3A5Bk7waGM@public.gmane.org>
Cc: Dave Hansen <dave-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>, Mariusz Kozlowski <m.kozlowski-NWF1p15JEu3VItvQsEIGlw@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pekka Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, kexec <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-next.vger.kernel.org

* Bernhard Walle <bwalle-l3A5Bk7waGM@public.gmane.org> [2008-07-20 15:03]:
> 
> Because I didn't know that interface. And because I don't see that
> interface on my two systems that I just checked. i386 and x86-64. What
> do I have to do to enable that interface?

That interface depends on CONFIG_MEMORY_HOTPLUG. But given to that
dependency list,

128 config MEMORY_HOTPLUG
129         bool "Allow for memory hot-add"
130         depends on SPARSEMEM || X86_64_ACPI_NUMA
131         depends on HOTPLUG && !HIBERNATION && ARCH_ENABLE_MEMORY_HOTPLUG
132         depends on (IA64 || X86 || PPC64 || SUPERH || S390)

that interface is off on *many* systems (i386, x86_64), so we can't rely
on that interface in kexec. I think on POWER it's much more common than
on PC architectures.



Bernhard
-- 
Bernhard Walle, SUSE LINUX Products GmbH, Architecture Development
