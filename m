From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH] regmap: fix compilation when !CONFIG_DEBUG_FS
Date: Thu,  5 Apr 2012 23:09:20 -0600
Message-ID: <1333688960-24402-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-kernel@vger.kernel.org, paul.gortmaker@windriver.com, linux-next@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-next.vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

Commit 79c64d5 "regmap: allow regmap instances to be named" changed the
prototype of regmap_debugfs_init, but didn't update the dummy inline used
when !CONFIG_DEBUGFS. Fix this.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 drivers/base/regmap/internal.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
index 9bc1d27..99b28ff 100644
--- a/drivers/base/regmap/internal.h
+++ b/drivers/base/regmap/internal.h
@@ -116,7 +116,7 @@ extern void regmap_debugfs_init(struct regmap *map, const char *name);
 extern void regmap_debugfs_exit(struct regmap *map);
 #else
 static inline void regmap_debugfs_initcall(void) { }
-static inline void regmap_debugfs_init(struct regmap *map) { }
+static inline void regmap_debugfs_init(struct regmap *map, const char *name) { }
 static inline void regmap_debugfs_exit(struct regmap *map) { }
 #endif
 
-- 
1.7.5.4
