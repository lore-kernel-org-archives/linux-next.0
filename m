From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: Tree for July 25 (mfd/arizona)
Date: Fri, 27 Jul 2012 15:26:34 +0200
Message-ID: <20120727132634.GN16859@sortiz-mobl>
References: <20120725143020.8c96b6d54b66364b69c330ad@canb.auug.org.au>
 <501038CF.9090902@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <501038CF.9090902@xenotime.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>
List-Id: linux-next.vger.kernel.org

Hi Randy

On Wed, Jul 25, 2012 at 11:19:59AM -0700, Randy Dunlap wrote:
> On 07/24/2012 09:30 PM, Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > 
> > Changes since 20120724:
> > 
> > 
> > The mfd tree gained a conflict against Linus' tree.
> 
> 
> 
> on i386 and x86_64:
> 
> CONFIG_MFD_ARIZONA=y
> CONFIG_MFD_ARIZONA_I2C=m
> CONFIG_MFD_CORE=m
> 
> drivers/built-in.o: In function `arizona_dev_init':
> (.devinit.text+0x3ab0): undefined reference to `mfd_add_devices'
> drivers/built-in.o: In function `arizona_dev_init':
> (.devinit.text+0x3fdc): undefined reference to `mfd_add_devices'
> drivers/built-in.o: In function `arizona_dev_init':
> (.devinit.text+0x3fff): undefined reference to `mfd_add_devices'
> drivers/built-in.o: In function `arizona_dev_init':
> (.devinit.text+0x4059): undefined reference to `mfd_remove_devices'
> drivers/built-in.o: In function `arizona_dev_exit':
> (.devexit.text+0x9): undefined reference to `mfd_remove_devices'
> 
> because MFD_ARIZONA is bool, so builtin, while MFD_CORE=m,
> so the builtin code cannot call the loadable module code.
This is fixed now, by having MFD_ARIZONA selecting MFD_CORE.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
