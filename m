From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH next-20130118 2/2] KEYS: MODSIGN: Fix wrong select in MODULE_SIG Kconfig
Date: Sat, 19 Jan 2013 01:54:31 +0100
Message-ID: <1358556871-6651-2-git-send-email-sedat.dilek@gmail.com>
References: <1358556871-6651-1-git-send-email-sedat.dilek@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1358556871-6651-1-git-send-email-sedat.dilek@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sedat Dilek <sedat.dilek@gmail.com>
List-Id: linux-next.vger.kernel.org

There exists no SYSTEM_TRUSTED_KEYS Kconfig option but
SYSTEM_TRUSTED_KEYRING.

Tested against Linux-Next (next-20130118).

Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 init/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index f7e1b32..7191ccf 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1689,7 +1689,7 @@ config MODULE_SRCVERSION_ALL
 config MODULE_SIG
 	bool "Module signature verification"
 	depends on MODULES
-	select SYSTEM_TRUSTED_KEYS
+	select SYSTEM_TRUSTED_KEYRING
 	select KEYS
 	select CRYPTO
 	select ASYMMETRIC_KEY_TYPE
-- 
1.8.1.1
