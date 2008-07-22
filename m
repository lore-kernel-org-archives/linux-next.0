From: Yasunori Goto <y-goto-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Subject: Re: linux-next: Tree for July 18: warning at kernel/lockdep.c:2068
	trace_hardirqs_on_caller
Date: Tue, 22 Jul 2008 15:15:11 +0900
Message-ID: <20080722142345.8733.E1E9C6FF@jp.fujitsu.com>
References: <20080721133937.GC4451@redhat.com>
	<20080721170037.1a0046b1@halley.suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20080721170037.1a0046b1-oJhqVyG5NZ9bpigZmTR7Iw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/kexec>,
	<mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kexec>
List-Post: <mailto:kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kexec>,
	<mailto:kexec-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: kexec-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Errors-To: kexec-bounces+glkk-kexec=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Bernhard Walle <bwalle-l3A5Bk7waGM@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Vegard Nossum <vegard.nossum-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>, kexec <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dave Hansen <dave-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Mariusz Kozlowski <m.kozlowski-NWF1p15JEu3VItvQsEIGlw@public.gmane.org>, Pekka Enberg <penberg-bbCR+/B0CizivPeTLB3BmA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vivek Goyal <vgoyal-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-next.vger.kernel.org

Hello.

> > > > Is /proc/iomem updated upon memory hotplug event.
> > > 
> > > Yes. I just checked that (yesterday).
> > > 
> > > I think it would make sense to extend /sys/firmware/memmap on
> > > hot-plugging. Just because on reboot, the firmware will see that
> > > memory, too, and report it. However, we need a way to discriminate the
> > > originally firmware-provided memory map with later added memory. I'm
> > > not sure how that can be done, I have to think about it.
> > 
> > Probably use another type of RAM identifier (System RAM (hotplug)).
> > 
> > But the point is, if /sys/devices/system/memory also represents all
> > the physical memory present in the system then it might be not be
> > justified to create another similar interface. (Until and unless there
> > is something unique about /sys/firmware/memmap).
> 
> But I don't see anything like a physical address there:
> 
>   /sys/devices/system/memory/memory2:
>   -r--r--r-- 1 root root 4096 2008-07-21 15:45 phys_device
>   -r--r--r-- 1 root root 4096 2008-07-21 15:45 phys_index
>   -rw-r--r-- 1 root root 4096 2008-07-21 15:45 state
> 
> (on a PPC64 machine where SUSE kernel has that interface enabled by
> default).

I wrote about them Documentation/memory-hotplug.txt. Please see it.

But I think /sys/firmware/memmap is better for kexec than using them.
They are made for each sections whose size is fixed on each architecture.
There is no information about areas which are occupied by firmware, and
its fixed size directories are not suitable to show them.


BTW, does kexec needs the information about not only hot-added normal memory
but also "hot-added occupied (reserved) memory by firmware"?
Fujitsu has ia64 box which can add memory. The information about memory
area is notified via _CRS method of ACPI. Our firmware team said that
there was no interface to notify the area which was occupied by firmware.
So, _CRS shows only normal (not-reserved) memory area. It means OS can't know
reserved memory which is hot-added.

If kexec has to know those reserved area, then it is very bad news for me. :-(


Thanks.

-- 
Yasunori Goto 
