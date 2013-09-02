From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the pm tree
Date: Mon, 2 Sep 2013 19:09:00 +0100
Message-ID: <20130902180900.GC11030@e102568-lin.cambridge.arm.com>
References: <20130829180425.4aa3d164f01cc65b215187fe@canb.auug.org.au>
 <20130829175715.GH18542@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130829175715.GH18542@quad.lixom.net>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sahara <keun-o.park@windriver.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Rafael J. Wysocki" <rjw@sisk.pl>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-next.vger.kernel.org

On Thu, Aug 29, 2013 at 06:57:15PM +0100, Olof Johansson wrote:
> On Thu, Aug 29, 2013 at 06:04:25PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the arm-soc tree got a conflict in
> > drivers/cpuidle/Makefile between commits b98e01ad4ed9 ("cpuidle: Add
> > Kconfig.arm and move calxeda, kirkwood and zynq") and d3f2950f2ade ("ARM:
> > ux500: cpuidle: Move ux500 cpuidle driver to drivers/cpuidle") from the
> > pm tree and commit 14d2c34cfa00 ("cpuidle: big.LITTLE: vexpress-TC2 CPU
> > idle driver") from the arm-soc tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary (no action
> > is required).
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell                    sfr@canb.auug.org.au
> > 
> > diff --cc drivers/cpuidle/Makefile
> > index 0b9d200,3b6445c..0000000
> > --- a/drivers/cpuidle/Makefile
> > +++ b/drivers/cpuidle/Makefile
> > @@@ -5,9 -5,7 +5,10 @@@
> >   obj-y += cpuidle.o driver.o governor.o sysfs.o governors/
> >   obj-$(CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED) += coupled.o
> >   
> >  -obj-$(CONFIG_CPU_IDLE_CALXEDA) += cpuidle-calxeda.o
> >  -obj-$(CONFIG_ARCH_KIRKWOOD) += cpuidle-kirkwood.o
> >  -obj-$(CONFIG_CPU_IDLE_ZYNQ) += cpuidle-zynq.o
> >  -obj-$(CONFIG_CPU_IDLE_BIG_LITTLE) += cpuidle-big_little.o
> >  +##################################################################################
> >  +# ARM SoC drivers
> >  +obj-$(CONFIG_ARM_HIGHBANK_CPUIDLE)	+= cpuidle-calxeda.o
> >  +obj-$(CONFIG_ARM_KIRKWOOD_CPUIDLE)	+= cpuidle-kirkwood.o
> >  +obj-$(CONFIG_ARM_ZYNQ_CPUIDLE)		+= cpuidle-zynq.o
> >  +obj-$(CONFIG_ARM_U8500_CPUIDLE)         += cpuidle-ux500.o
> > ++obj-$(CONFIG_CPU_IDLE_BIG_LITTLE)       += cpuidle-big_little.o
> 
> 
> Might want to sort u8500 before zynq, but otherwise looks fine.

I noticed that owing to the merge, CONFIG_CPU_IDLE_BIG_LITTLE should be moved
to the newly introduced Kconfig.arm. How are we going to handle this ? It is
just a matter of renaming the config entry and moving it to Kconfig.arm.

Thanks,
Lorenzo
