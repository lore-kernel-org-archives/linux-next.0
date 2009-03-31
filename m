From: Rusty Russell <rusty@rustcorp.com.au>
Subject: [PATCH] blackfin: allow allow usage of string functions in linux/string.h
Date: Tue, 31 Mar 2009 12:50:28 +1030
Message-ID: <200903311250.28540.rusty@rustcorp.com.au>
References: <8bd0f97a0903301726j536da9aciaf9eb5e9a7afff5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:47564 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754808AbZCaCUg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Mar 2009 22:20:36 -0400
In-Reply-To: <8bd0f97a0903301726j536da9aciaf9eb5e9a7afff5@mail.gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Frysinger <vapier.adi@gmail.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

In introducing a trivial "strstarts()" function in linux/string.h, we
hit the following error on blackfin:

file included from include/linux/bitmap.h:9,
                 from include/linux/nodemask.h:90,
                 from include/linux/mmzone.h:17,
                 from include/linux/gfp.h:5,
                 from include/linux/kmod.h:23,
                 from include/linux/module.h:14,
                 from arch/blackfin/lib/strncmp.c:14:
include/linux/string.h: In function 'strstarts':
include/linux/string.h:124: error: implicit declaration of function 'strncmp'

Because when including asm/string.h from arch/blackfin/lib/strncmp.c,
we don't declare the string op we are about to define, and
linux/string.h barfs.

The fix is to declare the function whose definition we steal via the
#define trick.  I do this for all of them, so this won't bite us in
future.

Reported-by: linux-next
Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
Tested-by: Mike Frysinger <vapier@gentoo.org>
---
 arch/blackfin/lib/strcmp.c  |    1 +
 arch/blackfin/lib/strcpy.c  |    1 +
 arch/blackfin/lib/strncmp.c |    2 ++
 arch/blackfin/lib/strncpy.c |    2 ++
 4 files changed, 6 insertions(+)

diff --git a/arch/blackfin/lib/strcmp.c b/arch/blackfin/lib/strcmp.c
--- a/arch/blackfin/lib/strcmp.c
+++ b/arch/blackfin/lib/strcmp.c
@@ -6,6 +6,7 @@
  * Licensed under the GPL-2 or later.
  */
 
+int strcmp(const char *dest, const char *src);
 #define strcmp __inline_strcmp
 #include <asm/string.h>
 #undef strcmp
diff --git a/arch/blackfin/lib/strcpy.c b/arch/blackfin/lib/strcpy.c
--- a/arch/blackfin/lib/strcpy.c
+++ b/arch/blackfin/lib/strcpy.c
@@ -6,6 +6,7 @@
  * Licensed under the GPL-2 or later.
  */
 
+char *strcpy(char *dest, const char *src);
 #define strcpy __inline_strcpy
 #include <asm/string.h>
 #undef strcpy
diff --git a/arch/blackfin/lib/strncmp.c b/arch/blackfin/lib/strncmp.c
--- a/arch/blackfin/lib/strncmp.c
+++ b/arch/blackfin/lib/strncmp.c
@@ -6,6 +6,8 @@
  * Licensed under the GPL-2 or later.
  */
 
+#include <linux/types.h>
+int strncmp(const char *cs, const char *ct, size_t count);
 #define strncmp __inline_strncmp
 #include <asm/string.h>
 #undef strncmp
diff --git a/arch/blackfin/lib/strncpy.c b/arch/blackfin/lib/strncpy.c
--- a/arch/blackfin/lib/strncpy.c
+++ b/arch/blackfin/lib/strncpy.c
@@ -6,6 +6,8 @@
  * Licensed under the GPL-2 or later.
  */
 
+#include <linux/types.h>
+char *strncpy(char *dest, const char *src, size_t n);
 #define strncpy __inline_strncpy
 #include <asm/string.h>
 #undef strncpy
