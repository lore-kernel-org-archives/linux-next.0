From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: [PATCH] Staging: pohmelfs: should include fs_struct.h
Date: Thu, 2 Apr 2009 15:37:10 +0400
Message-ID: <a4423d670904020437q446f7c62xa209822f10573c28@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f165.google.com ([209.85.219.165]:41345 "EHLO
	mail-ew0-f165.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755162AbZDBLhN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 2 Apr 2009 07:37:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Evgeniy Polyakov <zbr@ioremap.net>, Greg Kroah-Hartman <gregkh@suse.de>, LKML <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

drivers/staging/pohmelfs/path_entry.c: In function
'pohmelfs_construct_path_string':
drivers/staging/pohmelfs/path_entry.c:48: error: dereferencing pointer
to incomplete type
drivers/staging/pohmelfs/path_entry.c:49: error: dereferencing pointer
to incomplete type
drivers/staging/pohmelfs/path_entry.c:50: error: dereferencing pointer
to incomplete type
drivers/staging/pohmelfs/path_entry.c: In function 'pohmelfs_path_length':
drivers/staging/pohmelfs/path_entry.c:95: error: dereferencing pointer
to incomplete type
drivers/staging/pohmelfs/path_entry.c:96: error: dereferencing pointer
to incomplete type
drivers/staging/pohmelfs/path_entry.c:97: error: dereferencing pointer
to incomplete type

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

 drivers/staging/pohmelfs/path_entry.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/pohmelfs/path_entry.c
b/drivers/staging/pohmelfs/path_entry.c
index 9270e54..3bad888 100644
--- a/drivers/staging/pohmelfs/path_entry.c
+++ b/drivers/staging/pohmelfs/path_entry.c
@@ -17,7 +17,7 @@
 #include <linux/slab.h>
 #include <linux/fs.h>
 #include <linux/ktime.h>
-#include <linux/fs.h>
+#include <linux/fs_struct.h>
 #include <linux/pagemap.h>
 #include <linux/writeback.h>
 #include <linux/mount.h>
