From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: [PATCH] evm: add Kconfig TCG_TPM dependency
Date: Wed, 17 Aug 2011 18:51:36 -0400
Message-ID: <1313621496-8308-1-git-send-email-zohar@linux.vnet.ibm.com>
Return-path: <linux-security-module-owner@vger.kernel.org>
Sender: linux-security-module-owner@vger.kernel.org
To: linux-security-module@vger.kernel.org
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Morris <jmorris@namei.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <rdunlap@xenotime.net>, David Safford <safford@watson.ibm.com>, Mimi Zohar <zohar@us.ibm.com>
List-Id: linux-next.vger.kernel.org

Although the EVM encrypted-key should be encrypted/decrypted using a
trusted-key, a user-defined key could be used instead. When using a user-
defined key, a TCG_TPM dependency should not be required.  Unfortunately,
the encrypted-key code needs to be refactored a bit in order to remove
this dependency.

This patch adds the TCG_TPM dependency.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>,
	     Randy Dunlap <rdunlap@xenotimenet>
Signed-off-by: Mimi Zohar <zohar@us.ibm.com>
---
 security/integrity/evm/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/security/integrity/evm/Kconfig b/security/integrity/evm/Kconfig
index 444877d..884617d 100644
--- a/security/integrity/evm/Kconfig
+++ b/security/integrity/evm/Kconfig
@@ -1,6 +1,6 @@
 config EVM
 	boolean "EVM support"
-	depends on SECURITY && KEYS
+	depends on SECURITY && KEYS && TCG_TPM
 	select CRYPTO_HMAC
 	select CRYPTO_MD5
 	select CRYPTO_SHA1
-- 
1.7.3.4

