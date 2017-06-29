From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the usb tree with the uuid tree
Date: Thu, 29 Jun 2017 14:48:44 +1000
Message-ID: <20170629144844.3214d21e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46127 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751259AbdF2Esr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Jun 2017 00:48:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, Christoph Hellwig <hch@lst.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Greg,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/misc/ucsi.c

between commit:

  94116f8126de ("ACPI: Switch to use generic guid_t in acpi_evaluate_dsm()")

from the uuid tree and commit:

  8243edf44152 ("usb: typec: ucsi: Add ACPI driver")

from the usb tree.

I fixed it up (the latter deleted the file, so I did that - I think the
new code is ok with then new guid handling) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

Almost right :-(

I got the following error:

drivers/usb/typec/ucsi/ucsi_acpi.c: In function 'ucsi_acpi_dsm':
drivers/usb/typec/ucsi/ucsi_acpi.c:33:48: error: passing argument 2 of 'acpi_evaluate_dsm' from incompatible pointer type [-Werror=incompatible-pointer-types]
  obj = acpi_evaluate_dsm(ACPI_HANDLE(ua->dev), ua->uuid.b, 1, func,
                                                ^
In file included from include/linux/acpi.h:44:0,
                 from drivers/usb/typec/ucsi/ucsi_acpi.c:14:
include/acpi/acpi_bus.h:65:20: note: expected 'const guid_t * {aka const struct <anonymous> *}' but argument is of type '__u8 * {aka unsigned char *}'
 union acpi_object *acpi_evaluate_dsm(acpi_handle handle, const guid_t *guid,  
                    ^

I have applied the following merge fix patch (the first hunk is
probably not strictly necessary):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 29 Jun 2017 14:36:10 +1000
Subject: [PATCH] usb: typec: fix for "ACPI: Switch to use generic guid_t in
 acpi_evaluate_dsm()"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 3fb2e48e1c91..7b7c9373a9b6 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -23,14 +23,14 @@ struct ucsi_acpi {
 	struct device *dev;
 	struct ucsi *ucsi;
 	struct ucsi_ppm ppm;
-	uuid_le uuid;
+	guid_t uuid;
 };
 
 static int ucsi_acpi_dsm(struct ucsi_acpi *ua, int func)
 {
 	union acpi_object *obj;
 
-	obj = acpi_evaluate_dsm(ACPI_HANDLE(ua->dev), ua->uuid.b, 1, func,
+	obj = acpi_evaluate_dsm(ACPI_HANDLE(ua->dev), &ua->uuid, 1, func,
 				NULL);
 	if (!obj) {
 		dev_err(ua->dev, "%s: failed to evaluate _DSM %d\n",
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
