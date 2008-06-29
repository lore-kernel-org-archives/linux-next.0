From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: Tree for June 13: IO APIC breakage on HP nx6325
Date: Sun, 29 Jun 2008 16:00:27 +0200
Message-ID: <200806291600.29059.rjw@sisk.pl>
References: <20080613232214.394fd6fd.sfr@canb.auug.org.au> <200806262152.02099.rjw@sisk.pl> <Pine.LNX.4.55.0806270102051.31618@cliff.in.clinika.pl>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.55.0806270102051.31618@cliff.in.clinika.pl>
Content-Disposition: inline
Sender: linux-acpi-owner@vger.kernel.org
To: "Maciej W. Rozycki" <macro@linux-mips.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Len Brown <lenb@kernel.org>
List-Id: linux-next.vger.kernel.org

On Friday, 27 of June 2008, Maciej W. Rozycki wrote:
> On Thu, 26 Jun 2008, Rafael J. Wysocki wrote:
> 
> > Well, actually, I'm not sure that will work.  I have only found
> > acpi_skip_timer_override being set to 1 in two places, but it doesn't seem to
> > be read anywhere.  What am I missing?
> 
>  I believe I removed all the occurences.  I am waiting for a proposal of a
> quirk based on the DSDT ID -- my time is a bit too limited to study the
> internals of our ACPI code at the moment; sorry about that.  I will
> complement it with a change to remove IRQ0 from I/O APIC tables as
> promised then; this piece of code I am quite familiar with.

Well, why don't we use the DMI identification as suggested by Matthew?

I think we can safely assume that all of these boxes are broken for now and we
can use a more fine grained identification in the future, if necessary.

Thanks,
Rafael
