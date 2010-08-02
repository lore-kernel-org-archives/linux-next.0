From: Christoph Fritz <chf.fritz@googlemail.com>
Subject: [BUG -next] in pcmcia: use struct resource for PCMCIA devices,
 part 2
Date: Tue, 03 Aug 2010 01:53:21 +0200
Message-ID: <1280793201.11158.32.camel@lovely.krouter>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:49336 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751464Ab0HBXuX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Aug 2010 19:50:23 -0400
Received: by wyb39 with SMTP id 39so3829216wyb.19
        for <linux-next@vger.kernel.org>; Mon, 02 Aug 2010 16:50:22 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-next@vger.kernel.org

Hi,

 buffer overflow in next-tree's commit 810654b4119fd8c6ce03ffeb4b78f0ff8ffe0559

drivers/pcmcia/ds.c
  555         for (i = 0; i < (MAX_IO_WIN + MAX_WIN); i++) {                                                                             
  556             c->io[i].name = p_dev->devname;                                                                                        

with 'io' only defined to MAX_IO_WIN

drivers/pcmcia/cs_internal.h
  42     struct resource io[MAX_IO_WIN]; /* io ports */                                                                        

non-tested fix:

diff --git a/drivers/pcmcia/cs_internal.h b/drivers/pcmcia/cs_internal.h
index da055dc..d14c6ec 100644
--- a/drivers/pcmcia/cs_internal.h
+++ b/drivers/pcmcia/cs_internal.h
@@ -39,7 +39,7 @@ typedef struct config_t {
 	unsigned char	Status, Pin, Copy, Option, ExtStatus;
 	unsigned int	CardValues;
 
-	struct resource io[MAX_IO_WIN]; /* io ports */
+	struct resource io[MAX_IO_WIN + MAX_WIN]; /* io ports */
 	struct resource mem[MAX_WIN];   /* mem areas */
 
 	struct {
