From: Lin Ming <ming.m.lin@intel.com>
Subject: Re: linux-next: build warnings after merge of the libata tree
Date: Mon, 02 Jul 2012 12:31:19 +0800
Message-ID: <1341203479.31272.4.camel@minggr>
References: <20120702131914.510857dc84182e95641e7e97@canb.auug.org.au>
	 <1341199318.31272.2.camel@minggr>
	 <20120702135429.0d17c1f4fe46828bd29b3458@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:12970 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750961Ab2GBEbW (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Jul 2012 00:31:22 -0400
In-Reply-To: <20120702135429.0d17c1f4fe46828bd29b3458@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeff Garzik <jeff@garzik.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Holger Macht <holger@homac.de>

On Mon, 2012-07-02 at 13:54 +1000, Stephen Rothwell wrote:
> Hi Lin,
> 
> On Mon, 02 Jul 2012 11:21:58 +0800 Lin Ming <ming.m.lin@intel.com> wrote:
> >
> > Could you please send me your ppc64 .config?
> > I'll do cross build on my x86 machine.
> 
> Please just look at the code added in drivers/ata/libata.h.  Hint: what
> happens if CONFIG_ATA_ACPI is *not* defined?
> 

Hi Stephen,

Could you pick below fix?
Thanks.

>From cc270d0b3b132a37290db5fe3941361243540a18 Mon Sep 17 00:00:00 2001
From: Lin Ming <ming.m.lin@intel.com>
Date: Mon, 2 Jul 2012 12:20:39 +0800
Subject: [PATCH] libata-acpi: add missing inlines in libata.h

Adds inline for ata_acpi_unregister/ata_acpi_bind/ata_acpi_unbind
in drivers/ata/libata.h for !CONFIG_ATA_ACPI to fix below warnings.

warning: 'ata_acpi_unregister' defined but not used [-Wunused-function]
warning: 'ata_acpi_bind' defined but not used [-Wunused-function]
warning: 'ata_acpi_unbind' defined but not used [-Wunused-function]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Lin Ming <ming.m.lin@intel.com>
---
 drivers/ata/libata.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/libata.h b/drivers/ata/libata.h
index 44a7939..50e4dff 100644
--- a/drivers/ata/libata.h
+++ b/drivers/ata/libata.h
@@ -131,9 +131,9 @@ static inline void ata_acpi_on_disable(struct ata_device *dev) { }
 static inline void ata_acpi_set_state(struct ata_port *ap,
 				      pm_message_t state) { }
 static inline int ata_acpi_register(void) { return 0; }
-static void ata_acpi_unregister(void) { }
-static void ata_acpi_bind(struct ata_device *dev) { }
-static void ata_acpi_unbind(struct ata_device *dev) { }
+static inline void ata_acpi_unregister(void) { }
+static inline void ata_acpi_bind(struct ata_device *dev) { }
+static inline void ata_acpi_unbind(struct ata_device *dev) { }
 #endif
 
 /* libata-scsi.c */
-- 
1.7.2.5
