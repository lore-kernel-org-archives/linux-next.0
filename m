From: Lee Schermerhorn <Lee.Schermerhorn@hp.com>
Subject: [BUG?] linux-next/mmotm:  boot hang on HP ia64 servers
Date: Mon, 06 Apr 2009 13:55:42 -0400
Message-ID: <1239040542.14812.210.camel@lts-notebook>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g5t0006.atlanta.hp.com ([15.192.0.43]:5808 "EHLO
	g5t0006.atlanta.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752172AbZDFRzs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 6 Apr 2009 13:55:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Clark Williams <williams@redhat.com>
Cc: linux-next@vger.kernel.org, Bob Picco <bob.picco@hp.com>, Bjorn Helgaas <bjorn.helgaas@hp.com>

Apparently caused by:  commit c5b01e769cee440772d6a8cd1c71c0acf37451fc
-- "disallow SERIAL_8250_PNP with SERIAL_8250_CONSOLE".

I haven't been able to boot the mmotm tree on one of my test servers for
weeks now, but have been too busy with other things to investigate.  On
these servers, this serial line connects the main server to the
"management processor" which is accessed via the network.  The console
shows up as ttyS0 in the booted kernel.

Symptom of the hang was this message on the console:

	turn off boot console uart8250

and then nothing.  I don't recall seeing that message on any kernel that
booted successfully.  But I tend to boot with "debug" and have lots of
hardware to report, so it might have gotten lost.

I thought maybe the system would continue to come up "blind" [or should
that be "mute"?], but seems it never did.  I also hoped that the problem
would "go away" in later mmotms but, again, no luck :).

Finally got a change to look in detail at linux-next in mmotm 03/23 [and
04/05], and noticed the commit above.  Comparing configs for kernels
that booted [!mmotm] and those that did, I saw that
"CONFIG_SERIAL_8250_PNP=y" was missing from the ones that don't boot.

Today, I reverted this patch from the latest [04/05] mmotm, added back
that config line and it now boots.

The patch description indicates "hard to fix issues" when both
SERIAL_8250_CONSOLE and SERIAL_8250_PNP are both set.  However, we can't
seem to boot with out both.

For what it's worth, I've included the patch that reverts the
[problematic portion of the] commit.

Regards,
Lee

P.S.,  Bjorn says "I told you so" :)

==============================

HP sxX000 ia64 servers hang during boot unless SERIAL_8250_PNP is configured.

This patch reverts the patch that prevents both SERIAL_8250_CONSOLE and 
SERIAL_8250_PNP from being configured at the same time.  Not sure this is the
right thing to do.

Signed-off-by: Lee Schermerhorn <lee.schermerhorn@hp.com>

 drivers/serial/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6.29-mmotm-090405-2145/drivers/serial/Kconfig
===================================================================
--- linux-2.6.29-mmotm-090405-2145.orig/drivers/serial/Kconfig	2009-04-06 13:09:54.000000000 -0400
+++ linux-2.6.29-mmotm-090405-2145/drivers/serial/Kconfig	2009-04-06 13:09:55.000000000 -0400
@@ -91,7 +91,7 @@ config SERIAL_8250_PCI
 
 config SERIAL_8250_PNP
 	tristate "8250/16550 PNP device support" if EMBEDDED
-	depends on SERIAL_8250 && PNP && ! SERIAL_8250_CONSOLE
+	depends on SERIAL_8250 && PNP
 	default SERIAL_8250
 	help
 	  This builds standard PNP serial support. You may be able to
