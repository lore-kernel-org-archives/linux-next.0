From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: [PATCH] evm: building without EVM enabled fixes cont
Date: Mon, 15 Aug 2011 09:09:16 -0400
Message-ID: <1313413756-4920-1-git-send-email-zohar@linux.vnet.ibm.com>
Return-path: <linux-security-module-owner@vger.kernel.org>
Sender: linux-security-module-owner@vger.kernel.org
To: linux-security-module@vger.kernel.org
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>, Stephen Rothwell <sfr@canb.auug.org.au>, David Safford <safford@watson.ibm.com>, Mimi Zohar <zohar@us.ibm.com>
List-Id: linux-next.vger.kernel.org

- Make the previously missing security_old_inode_init_security() stub
  function definition static inline.

- The stub security_inode_init_security() function previously returned
  -EOPNOTSUPP and relied on the callers to change it to 0.  The stub
  security/security_old_inode_init_security() functions now return 0.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mimi Zohar <zohar@us.ibm.com>
---
 include/linux/security.h |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/linux/security.h b/include/linux/security.h
index f399cf1..d9f7ec4 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -2045,14 +2045,16 @@ static inline int security_inode_init_security(struct inode *inode,
 						initxattrs initxattrs,
 						void *fs_data)
 {
-	return -EOPNOTSUPP;
+	return 0;
 }
 
-int security_old_inode_init_security(struct inode *inode, struct inode *dir,
-				     const struct qstr *qstr, char **name,
-				     void **value, size_t *len)
+static inline int security_old_inode_init_security(struct inode *inode,
+						   struct inode *dir,
+						   const struct qstr *qstr,
+						   char **name, void **value,
+						   size_t *len)
 {
-	return -EOPNOTSUPP;
+	return 0;
 }
 
 static inline int security_inode_create(struct inode *dir,
-- 
1.7.3.4

