From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: linux-next: manual merge of the crypto tree with the kbuild tree
Date: Tue, 11 Apr 2017 17:22:18 +0800
Message-ID: <20170411092218.GA11771@gondor.apana.org.au>
References: <20170411102119.102f4675@canb.auug.org.au>
 <20170411024215.GA10664@gondor.apana.org.au>
 <20170411150250.49996951@canb.auug.org.au>
 <CAK7LNAQgXTZ2We3KXb1OuUDWUP=RmMfVAVGLBZ3xVqKhZH_Y4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAK7LNAQgXTZ2We3KXb1OuUDWUP=RmMfVAVGLBZ3xVqKhZH_Y4w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 11, 2017 at 04:51:08PM +0900, Masahiro Yamada wrote:
> 
> But, today's one is hard:
> https://lkml.org/lkml/2017/4/10/1208
> 
> As Herbert suggested, the easiest way is to revert
> c394d1683, but reverting it will cause an error in Kbuild tree:
> .../linux/cryptouser.h:58:16: error: ‘CRYPTO_MAX_ALG_NAME’ undeclared
> here (not in a function)
> 
> 
> So, I will rebase the linux-kbuild/uapi branch onto Linus's tree
> (resolving all conflicts) after crypto changes are pulled
> during the next merge window.
> 
> Then, I will send the kbuild/uapi pull request so that Linus can pull
> it with no (less) conflicts.
> 
> The commit c394d1683 will effectively be dropped.
> 
> I think this is the cleanest way to fix the issue.

Another solution is to adopt the same cryptouser change in the
kbuild tree, something like this:

diff --git a/include/linux/crypto.h b/include/linux/crypto.h
index cc2425b..c0b0cf3 100644
--- a/include/linux/crypto.h
+++ b/include/linux/crypto.h
@@ -24,7 +24,6 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/uaccess.h>
-#include <uapi/linux/crypto.h>
 
 /*
  * Autoloaded crypto modules should only use a prefixed name to avoid allowing
@@ -124,6 +123,7 @@
 /*
  * Miscellaneous stuff.
  */
+#define CRYPTO_MAX_ALG_NAME		64
 
 /*
  * The macro CRYPTO_MINALIGN_ATTR (along with the void * type in the actual
diff --git a/include/uapi/linux/crypto.h b/include/uapi/linux/crypto.h
deleted file mode 100644
index e342c5a..0000000
--- a/include/uapi/linux/crypto.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/*
- * Copyright (c) 2017 Nicolas Dichtel <nicolas.dichtel@6wind.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2
- * as published by the Free Software Foundation.
- */
-
-#ifndef _UAPI_CRYPTO_H
-#define _UAPI_CRYPTO_H
-
-#define CRYPTO_MAX_ALG_NAME		64
-
-#endif /* _UAPI_CRYPTO_H */
diff --git a/include/uapi/linux/cryptouser.h b/include/uapi/linux/cryptouser.h
index 751e7da..d041fbb 100644
--- a/include/uapi/linux/cryptouser.h
+++ b/include/uapi/linux/cryptouser.h
@@ -21,7 +21,6 @@
 #ifndef _UAPI_CRYPTOUSER_H
 #define _UAPI_CRYPTOUSER_H
 
-#include <linux/crypto.h>
 #include <linux/types.h>
 
 /* Netlink configuration messages.  */
@@ -37,7 +36,7 @@ enum {
 #define CRYPTO_MSG_MAX (__CRYPTO_MSG_MAX - 1)
 #define CRYPTO_NR_MSGTYPES (CRYPTO_MSG_MAX + 1 - CRYPTO_MSG_BASE)
 
-#define CRYPTO_MAX_NAME CRYPTO_MAX_ALG_NAME
+#define CRYPTO_MAX_NAME 64
 
 /* Netlink message attributes.  */
 enum crypto_attr_type_t {
@@ -59,9 +58,9 @@ enum crypto_attr_type_t {
 };
 
 struct crypto_user_alg {
-	char cru_name[CRYPTO_MAX_ALG_NAME];
-	char cru_driver_name[CRYPTO_MAX_ALG_NAME];
-	char cru_module_name[CRYPTO_MAX_ALG_NAME];
+	char cru_name[CRYPTO_MAX_NAME];
+	char cru_driver_name[CRYPTO_MAX_NAME];
+	char cru_module_name[CRYPTO_MAX_NAME];
 	__u32 cru_type;
 	__u32 cru_mask;
 	__u32 cru_refcnt;
@@ -79,7 +78,7 @@ struct crypto_report_hash {
 };
 
 struct crypto_report_cipher {
-	char type[CRYPTO_MAX_ALG_NAME];
+	char type[CRYPTO_MAX_NAME];
 	unsigned int blocksize;
 	unsigned int min_keysize;
 	unsigned int max_keysize;
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
