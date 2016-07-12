From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the pm tree
Date: Tue, 12 Jul 2016 14:09:26 +1000
Message-ID: <20160712140926.49958101@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41541 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750739AbcGLEJa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Jul 2016 00:09:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <Xen-devel@lists.xensource.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Octavian Purdila <octavian.purdila@intel.com>, Shannon Zhao <shannon.zhao@linaro.org>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  drivers/acpi/scan.c

between commit:

  68bdb6773289 ("ACPI: add support for ACPI reconfiguration notifiers")

from the pm tree and commit:

  c8ac8b6fb495 ("Xen: ACPI: Hide UART used by Xen")

from the xen-tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/acpi/scan.c
index 405056b95b05,cfc73fecaba4..000000000000
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@@ -1925,8 -1961,19 +1970,21 @@@ static int acpi_bus_scan_fixed(void
  	return result < 0 ? result : 0;
  }
  
+ static void __init acpi_get_spcr_uart_addr(void)
+ {
+ 	acpi_status status;
+ 	struct acpi_table_spcr *spcr_ptr;
+ 
+ 	status = acpi_get_table(ACPI_SIG_SPCR, 0,
+ 				(struct acpi_table_header **)&spcr_ptr);
+ 	if (ACPI_SUCCESS(status))
+ 		spcr_uart_addr = spcr_ptr->serial_port.address;
+ 	else
+ 		printk(KERN_WARNING PREFIX "STAO table present, but SPCR is missing\n");
+ }
+ 
 +static bool acpi_scan_initialized;
 +
  int __init acpi_scan_init(void)
  {
  	int result;
