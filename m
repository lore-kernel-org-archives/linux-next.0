From: Crane Cai <crane.cai@amd.com>
Subject: Re: linux-next: acpi tree build failure
Date: Sun, 27 Sep 2009 09:27:16 +0800
Message-ID: <20090927012716.GB10173@crane-desktop>
References: <20090926121528.dfba135e.sfr@canb.auug.org.au> <1253934703.16789.21.camel@dc7800.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]:10951 "EHLO
	TX2EHSOBE007.bigfish.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752858AbZI0B1I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 26 Sep 2009 21:27:08 -0400
Content-Disposition: inline
In-Reply-To: <1253934703.16789.21.camel@dc7800.home>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bjorn.helgaas@hp.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Bjorn,

On Fri, Sep 25, 2009 at 09:11:43PM -0600, Bjorn Helgaas wrote:
> On Sat, 2009-09-26 at 12:15 +1000, Stephen Rothwell wrote:
> > Hi Len,
> > 
> > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > 
> > drivers/i2c/busses/i2c-scmi.c: In function 'acpi_smbus_cmi_add':
> > drivers/i2c/busses/i2c-scmi.c:374: error: implicit declaration of function 'acpi_device_uid'
> > drivers/i2c/busses/i2c-scmi.c:374: warning: format '%s' expects type 'char *', but argument 5 has type 'int'
> > 
> > Caused by commit 6622d8cee73a26bce958484065c8f0e704911a62 ("ACPI: remove
> > acpi_device_uid() and related stuff") interacting with commit
> > dc9854212e0d7318d7133697906d98b78f3088b6 ("i2c: Add driver for SMBus
> > Control Method Interface") recently added to Linus' tree.
> > 
> > I have used the version of the acpi tree from next-20090925 for today.
> 
> I think we should use the following patch to remove the usage of
> acpi_device_uid().  Crane, do you agree, or is there some special
> reason you need it here?
I agree.
> 
> 
> 

-- 
Best Regards,
- Crane
