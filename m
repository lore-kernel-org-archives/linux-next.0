From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH 1/2] CPUFREQ: powernow-k8: Forgot to use printk instead of WARN_ONCE in last patch
Date: Thu, 5 Feb 2009 13:27:15 +0100
Message-ID: <200902051327.16852.trenn@suse.de>
References: <1233829109-23358-1-git-send-email-trenn@suse.de> <1233829109-23358-2-git-send-email-trenn@suse.de> <20090205120203.GA8799@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:38674 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753332AbZBEM1T (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Feb 2009 07:27:19 -0500
In-Reply-To: <20090205120203.GA8799@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: davej@redhat.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, cpufreq@vger.kernel.org

On Thursday 05 February 2009 13:02:03 Ingo Molnar wrote:
> 
> * Thomas Renninger <trenn@suse.de> wrote:
> 
> > Signed-off-by: Thomas Renninger <trenn@suse.de>
> > ---
> >  arch/x86/kernel/cpu/cpufreq/powernow-k8.c |   12 ++++++------
> >  1 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c 
b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
> > index 83515f1..5aa832f 100644
> > --- a/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
> > +++ b/arch/x86/kernel/cpu/cpufreq/powernow-k8.c
> > @@ -1247,12 +1247,12 @@ static int __cpuinit powernowk8_cpu_init(struct 
cpufreq_policy *pol)
> >  			 * thing gets introduced
> >  			 */
> >  			if (!print_once) {
> > -				WARN_ONCE(1, KERN_ERR FW_BUG PFX "Your BIOS "
> > -					  "does not provide ACPI _PSS objects "
> > -					  "in a way that Linux understands. "
> > -					  "Please report this to the Linux ACPI"
> > -					  " maintainers and complain to your "
> > -					  "BIOS vendor.\n");
> > +				printk(KERN_ERR FW_BUG PFX "Your BIOS "
> > +				       "does not provide ACPI _PSS objects "
> > +				       "in a way that Linux understands. "
> > +				       "Please report this to the Linux ACPI"
> > +				       " maintainers and complain to your "
> > +				       "BIOS vendor.\n");
> >  				print_once++;
> 
> hm, why the open-coded WARN_ONCE? (which print_once flag + the printk in 
> essence is)
Looking at WARN() again:
#ifndef __WARN
#ifndef __ASSEMBLY__
extern void warn_slowpath(const char *file, const int line,
                const char *fmt, ...) __attribute__((format(printf, 3, 4)));
#define WANT_WARN_ON_SLOWPATH
#endif
#define __WARN()                warn_slowpath(__FILE__, __LINE__, NULL)
#define __WARN_printf(arg...)   warn_slowpath(__FILE__, __LINE__, arg)
#else
#define __WARN_printf(arg...)   do { printk(arg); __WARN(); } while (0)
#endif

WARN_ONCE does throw a backtrace (warn_slowpath does) or I missed
something...
Thus WARN_ONCE makes a big difference to printk_once() (which does not
exist? but would be neat...) and prints out the backtrace, right?

Thanks,

     Thomas

> 
> So please use WARN_ONCE(), and indent it all one tab to the left which will 
> solve at least part of that ugly 6-line split up thing. And if it's a 
> WARN_ONCE() then kerneloops.org will pick it up too.
> 
