From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the tty.current tree
Date: Fri, 11 Aug 2017 12:00:47 +1000
Message-ID: <20170811120047.17d5db54@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45985 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751715AbdHKCAt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Aug 2017 22:00:49 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Greg KH <greg@kroah.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Timur Tabi <timur@codeaurora.org>, Graeme Gregory <graeme.gregory@linaro.org>

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in:

  drivers/acpi/spcr.c

between commit:

  37ef38f3f838 ("tty: pl011: fix initialization order of QDF2400 E44")

from the tty.current tree and commit:

  01c5210cad90 ("ACPI: SPCR: work around clock issue on xgene UART")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/acpi/spcr.c
index 98aa8c808a33,48a7efc28ebb..000000000000
--- a/drivers/acpi/spcr.c
+++ b/drivers/acpi/spcr.c
@@@ -157,35 -155,21 +165,43 @@@ int __init parse_spcr(bool earlycon
  		goto done;
  	}
  
 -	if (qdf2400_erratum_44_present(&table->header))
 -		uart = "qdf2400_e44";
 +	/*
 +	 * If the E44 erratum is required, then we need to tell the pl011
 +	 * driver to implement the work-around.
 +	 *
 +	 * The global variable is used by the probe function when it
 +	 * creates the UARTs, whether or not they're used as a console.
 +	 *
 +	 * If the user specifies "traditional" earlycon, the qdf2400_e44
 +	 * console name matches the EARLYCON_DECLARE() statement, and
 +	 * SPCR is not used.  Parameter "earlycon" is false.
 +	 *
 +	 * If the user specifies "SPCR" earlycon, then we need to update
 +	 * the console name so that it also says "qdf2400_e44".  Parameter
 +	 * "earlycon" is true.
 +	 *
 +	 * For consistency, if we change the console name, then we do it
 +	 * for everyone, not just earlycon.
 +	 */
 +	if (qdf2400_erratum_44_present(&table->header)) {
 +		qdf2400_e44_present = true;
 +		if (earlycon)
 +			uart = "qdf2400_e44";
 +	}
 +
- 	if (xgene_8250_erratum_present(table))
+ 	if (xgene_8250_erratum_present(table)) {
  		iotype = "mmio32";
  
- 	snprintf(opts, sizeof(opts), "%s,%s,0x%llx,%d", uart, iotype,
- 		 table->serial_port.address, baud_rate);
+ 		/* for xgene v1 and v2 we don't know the clock rate of the
+ 		 * UART so don't attempt to change to the baud rate state
+ 		 * in the table because driver cannot calculate the dividers
+ 		 */
+ 		snprintf(opts, sizeof(opts), "%s,%s,0x%llx", uart, iotype,
+ 			 table->serial_port.address);
+ 	} else {
+ 		snprintf(opts, sizeof(opts), "%s,%s,0x%llx,%d", uart, iotype,
+ 			 table->serial_port.address, baud_rate);
+ 	}
  
  	pr_info("console: %s\n", opts);
  
