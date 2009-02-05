From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH 1/2] CPUFREQ: powernow-k8: Forgot to use printk instead
	of WARN_ONCE in last patch
Date: Thu, 5 Feb 2009 14:26:40 +0100
Message-ID: <20090205132640.GA11176@elte.hu>
References: <1233829109-23358-1-git-send-email-trenn@suse.de> <200902051310.00426.trenn@suse.de> <20090205123331.GC8799@elte.hu> <200902051354.04230.trenn@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:49096 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755026AbZBEN07 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 08:26:59 -0500
Content-Disposition: inline
In-Reply-To: <200902051354.04230.trenn@suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Renninger <trenn@suse.de>
Cc: davej@redhat.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, cpufreq@vger.kernel.org


* Thomas Renninger <trenn@suse.de> wrote:

> On Thursday 05 February 2009 13:33:31 Ingo Molnar wrote:
> > 
> > * Thomas Renninger <trenn@suse.de> wrote:
> > 
> > > On Thursday 05 February 2009 13:02:03 Ingo Molnar wrote:
> > > > 
> > > > * Thomas Renninger <trenn@suse.de> wrote:
> > > > 
> > > > > Signed-off-by: Thomas Renninger <trenn@suse.de>
> > > > > ---
> > > > >  arch/x86/kernel/cpu/cpufreq/powernow-k8.c |   12 ++++++------
> > > > >  1 files changed, 6 insertions(+), 6 deletions(-)
> > > > > 
> > > > > diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c 
> > > b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
> > > > > index 83515f1..5aa832f 100644
> > > > > --- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
> > > > > +++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
> > > > > @@ -1247,12 +1247,12 @@ static int __cpuinit 
> powernowk8_cpu_init(struct 
> > > cpufreq_policy *pol)
> > > > >  			 * thing gets introduced
> > > > >  			 */
> > > > >  			if (!print_once) {
> > > > > -				WARN_ONCE(1, KERN_ERR FW_BUG PFX "Your BIOS "
> > > > > -					  "does not provide ACPI _PSS objects "
> > > > > -					  "in a way that Linux understands. "
> > > > > -					  "Please report this to the Linux ACPI"
> > > > > -					  " maintainers and complain to your "
> > > > > -					  "BIOS vendor.\n");
> > > > > +				printk(KERN_ERR FW_BUG PFX "Your BIOS "
> > > > > +				       "does not provide ACPI _PSS objects "
> > > > > +				       "in a way that Linux understands. "
> > > > > +				       "Please report this to the Linux ACPI"
> > > > > +				       " maintainers and complain to your "
> > > > > +				       "BIOS vendor.\n");
> > > > >  				print_once++;
> > > > 
> > > > hm, why the open-coded WARN_ONCE? (which print_once flag + the printk in 
> > > > essence is)
> > > > 
> > > > So please use WARN_ONCE(), and indent it all one tab to the left which 
> will 
> > > > solve at least part of that ugly 6-line split up thing. And if it's a 
> > > > WARN_ONCE() then kerneloops.org will pick it up too.
> > > No.
> > > This happens if your BIOS is older than your CPU and you then miss 
> cpufreq.
> > > This often happens on very new machines/CPUs. It could also happen that 
> you
> > > have to wait a month or so until your vendor offers a new BIOS.
> > > 
> > > We want to tell the user that it's not the kernel's fault, but we better 
> do
> > > not spit out a huge backtrace, which is worthless anyway as it's the BIOS
> > > which is broken.
> > 
> > That's fine and we can do that, but the text does not suggest that at all.
> > 
> > The text says "please report this to the Linux ACPI maintainers" and that 
> > Linux does not understand this - and closes with the suggestion that this 
> > should be reported to the BIOS vendor too. That tells, to the user, that at 
> > minimum Linux is confused.
> > 
> > Such text directs the bugreports to _us_ kernel maintainers, not to the BIOS 
> > vendors.
> > 
> > A much clearer text and implementation would be to do something like:
> > 
> > static const char ACPI_PSS_BIOS_BUG_MSG[] =
> >   KERN_ERR "Your BIOS does not provide compatible ACPI _PSS objects.\n"
> >   KERN_ERR "Complain to your BIOS vendor. This is not a kernel bug.\n";
> 
> Yep, even better:
>    KERN_ERR FW_BUG "Incompatible ACPI _PSS objects.\n"
>    KERN_ERR FW_BUG "Complain to your BIOS vendor.\n";
> 
> Then distributions easily can do:
> dmesg |grep '[Firmware Bug]'
> 
> and reject the BIOS to get certified or throw a bug back to the
> vendor.
> 
> I expect the long version still comes from the times when one
> could not be sure whether it's the Linux ACPI subsystem or the
> BIOS table which is wrong. I agree, that mentioning the kernel to
> possibly be fault, should be deleted.
> 
> > [...]
> > 
> >   			if (!print_once) {
> > 				printk(ACPI_PSS_BIOS_BUG_MSG);
> > 				print_once = 1;
> > 			}
> > 
> > Note the improvements:
> > 
> >  - No more ugly linebreaks.
> > 
> >  - print_once++ was a poor solution as well - the standard thing is to set
> >    'once' flags to 1 - once and forever.
> Hm, it's only incremented once, I do not see why this is a poor solution.

It's not a huge issue - it's just somewhat suboptimal as a coding construct 
because it's a bit dissimilar to how things are done typically. When i first 
saw it i had to look again because it looked a bit odd - first i was unsure 
whether the ++ has an actual _meaning_.

It seems like an insignifican detail (which it really is, if looked at in 
isolation), but we have a huge, 10 MLOC kernel full of code. So we really 
want elegant-looking, pleasant, predictable, efficient and standard patterns 
of code everywhere.

> perfect would be printk_once() similar to WARN_ONCE.
> Andrew mentioned a discussion about implementing such a thing.
> IMO it would be worth it, I needed something like that three times in the
> last 7 patches.

Yeah - i just posted it.

> >  - The 6-line split-up warning message does not obscure the code 
> >    itself anymore. The error condition is clear and clean and visually 
> >    unintrusive.
> > 
> >  - The original message text had no linebreak and was about two full lines
> >    long when printed - in a single line. If the kernel prints such messages 
> >    that looks sloppy and confusing. If watched via a serial line then the 
> >    overlong portion can even be missed at first sight.
> > 
> >  - If someone hits that warning and sees it in the kernel log, then a
> >    git grep ""Your BIOS does not provide compatible ACPI _PSS objects"
> >    will come up with arch/x86/kernel/cpu/cpufreq/powernow-k8.c. With the 
> >    original code it would come up empty and the user/developer would perhaps 
> >    thing that it's perhaps the distro kernel that prints that warning, not 
> >    the upstream kernel.
> > 
> > Could you please fix it in that fashion? Thanks,
> I fully agree with the "no line break" and not "not grepable" issues.
> I send something new, maybe not today.

Thanks.

	Ingo
