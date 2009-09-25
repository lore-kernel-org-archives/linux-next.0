From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] input: serio_libps2 depends on serio_i8042
Date: Fri, 25 Sep 2009 15:20:09 -0700
Message-ID: <4ABD4219.5000608@oracle.com>
References: <20090925133830.1ba29584.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753117AbZIYWTs@vger.kernel.org>
In-Reply-To: <20090925133830.1ba29584.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, akpm <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

SERIO_LIBPS2 code uses SERIO_I8042 code, so the former
needs to depend on the latter.

(.text+0x1f33ca): undefined reference to `i8042_check_port_owner'
(.text+0x1f33de): undefined reference to `i8042_unlock_chip'
(.text+0x1f3435): undefined reference to `i8042_check_port_owner'
(.text+0x1f3449): undefined reference to `i8042_lock_chip

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/input/serio/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20090925.orig/drivers/input/serio/Kconfig
+++ linux-next-20090925/drivers/input/serio/Kconfig
@@ -168,6 +168,7 @@ config SERIO_MACEPS2
 
 config SERIO_LIBPS2
 	tristate "PS/2 driver library" if EMBEDDED
+	depends on SERIO_I8042
 	help
 	  Say Y here if you are using a driver for device connected
 	  to a PS/2 port, such as PS/2 mouse or standard AT keyboard.
