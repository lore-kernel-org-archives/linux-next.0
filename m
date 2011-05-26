From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -next] regulator: fix 88pm8607.c printk format warning
Date: Thu, 26 May 2011 09:05:22 -0700
Message-ID: <20110526090522.5d8c684b.randy.dunlap@oracle.com>
References: <20110518145412.f6cba4ef.sfr@canb.auug.org.au>
	<20110518100722.76bd6fb6.randy.dunlap@oracle.com>
	<20110518194311.GB5077@opensource.wolfsonmicro.com>
	<1305978663.3317.7.camel@odin>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1305978663.3317.7.camel@odin>
Sender: linux-kernel-owner@vger.kernel.org
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Haojian Zhuang <haojian.zhuang@marvell.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>
List-Id: linux-next.vger.kernel.org

On Sat, 21 May 2011 12:51:03 +0100 Liam Girdwood wrote:

> On Wed, 2011-05-18 at 12:43 -0700, Mark Brown wrote:
> > On Wed, May 18, 2011 at 10:07:22AM -0700, Randy Dunlap wrote:
> > > From: Randy Dunlap <randy.dunlap@oracle.com>
> > > 
> > > Fix printk format warning (seen on x86_64) and change to unsigned
> > > output format:
> > > 
> > > drivers/regulator/88pm8607.c:417: warning: format '%d' expects type 'int', but argument 3 has type 'resource_size_t'
> > 
> > Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> > --
> 
> Samuel, this doesn't apply against regulator-next. Iirc, the patches
> this is against went via mfd-next ? If, so any chance you could take
> this ?
> 
> Thanks !
> 
> Liam  

Samuel,
Do you need this patch resent to you?

thanks,
---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
