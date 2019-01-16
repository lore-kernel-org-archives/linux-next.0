From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Fixes tags need some work in the pm tree
Date: Tue, 15 Jan 2019 19:22:57 -0500
Message-ID: <20190116002257.GE26416@windriver.com>
References: <20190116075540.78cff44e@canb.auug.org.au>
 <2774660.l3LIlnjlhl@aspire.rjw.lan>
 <20190116094305.0f66356a@canb.auug.org.au>
 <8346227.VjU8HeZdOJ@aspire.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8346227.VjU8HeZdOJ@aspire.rjw.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sinan Kaya <okaya@kernel.org>
List-Id: linux-next.vger.kernel.org

[Re: linux-next: Fixes tags need some work in the pm tree] On 16/01/2019 (Wed 00:06) Rafael J. Wysocki wrote:

> On Tuesday, January 15, 2019 11:43:05 PM CET Stephen Rothwell wrote:
> > Hi Rafael,
> > 
> > On Tue, 15 Jan 2019 23:13:16 +0100 "Rafael J. Wysocki" <rjw@rjwysocki.net> wrote:
> > >
> > > On Tuesday, January 15, 2019 9:55:40 PM CET Stephen Rothwell wrote:
> > > > [I am experimenting with checking the Fixes tags in commits in linux-next.
> > > > Please let me know if you think I am being too strict.]
> > > > 
> > > > Hi Rafael,
> > > > 
> > > > Commits
> > > > 
> > > >   62b33d57c534 ("drivers: thermal: int340x_thermal: Make PCI dependency explicit")
> > > >   cd793ab22a93 ("x86/intel/lpss: Make PCI dependency explicit")
> > > >   42ac19e7b81e ("ACPI: EC: Look for ECDT EC after calling acpi_load_tables()")
> > > >   6c29b81b5695 ("platform/x86: apple-gmux: Make PCI dependency explicit")
> > > >   34783dc0182a ("platform/x86: intel_pmc: Make PCI dependency explicit")
> > > >   704658d1d3ae ("platform/x86: intel_ips: make PCI dependency explicit")
> > > >   5df37f3a1aa9 ("vga-switcheroo: make PCI dependency explicit")
> > > >   da1df6ee4296 ("ata: pata_acpi: Make PCI dependency explicit")
> > > >   ce97a22a596b ("ACPI / LPSS: Make PCI dependency explicit")
> > > > 
> > > > Have malformed Fixes tags:
> > > > 
> > > > There should be double quotes around the commit subject.  
> > > 
> > > Well, where does this requirement come from?
> > > 
> > > It hasn't been there before AFAICS.
> > 
> > Documentation/process/submitting-patches.rst has the following, but I
> > am sure people are happy to discuss changes and it does say "For
> > example", so maybe I am being to strict?
> 
> If that's the source of it, then it's rather weak IMO.

Rafael, allow me to rewind a bit, and add context you would not have...

A quick on-the-fly script shows we have a lot of "Fixes:" tags that
either have bad (rebased/gone) commit IDs and/or non-standard
formatting.

The biggest issue is having commits in mainline that reference a commit
ID in a Fixes: tag that doesn't exist - for one reason or another.  Once
that is in mainline, we can't correct it.  It is there forever.

Doing a sanity check for that in linux-next seems like a good place to
check for this and prevent it.  And if we sanity check for one thing, we
can sanity check for other common issues.  Hence the less important
formatting checks.

> Formal requirements should be documented as such and I would expect that
> to happen through the usual process: patch submission, review, acceptance etc.

I'd rather not misinterpret this as a formal requirement.  We just want
to catch bad SHA IDs in Fixes: and also help our friends doing the
linux-stable releases so they can parse those Fixes: fields more easily
and reliably.

I'd like to think we all can support the work the linux-stable people do
and stand behind doing whatever we can to help them.  At the same time,
people (maintainers and submitters) have the choice to ignore the
e-mails that suggest "Fixes:" changes, if they feel they are invalid.
And suggestions for improvements in parsing etc etc are always welcome.

Thanks,
Paul.
--
