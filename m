From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: linux-next: Tree for Mar 23 (xen-acpi)
Date: Sat, 24 Mar 2012 09:22:44 -0400
Message-ID: <20120324132243.GA17787@phenom.dumpdata.com>
References: <20120323172333.9af9b678fcde0e6e75b5f6dd@canb.auug.org.au>
 <4F6CB32A.3000309@xenotime.net>
 <20120324125311.GA15144@phenom.dumpdata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120324125311.GA15144@phenom.dumpdata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Jeremy Fitzhardinge <jeremy@goop.org>, xen-devel@lists.xensource.com
List-Id: linux-next.vger.kernel.org

On Sat, Mar 24, 2012 at 08:53:11AM -0400, Konrad Rzeszutek Wilk wrote:
> On Fri, Mar 23, 2012 at 10:30:18AM -0700, Randy Dunlap wrote:
> > On 03/22/2012 11:23 PM, Stephen Rothwell wrote:
> > 
> > > Hi all,
> > > 
> > > Reminder: please do not add stuff destined for v3.5 to linux-next
> > > included trees/branches until after v3.4-rc1 has been released.
> > > 
> > > Changes since 20120322:
> > 
> > 
> > on x86_64:
> > 
> > ERROR: "acpi_processor_unregister_performance" [drivers/xen/xen-acpi-processor.ko] undefined!
> > ERROR: "acpi_processor_notify_smm" [drivers/xen/xen-acpi-processor.ko] undefined!
> > ERROR: "acpi_processor_register_performance" [drivers/xen/xen-acpi-processor.ko] undefined!
> > ERROR: "acpi_processor_preregister_performance" [drivers/xen/xen-acpi-processor.ko] undefined!
> > 
> > 
> > Full randconfig file is attached.
> 
> Thanks. Working on a fix. 
Fixed. Patch going to show in #linux-next shortly.
