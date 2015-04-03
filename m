From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH] earlycon: Fix __earlycon_table stride
Date: Fri,  3 Apr 2015 08:57:51 -0400
Message-ID: <1428065871-17281-1-git-send-email-peter@hurleysoftware.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f171.google.com ([209.85.216.171]:36833 "EHLO
	mail-qc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752590AbbDCM6N (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Apr 2015 08:58:13 -0400
Received: by qcgx3 with SMTP id x3so88640716qcg.3
        for <linux-next@vger.kernel.org>; Fri, 03 Apr 2015 05:58:12 -0700 (PDT)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.cz>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, Peter Hurley <peter@hurleysoftware.com>

The compiler and the linker must agree on the alignment of
struct earlycon_id; empirical testing and commit 07fca0e57fca92
("tracing: Properly align linker defined symbols") suggests
32-byte alignment is the LCD.

Reported-by: Yinghai Lu <yinghai@kernel.org>
Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 include/asm-generic/vmlinux.lds.h | 2 +-
 include/linux/serial_core.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 87e5b6f..561daf4 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -151,7 +151,7 @@
 #endif
 
 #ifdef CONFIG_SERIAL_EARLYCON
-#define EARLYCON_TABLE() . = ALIGN(8);				\
+#define EARLYCON_TABLE() STRUCT_ALIGN();			\
 			 VMLINUX_SYMBOL(__earlycon_table) = .;	\
 			 *(__earlycon_table)			\
 			 *(__earlycon_table_end)
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 34de168..025dad9 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -342,7 +342,7 @@ struct earlycon_device {
 struct earlycon_id {
 	char	name[16];
 	int	(*setup)(struct earlycon_device *, const char *options);
-};
+} __aligned(32);
 
 extern int setup_earlycon(char *buf);
 extern int of_setup_earlycon(unsigned long addr,
-- 
2.3.5
