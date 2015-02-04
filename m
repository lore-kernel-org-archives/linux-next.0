From: Andrey Ryabinin <a.ryabinin@samsung.com>
Subject: [PATCH] kasan: fix build warnings
Date: Wed, 04 Feb 2015 14:43:51 +0300
Message-ID: <1423050231-1701-1-git-send-email-a.ryabinin@samsung.com>
References: <20150204185328.1ee3ce3c@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:14202 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965027AbbBDLoA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Feb 2015 06:44:00 -0500
In-reply-to: <20150204185328.1ee3ce3c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrey Ryabinin <a.ryabinin@samsung.com>

Some versions of gcc produce warning instead of error when
-fsanitize flag uses unsupported argument:
	https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61065

This breaks our detection of whether -fsanitize=kernel-address
is supported by compiler or not. Thus we have tons of build
warnings like this:
	x86_64-linux-gcc: warning: unrecognized argument to -fsanitize= option: 'kernel-address'

Passing -Werror into $(call cc-option) will fix this problem
as gcc will error out now.

Signed-off-by: Andrey Ryabinin <a.ryabinin@samsung.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---

Hi Andrew, this patch applies on top kasan patch set.
We can't just fix add-kernel-address-sanitizer-infrastructure.patch
as patch  kasan-enable-instrumentation-of-global-variables.patch
depends on it.

Let me know if your prefer to update all needed patches instead
of this fix.

 scripts/Makefile.kasan | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index df302f8..72a40bb 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -5,15 +5,14 @@ else
 	call_threshold := 0
 endif
 
-CFLAGS_KASAN_MINIMAL := $(call cc-option, -fsanitize=kernel-address \
-				--param asan-globals=1)
+CFLAGS_KASAN_MINIMAL := -fsanitize=kernel-address --param asan-globals=1
 
 CFLAGS_KASAN := $(call cc-option, -fsanitize=kernel-address \
 		-fasan-shadow-offset=$(CONFIG_KASAN_SHADOW_OFFSET) \
 		--param asan-stack=1 --param asan-globals=1 \
 		--param asan-instrumentation-with-call-threshold=$(call_threshold))
 
-ifeq ($(CFLAGS_KASAN_MINIMAL),)
+ifeq ($(call cc-option, $(CFLAGS_KASAN_MINIMAL) -Werror),)
         $(warning Cannot use CONFIG_KASAN: \
             -fsanitize=kernel-address is not supported by compiler)
 else
-- 
2.2.2
