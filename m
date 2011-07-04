From: Johannes Stezenbach <js@sig21.net>
Subject: [PATCH] compat_ioctl: fix make headers_check regression
Date: Mon, 4 Jul 2011 12:03:17 +0200
Message-ID: <20110704100316.GA15894@sig21.net>
References: <20110704134842.7ab89126.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110704134842.7ab89126.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

Fix headers_check error introduced by 390192b30057:

include/linux/fd.h:6: included file 'linux/compat.h' is not exported

Signed-off-by: Johannes Stezenbach <js@sig21.net>
---
I used the same style as in linux/usbdevice_fs.h, hope
that's OK.

 include/linux/fd.h |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/include/linux/fd.h b/include/linux/fd.h
index c6a68d0..72202b1 100644
--- a/include/linux/fd.h
+++ b/include/linux/fd.h
@@ -3,7 +3,6 @@
 
 #include <linux/ioctl.h>
 #include <linux/compiler.h>
-#include <linux/compat.h>
 
 /* New file layout: Now the ioctl definitions immediately follow the
  * definitions of the structures that they use */
@@ -378,7 +377,11 @@ struct floppy_raw_cmd {
 #define FDEJECT _IO(2, 0x5a)
 /* eject the disk */
 
+
+#ifdef __KERNEL__
 #ifdef CONFIG_COMPAT
+#include <linux/compat.h>
+
 struct compat_floppy_struct {
 	compat_uint_t	size;
 	compat_uint_t	sect;
@@ -394,5 +397,6 @@ struct compat_floppy_struct {
 
 #define FDGETPRM32 _IOR(2, 0x04, struct compat_floppy_struct)
 #endif
+#endif
 
 #endif
