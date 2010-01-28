From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: linux-next: Tree for January 18 (pci + pm)
Date: Thu, 28 Jan 2010 11:04:14 -0800
Message-ID: <20100128110414.10b73b9e@jbarnes-piketon>
References: <20100118195743.b45f119e.sfr@canb.auug.org.au>
	<20100118154424.d54c0e3e.randy.dunlap@oracle.com>
	<201001200004.07654.rjw@sisk.pl>
	<20100128083322.34679625.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from outbound-mail-313.bluehost.com ([67.222.54.6]:35843 "HELO
	outbound-mail-313.bluehost.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1756477Ab0A1TET (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Jan 2010 14:04:19 -0500
In-Reply-To: <20100128083322.34679625.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-pci@vger.kernel.org

On Thu, 28 Jan 2010 08:33:22 -0800
Randy Dunlap <randy.dunlap@oracle.com> wrote:

> On Wed, 20 Jan 2010 00:04:07 +0100 Rafael J. Wysocki wrote:
> 
> > On Tuesday 19 January 2010, Randy Dunlap wrote:
> > > On Mon, 18 Jan 2010 19:57:43 +1100 Stephen Rothwell wrote:
> > > 
> > > > Hi all,
> > > > 
> > > > Changes since 20100114:
> > > 
> > > 
> > > drivers/pci/pci-driver.c: In function 'pci_pm_runtime_resume':
> > > drivers/pci/pci-driver.c:991: error: implicit declaration of
> > > function 'pci_pm_default_resume_early' drivers/pci/pci-driver.c:
> > > At top level: drivers/pci/pci-driver.c:1027: error:
> > > 'pci_pm_prepare' undeclared here (not in a function)
> > > drivers/pci/pci-driver.c:1028: error: 'pci_pm_complete'
> > > undeclared here (not in a function)
> > > drivers/pci/pci-driver.c:1029: error: 'pci_pm_suspend' undeclared
> > > here (not in a function) drivers/pci/pci-driver.c:1030: error:
> > > 'pci_pm_resume' undeclared here (not in a function)
> > > drivers/pci/pci-driver.c:1031: error: 'pci_pm_freeze' undeclared
> > > here (not in a function) drivers/pci/pci-driver.c:1032: error:
> > > 'pci_pm_thaw' undeclared here (not in a function)
> > > drivers/pci/pci-driver.c:1033: error: 'pci_pm_poweroff'
> > > undeclared here (not in a function)
> > > drivers/pci/pci-driver.c:1034: error: 'pci_pm_restore' undeclared
> > > here (not in a function) drivers/pci/pci-driver.c:1035: error:
> > > 'pci_pm_suspend_noirq' undeclared here (not in a function)
> > > drivers/pci/pci-driver.c:1036: error: 'pci_pm_resume_noirq'
> > > undeclared here (not in a function)
> > > drivers/pci/pci-driver.c:1037: error: 'pci_pm_freeze_noirq'
> > > undeclared here (not in a function)
> > > drivers/pci/pci-driver.c:1038: error: 'pci_pm_thaw_noirq'
> > > undeclared here (not in a function)
> > > drivers/pci/pci-driver.c:1039: error: 'pci_pm_poweroff_noirq'
> > > undeclared here (not in a function)
> > > drivers/pci/pci-driver.c:1040: error: 'pci_pm_restore_noirq'
> > > undeclared here (not in a function)
> > > 
> > > 
> > > partial config:
> > > 
> > > CONFIG_PM=y
> > > # CONFIG_PM_DEBUG is not set
> > > # CONFIG_SUSPEND is not set
> > > # CONFIG_HIBERNATION is not set
> > > CONFIG_PM_RUNTIME=y
> > > CONFIG_PM_OPS=y
> > > 
> > > 
> > > Full config is attached.
> > 
> > Ah, too many ifdefs.
> > 
> > Thanks, the patch below fixes that for me.
> > 
> > Rafael
> 
> Rafael, Jesse:
> 
> We still need this patch in linux-next (20100128).
> Thanks.
> 

Arg, I must have dropped this one too... will apply again and push.

-- 
Jesse Barnes, Intel Open Source Technology Center
