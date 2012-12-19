From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH -next] f2fs: add missing #include <linux/prefetch.h>
Date: Wed, 19 Dec 2012 22:19:30 +0100
Message-ID: <1355951970-19720-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gerard.telenet-ops.be ([195.130.132.48]:40982 "EHLO
	gerard.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750736Ab2LSVTr (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Dec 2012 16:19:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaegeuk Kim <jaegeuk.kim@samsung.com>
Cc: linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

m68k allmodconfig:

fs/f2fs/data.c: In function =E2=80=98read_end_io=E2=80=99:
fs/f2fs/data.c:311: error: implicit declaration of function =E2=80=98pr=
efetchw=E2=80=99

fs/f2fs/segment.c: In function =E2=80=98f2fs_end_io_write=E2=80=99:
fs/f2fs/segment.c:628: error: implicit declaration of function =E2=80=98=
prefetchw=E2=80=99

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
http://kisskb.ellerman.id.au/kisskb/buildresult/7787109/

 fs/f2fs/data.c    |    1 +
 fs/f2fs/segment.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 655aeab..3aa5ce7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -16,6 +16,7 @@
 #include <linux/backing-dev.h>
 #include <linux/blkdev.h>
 #include <linux/bio.h>
+#include <linux/prefetch.h>
=20
 #include "f2fs.h"
 #include "node.h"
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8bc1b6f..ca7b5ff 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -12,6 +12,7 @@
 #include <linux/f2fs_fs.h>
 #include <linux/bio.h>
 #include <linux/blkdev.h>
+#include <linux/prefetch.h>
 #include <linux/vmalloc.h>
=20
 #include "f2fs.h"
--=20
1.7.0.4
