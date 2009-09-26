From: Bjorn Helgaas <bjorn.helgaas@hp.com>
Subject: Re: linux-next: acpi tree build failure
Date: Fri, 25 Sep 2009 21:11:43 -0600
Message-ID: <1253934703.16789.21.camel@dc7800.home>
References: <20090926121528.dfba135e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g5t0007.atlanta.hp.com ([15.192.0.44]:32045 "EHLO
	g5t0007.atlanta.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752959AbZIZDOO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 25 Sep 2009 23:14:14 -0400
In-Reply-To: <20090926121528.dfba135e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Crane Cai <crane.cai@amd.com>

On Sat, 2009-09-26 at 12:15 +1000, Stephen Rothwell wrote:
> Hi Len,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/i2c/busses/i2c-scmi.c: In function 'acpi_smbus_cmi_add':
> drivers/i2c/busses/i2c-scmi.c:374: error: implicit declaration of function 'acpi_device_uid'
> drivers/i2c/busses/i2c-scmi.c:374: warning: format '%s' expects type 'char *', but argument 5 has type 'int'
> 
> Caused by commit 6622d8cee73a26bce958484065c8f0e704911a62 ("ACPI: remove
> acpi_device_uid() and related stuff") interacting with commit
> dc9854212e0d7318d7133697906d98b78f3088b6 ("i2c: Add driver for SMBus
> Control Method Interface") recently added to Linus' tree.
> 
> I have used the version of the acpi tree from next-20090925 for today.

I think we should use the following patch to remove the usage of
acpi_device_uid().  Crane, do you agree, or is there some special
reason you need it here?



i2c-scmi: don't use acpi_device_uid()
    
We recently removed the acpi_device_uid() interface because nobody
used it.  I don't think it's essential here either.
    
Signed-off-by: Bjorn Helgaas <bjorn.helgaas@hp.com>

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 276a046..b4a55d4 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -369,9 +369,8 @@ static int acpi_smbus_cmi_add(struct acpi_device *device)
 		goto err;
 
 	snprintf(smbus_cmi->adapter.name, sizeof(smbus_cmi->adapter.name),
-		"SMBus CMI adapter %s (%s)",
-		acpi_device_name(device),
-		acpi_device_uid(device));
+		"SMBus CMI adapter %s",
+		acpi_device_name(device));
 	smbus_cmi->adapter.owner = THIS_MODULE;
 	smbus_cmi->adapter.algo = &acpi_smbus_cmi_algorithm;
 	smbus_cmi->adapter.algo_data = smbus_cmi;
