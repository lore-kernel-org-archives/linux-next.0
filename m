From: Kees Cook <keescook@chromium.org>
Subject: [PATCH] gcc-plugins: disable under COMPILE_TEST
Date: Sat, 11 Jun 2016 09:12:12 -0700
Message-ID: <20160611161212.GA29370@www.outflux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:36116 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752224AbcFKQMQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 11 Jun 2016 12:12:16 -0400
Received: by mail-pa0-f52.google.com with SMTP id b5so32467008pas.3
        for <linux-next@vger.kernel.org>; Sat, 11 Jun 2016 09:12:15 -0700 (PDT)
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Emese Revfy <re.emese@gmail.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Linux-Next <linux-next@vger.kernel.org>, linux-kernel@vger.kernel.org, kernel-hardening@lists.openwall.com

Since adding the gcc plugin development headers is required for the
gcc plugin support, we should ease into this new kernel build dependency
more slowly. For now, disable the gcc plugins under COMPILE_TEST so that
all*config builds will skip it.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/Kconfig      | 1 +
 lib/Kconfig.debug | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 83aa2a3c470d..3f06d678b1d7 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -366,6 +366,7 @@ config HAVE_GCC_PLUGINS
 menuconfig GCC_PLUGINS
 	bool "GCC plugins"
 	depends on HAVE_GCC_PLUGINS
+	depends on !COMPILE_TEST
 	help
 	  GCC plugins are loadable modules that provide extra features to the
 	  compiler. They are useful for runtime instrumentation and static analysis.
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index d40833b9b7f4..0f9981999a27 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -713,8 +713,8 @@ config KCOV
 	bool "Code coverage for fuzzing"
 	depends on ARCH_HAS_KCOV
 	select DEBUG_FS
-	select GCC_PLUGINS
-	select GCC_PLUGIN_SANCOV
+	select GCC_PLUGINS if !COMPILE_TEST
+	select GCC_PLUGIN_SANCOV if !COMPILE_TEST
 	help
 	  KCOV exposes kernel code coverage information in a form suitable
 	  for coverage-guided fuzzing (randomized testing).
-- 
2.7.4


-- 
Kees Cook
Chrome OS & Brillo Security
