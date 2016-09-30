From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tty tree with the pm tree
Date: Fri, 30 Sep 2016 13:42:23 +1000
Message-ID: <20160930134223.4eb0767d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39781 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932656AbcI3Dm0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Sep 2016 23:42:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Aleksey Makarov <aleksey.makarov@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

Hi Greg,

Today's linux-next merge of the tty tree got a conflict in:

  include/linux/acpi.h

between commit:

  058dfc767008 ("ACPI / watchdog: Add support for WDAT hardware watchdog")

from the pm tree and commit:

  ad1696f6f09d ("ACPI: parse SPCR and enable matching console")

from the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/acpi.h
index 19e650c940b6,2353827731d2..000000000000
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@@ -1093,10 -1074,10 +1093,16 @@@ void acpi_table_upgrade(void)
  static inline void acpi_table_upgrade(void) { }
  #endif
  
 +#if defined(CONFIG_ACPI) && defined(CONFIG_ACPI_WATCHDOG)
 +extern bool acpi_has_watchdog(void);
 +#else
 +static inline bool acpi_has_watchdog(void) { return false; }
 +#endif
 +
+ #ifdef CONFIG_ACPI_SPCR_TABLE
+ int parse_spcr(bool earlycon);
+ #else
+ static inline int parse_spcr(bool earlycon) { return 0; }
+ #endif
+ 
  #endif	/*_LINUX_ACPI_H*/
