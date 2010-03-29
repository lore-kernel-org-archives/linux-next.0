From: Tejun Heo <tj@kernel.org>
Subject: [PATCH 13/17] hid: update gfp/slab.h includes
Date: Tue, 30 Mar 2010 02:52:41 +0900
Message-ID: <1269885165-18617-14-git-send-email-tj@kernel.org>
References: <1269885165-18617-1-git-send-email-tj@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1269885165-18617-1-git-send-email-tj@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Jiri Kosina <jkosina@suse.cz>
List-Id: linux-next.vger.kernel.org

Implicit slab.h inclusion via percpu.h is about to go away.  Make sure
gfp.h or slab.h is included as necessary.

Signed-off-by: Tejun Heo <tj@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jkosina@suse.cz>
---
 drivers/hid/hid-roccat-kone.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/hid/hid-roccat-kone.c b/drivers/hid/hid-roccat-kone.c
index 2b1412e..7b11784 100644
--- a/drivers/hid/hid-roccat-kone.c
+++ b/drivers/hid/hid-roccat-kone.c
@@ -35,6 +35,7 @@
 #include <linux/hid.h>
 #include <linux/usb.h>
 #include <linux/module.h>
+#include <linux/slab.h>
 #include "hid-ids.h"
 #include "hid-roccat-kone.h"
 
-- 
1.6.4.2
