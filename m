From: Colin Cross <ccross@android.com>
Subject: [PATCH] android: make persistent_ram based drivers depend on HAVE_MEMBLOCK
Date: Wed, 21 Mar 2012 10:18:33 -0700
Message-ID: <1332350313-2501-1-git-send-email-ccross@android.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, John Stultz <john.stultz@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Android Kernel Team <kernel-team@android.com>, gregkh@linuxfoundation.org, Linus Torvalds <torvalds@linux-foundation.org>, Colin Cross <ccross@android.com>
List-Id: linux-next.vger.kernel.org

m68k doesn't have memblock_reserve, which causes a build failure
with allmodconfig.  Make PERSISTENT_RAM and RAM_CONSOLE depend on
HAVE_MEMBLOCK.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Colin Cross <ccross@android.com>
---
 drivers/staging/android/Kconfig |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

I can't test on m68k, but this disables the options if I remove
HAVE_MEMBLOCK from arm.

diff --git a/drivers/staging/android/Kconfig b/drivers/staging/android/Kconfig
index 08a3b11..eb1dee2 100644
--- a/drivers/staging/android/Kconfig
+++ b/drivers/staging/android/Kconfig
@@ -27,13 +27,14 @@ config ANDROID_LOGGER
 
 config ANDROID_PERSISTENT_RAM
 	bool
+	depends on HAVE_MEMBLOCK
 	select REED_SOLOMON
 	select REED_SOLOMON_ENC8
 	select REED_SOLOMON_DEC8
 
 config ANDROID_RAM_CONSOLE
 	bool "Android RAM buffer console"
-	depends on !S390 && !UML
+	depends on !S390 && !UML && HAVE_MEMBLOCK
 	select ANDROID_PERSISTENT_RAM
 	default n
 
-- 
1.7.7.3
