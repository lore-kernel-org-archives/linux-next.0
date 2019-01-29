From: mortonm@chromium.org
Subject: [PATCH] LSM: SafeSetID: 'depend' on CONFIG_SECURITY
Date: Tue, 29 Jan 2019 10:54:24 -0800
Message-ID: <20190129185424.251139-1-mortonm@chromium.org>
References: <CAJ-EccMgDvx81g-XgWymdYn_G5Ou8mgbef3GUbx-C_Ai5qF-pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJ-EccMgDvx81g-XgWymdYn_G5Ou8mgbef3GUbx-C_Ai5qF-pQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: rdunlap@infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org
Cc: Micah Morton <mortonm@chromium.org>
List-Id: linux-next.vger.kernel.org

From: Micah Morton <mortonm@chromium.org>

This patch changes the Kconfig file for the SafeSetID LSM to depend on
CONFIG_SECURITY as well as select CONFIG_SECURITYFS, since the policies
for the LSM are configured through writing to securityfs.

Signed-off-by: Micah Morton <mortonm@chromium.org>
---
 security/safesetid/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/security/safesetid/Kconfig b/security/safesetid/Kconfig
index bf89a47ffcc8..4f415c4e3f93 100644
--- a/security/safesetid/Kconfig
+++ b/security/safesetid/Kconfig
@@ -1,5 +1,7 @@
 config SECURITY_SAFESETID
         bool "Gate setid transitions to limit CAP_SET{U/G}ID capabilities"
+        depends on SECURITY
+        select SECURITYFS
         default n
         help
           SafeSetID is an LSM module that gates the setid family of syscalls to
-- 
2.20.1.495.gaa96b0ce6b-goog
