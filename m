From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH -next] staging: lustre: Use proper constant types for L*_POISON values
Date: Fri, 23 Aug 2013 17:46:48 +0200
Message-ID: <1377272808-21686-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from juliette.telenet-ops.be ([195.130.137.74]:35180 "EHLO
	juliette.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753699Ab3HWPrH (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Aug 2013 11:47:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

On 32-bit m68k, I get lots of warnings like:

    warning: integer constant is too large for =E2=80=98long=E2=80=99 t=
ype

Switch the L*_POISON definitions from too-large constants and casts
to the proper constant types to fix this.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
The values in drivers/staging/lustre/lustre/include/linux/lustre_lib.h
don't seem to be used, as LP_POISON is already defined at that point?

 .../lustre/include/linux/libcfs/linux/kp30.h       |   10 +++++++---
 .../lustre/lustre/include/linux/lustre_lib.h       |   10 ++++------
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/lustre/include/linux/libcfs/linux/kp30.h b=
/drivers/staging/lustre/include/linux/libcfs/linux/kp30.h
index 073f4d1..c204b67 100644
--- a/drivers/staging/lustre/include/linux/libcfs/linux/kp30.h
+++ b/drivers/staging/lustre/include/linux/libcfs/linux/kp30.h
@@ -187,9 +187,13 @@ extern int  lwt_snapshot (cfs_cycles_t *now, int *=
ncpu, int *total_size,
 # endif
 #endif
=20
-# define LI_POISON ((int)0x5a5a5a5a5a5a5a5a)
-# define LL_POISON ((long)0x5a5a5a5a5a5a5a5a)
-# define LP_POISON ((void *)(long)0x5a5a5a5a5a5a5a5a)
+# define LI_POISON 0x5a5a5a5a
+#if BITS_PER_LONG > 32
+# define LL_POISON 0x5a5a5a5a5a5a5a5aL
+#else
+# define LL_POISON 0x5a5a5a5aL
+#endif
+# define LP_POISON ((void *)LL_POISON)
=20
 /* this is a bit chunky */
=20
diff --git a/drivers/staging/lustre/lustre/include/linux/lustre_lib.h b=
/drivers/staging/lustre/lustre/include/linux/lustre_lib.h
index b2f755a..57f3b01 100644
--- a/drivers/staging/lustre/lustre/include/linux/lustre_lib.h
+++ b/drivers/staging/lustre/lustre/include/linux/lustre_lib.h
@@ -53,15 +53,13 @@
 # include <linux/lustre_common.h>
=20
 #ifndef LP_POISON
+# define LI_POISON 0x5a5a5a5a
 #if BITS_PER_LONG > 32
-# define LI_POISON ((int)0x5a5a5a5a5a5a5a5a)
-# define LL_POISON ((long)0x5a5a5a5a5a5a5a5a)
-# define LP_POISON ((void *)(long)0x5a5a5a5a5a5a5a5a)
+# define LL_POISON 0x5a5a5a5a5a5a5a5aL
 #else
-# define LI_POISON ((int)0x5a5a5a5a)
-# define LL_POISON ((long)0x5a5a5a5a)
-# define LP_POISON ((void *)(long)0x5a5a5a5a)
+# define LL_POISON 0x5a5a5a5aL
 #endif
+# define LP_POISON ((void *)LL_POISON)
 #endif
=20
 /* This macro is only for compatibility reasons with older Linux Lustr=
e user
--=20
1.7.9.5
