From: 'Greg KH' <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the arm
 tree
Date: Fri, 6 Jan 2012 11:20:02 -0800
Message-ID: <20120106192002.GA24244@kroah.com>
References: <20120106175227.07a7240920f3ccd95c27b9a7@canb.auug.org.au>
 <031201cccc41$f24aa320$d6dfe960$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <031201cccc41$f24aa320$d6dfe960$%kim@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Stephen Rothwell' <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, 'Nicolas Pitre' <nicolas.pitre@linaro.org>, 'Russell King' <rmk@arm.linux.org.uk>, 'Kay Sievers' <kay.sievers@vrfy.org>
List-Id: linux-next.vger.kernel.org

On Fri, Jan 06, 2012 at 04:08:09PM +0900, Kukjin Kim wrote:
> Stephen Rothwell wrote:
> > 
> > Hi Greg,
> > 
> > Today's linux-next merge of the driver-core tree got a conflict in
> > arch/arm/mach-s5pc100/common.c between commit 109ac862f737 ("ARM:
> > mach-s5pc100: use standard arch_idle()") from the arm tree and commit
> > 4a858cfc9af8 ("arm: convert sysdev_class to a regular subsystem") from
> > the driver-core tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary.
> > 
> > --
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> > 
> > diff --cc arch/arm/mach-s5pc100/common.c
> > index 4659fb9,af52c09..0000000
> > --- a/arch/arm/mach-s5pc100/common.c
> > +++ b/arch/arm/mach-s5pc100/common.c
> > @@@ -194,27 -154,17 +195,27 @@@ static struct device s5pc100_dev =
> > 
> >   static int __init s5pc100_core_init(void)
> >   {
> > - 	return sysdev_class_register(&s5pc100_sysclass);
> > + 	return subsys_system_register(&s5pc100_subsys, NULL);
> >   }
> >  -
> >   core_initcall(s5pc100_core_init);
> > 
> >   int __init s5pc100_init(void)
> >   {
> >   	printk(KERN_INFO "S5PC100: Initializing architecture\n");
> > - 	return sysdev_register(&s5pc100_sysdev);
> > ++	return device_register(&s5pc100_sys);
> 
> Hi Greg,
> 
> Should be 'return device_register(&s5pc100_dev);'?
> 
> Greg,
> Following should be fixed in your driver-core/driver-core-next.
> (I informed that but maybe you missed)

Sorry, I missed this patch.  I'll apply it and take the above merge fix
as well.

greg k-h
