From: Darren Hart <dvhart@infradead.org>
Subject: Re: linux-next: build warning after merge of the drivers-x86 tree
Date: Wed, 14 Dec 2016 14:59:14 -0800
Message-ID: <20161214225914.GA7743@f23x64.localdomain>
References: <20161214135044.57dc96f5@canb.auug.org.au>
 <20161214222138.GA116314@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161214222138.GA116314@f23x64.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lyude <lyude@redhat.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: linux-next.vger.kernel.org

On Wed, Dec 14, 2016 at 02:21:38PM -0800, Darren Hart wrote:
> On Wed, Dec 14, 2016 at 01:50:44PM +1100, Stephen Rothwell wrote:
> > Hi Darren,
> > 
> > After merging the drivers-x86 tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> > 
> > In file included from include/linux/kernel.h:13:0,
> >                  from drivers/platform/x86/thinkpad_acpi.c:52:
> > drivers/platform/x86/thinkpad_acpi.c: In function 'hotkey_init':
> > include/linux/printk.h:299:2: warning: 'type' may be used uninitialized in this function [-Wmaybe-uninitialized]
> >   printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
> >   ^
> > drivers/platform/x86/thinkpad_acpi.c:3147:8: note: 'type' was declared here
> >   char *type;
> >         ^
> > In file included from include/linux/kernel.h:13:0,
> >                  from drivers/platform/x86/thinkpad_acpi.c:52:
> > include/linux/printk.h:299:2: warning: 'in_tablet_mode' may be used uninitialized in this function [-Wmaybe-uninitialized]
> >   printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
> >   ^
> > drivers/platform/x86/thinkpad_acpi.c:3146:6: note: 'in_tablet_mode' was declared here
> >   int in_tablet_mode, res;
> >       ^
> > 
> > Introduced by commit
> > 
> >   b31800283868 ("platform/x86: thinkpad_acpi: Move tablet detection into separate function")
> > 
> > I can't tell if this is a false positive or not.
> 
> That's an uninitialized local variable. Not sure how I missed that. I'll
> fix it up today. Thank you for the report.

OK, no, it's a false positive because tp_features.hotkey_tablet is assigned in
both places where in_tablet_mode is assigned, and if the former is 0 (global
scope), the function returns without calling pr_info.

Lyude, Henrique, please confirm.

Regardless, I'll add a patch to init in_tablet_mode to 0 so it is explicit - but
will not rebase as it isn't technically an error.

-- 
Darren Hart
Intel Open Source Technology Center
