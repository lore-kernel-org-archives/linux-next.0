From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 02/17] kdb: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:30 +0900
Message-ID: <1269885165-18617-3-git-send-email-tj@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:57021 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754908Ab0C2Rw4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Mar 2010 13:52:56 -0400
In-Reply-To: <1269885165-18617-1-git-send-email-tj@kernel.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Jason Wessel <jason.wessel@windriver.com>

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason Wessel <jason.wessel@windriver.com>
---
 kernel/debug/kdb/kdb_main.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index bad8e63..ec29a9d 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -37,6 +37,7 @@
 #include <linux/kdebug.h>
 #include <linux/proc_fs.h>
 #include <linux/uaccess.h>
+#include <linux/slab.h>
 #include "kdb_private.h"
 
 #define GREP_LEN 256
-- 
1.6.4.2
