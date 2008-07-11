From: "Maciej W. Rozycki" <macro-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Subject: Re: linux-next: Tree for July 8: nx6325-related commits
Date: Fri, 11 Jul 2008 20:50:59 +0100 (BST)
Message-ID: <Pine.LNX.4.55.0807111949090.31940@cliff.in.clinika.pl>
References: <20080708192251.3275d283.sfr@canb.auug.org.au> <200807090048.48589.rjw@sisk.pl>
 <Pine.LNX.4.55.0807091429220.5665@cliff.in.clinika.pl>
 <20080710115102.GB2301@alberich.amd.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080710115102.GB2301-rMjmLWMCR8hKF45tlneXZg@public.gmane.org>
Sender: kernel-testers-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Herrmann <andreas.herrmann3-5C7GfCeVMHo@public.gmane.org>
Cc: "Rafael J. Wysocki" <rjw-KKrjLPT3xs0@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kernel Testers List <kernel-testers-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matthew Garrett <mjg59-1xO5oi07KQx4cg9Nei1l7Q@public.gmane.org>
List-Id: linux-next.vger.kernel.org

On Thu, 10 Jul 2008, Andreas Herrmann wrote:

> FYI, I looked further into the missing interrupt problem (testing on
> 64-bit, with Rafael's patch version and "Virtual Wire Mode" for the
> timer IRQ).
> Just before the weird behaviour I have two log entries:
> 
>  APIC error on CPU1: 00(40)
>  APIC error on CPU0: 00(40)
> 
> AFAIK 0x40 is "Illegal Register Address" error:
> 
> "Illegal Register Address (IRA)Bit 7.  The IRA bit when set to 1
> indicates that an access to an unimplemented register location within
> the local APIC register range (APIC Base Address + 4 Kbytes) was
> attempted."
> 
> I've tried to track down who is responsible for that access. But I
> didn't find the offender yet. Maybe it's Linux or some SMM stuff?
> Don't know.
> 
> Right after those messages no interrupts from PIT/PIC (which should be
> "virtual wired" to LVT0 of CPU0) are received anymore. I dumped PIC
> and local APIC settings but I did not find any suspicious things here.

 The return address from the interrupt handler would be useful here as I 
would expect it not to be far off from the offending access.  I haven't 
seen such errors on my system, so I cannot track the cause down myself.

> Before I reread all the above -- here are just some early comments
> regarding the IRQ0 override:
> 
> * HPET timer 0 in legacy mode should be connected to INTIN2.

 The HPET spec uses INTIN2 throughout, but I think unless a counterexample
is seen, we should simply assume it uses the same lines the 8254 uses or
would use, which is ISA IRQ0, and is subject to the same ACPI interrupt
routing rules.  This is especially implied by how the LEG_RT_CNF bit has
been specified and what common sense suggests.  Alternatively we could
assume any system which maps ISA IRQ0 to INTIN0 is not compliant to the
HPET spec.

 I cannot tell more about the HPET in the native mode at the moment --
certainly it is not safe to share an I/O APIC pin between an HPET
interrupt and the ExtINTA line.  And ACPI has no way to report ExtINTA
lines, so I suppose the best bet is either to reuse the line that is known
to work for IRQ0, replacing the 8254 or to avoid the legacy range of up to
IRQ15 in the APIC mode altogether.  All I can say is the three HPET timers
on my system support the interrupts IRQ20-23 as well as, in the case of
the timer #2, IRQ11.

 Unfortunately the quality of the spec (at least version 1.0a I have here)  
is rather substandard.

> * To configure this at least some chipsets are able to "swap" INTIN0
>   and INTIN2:
> 
>   Say default is IRQ0 -> INTIN0 and output of PIC -> INTIN2. Doing
>   "some chipset magic" it is possible to swap it such that IRQ0 ->
>   INTIN2 and output of PIC -> INTIN0.
> 
>   I might be wrong but maybe that "feature" was invented for HPET
>   usage in legacy mode -- to deliver timer interrupts to INTIN2.
>   IMHO for this scenario the IRQ0/INTIN2 override exists.

 Well, it sounds like a "feature" to workaround the broken spec which
refers explicitly to INTIN2 rather than ISA IRQ0.  Historically, IRQ0 was
typically routed to INTIN2 rather than INTIN0 (and the ExtINTA line went
to the latter) even on APIC implementations as discrete as the 82489DX,
where the system implementer had full freedom to route lines however they
liked as all were external and went through the PCB.

 The only explanation I could imagine is such a setup was specified among
the few "default configurations" Intel's Multiprocessor Specification
provided.  Even in its first publicly available version 1.1 full routing
tables could have been specified which could describe arbitrary
configurations.  However it is possible earlier versions might have been
limited in this regard and for example provide for these "default
configurations" only.  I have a vague recollection from some discussion
which makes me think this was really the case.  Then most of the
implementers followed the early ones, including interrupt routing
hardwired on-chip inside more integrated implementations, and therefore
most of the systems at least up to the moment ACPI has started being
deployed used the arrangement where IRQ0 is wired to INTIN2.

> To complete the confusion, the nx6325 box that I am testing on
> advertises an IRQ0/INTIN2 override but INTIN0/INTIN2 are _not_
> swapped ... That's the point where I think the BIOS of the box is
> totally broken or I just missed some real important bit. ;-(

 I have posted the patches now -- it has been longer than expected, but
with the number of local patches in my tree reaching 90 I had to improve
procedures for tree updates and it took me some extra time.  I think these
patches will let us improve some other code that has been recently
prepared to tackle this nx6325 breakage as soon as possible.  I'll have a
look into it.

 Now that you mentioned that the SB400 is capable of swapping INTIN0 and
INTIN2, I think this is information we could make use of to patch
interrupt routing tables correctly.  Is the state of the swapping circuit
readable from the chip anywhere?

  Maciej
