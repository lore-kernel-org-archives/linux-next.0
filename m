From: Michael Neuling <mikey@neuling.org>
Subject: [PATCH] serial: fix Kconfig for Freescale 16550
Date: Tue, 13 Dec 2011 11:31:03 +1100
Message-ID: <7963.1323736263@neuling.org>
Mime-Version: 1.0
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:44992 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753472Ab1LMAbF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 12 Dec 2011 19:31:05 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Alan Cox <alan@linux.intel.com>, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Michal Marek <mmarek@suse.cz>

next-20111212 breaks with linking a pmac32_defconfig with:
  drivers/built-in.o: In function `fsl8250_handle_irq':
  (.text+0x7ba74): undefined reference to `serial8250_modem_status'
  drivers/built-in.o: In function `fsl8250_handle_irq':
  (.text+0x7baa4): undefined reference to `serial8250_tx_chars'
  drivers/built-in.o: In function `fsl8250_handle_irq':
  (.text+0x7bab4): undefined reference to `serial8250_rx_chars'

Caused by:
  9deaa53 serial: add irq handler for Freescale 16550 errata.

pmac32_defconfig results in SERIAL_8250_FSL=y but SERIAL_8250=m so
8250_fsl.c doesn't link properly.  

This explicitly makes SERIAL_8250_FSL depends on SERIAL_8250=y. 

Signed-off-by: Michael Neuling <mikey@neuling.org>
---
I'm not sure this is the right fix as it seems like a Kconfig bug.  

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index a1d55c3..c9046de 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -99,7 +99,7 @@ config SERIAL_8250_PNP
 
 config SERIAL_8250_FSL
 	bool
-	depends on SERIAL_8250 && PPC
+	depends on SERIAL_8250=y && PPC
 	default PPC
 
 config SERIAL_8250_HP300
