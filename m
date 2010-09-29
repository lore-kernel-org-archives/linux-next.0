From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (Was:
 linux-next: build warning after merge of the final tree)
Date: Wed, 29 Sep 2010 14:16:57 +1000
Message-ID: <20100929141657.3c076eb7.sfr@canb.auug.org.au>
References: <20100929140238.c987caac.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59316 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750804Ab0I2EQ7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Sep 2010 00:16:59 -0400
In-Reply-To: <20100929140238.c987caac.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Pavel Emelyanov <xemul@parallels.com>

Hi all,

On Wed, 29 Sep 2010 14:02:38 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the final tree, today's linux-next build (powerpc
> ppc44x_defconfig) produced tis warning:
> 
> WARNING: net/sunrpc/sunrpc.o(.init.text+0x110): Section mismatch in reference from the function init_sunrpc() to the function .exit.text:rpcauth_remove_module()
> The function __init init_sunrpc() references
> a function __exit rpcauth_remove_module().
> This is often seen when error handling in the init function
> uses functionality in the exit path.
> The fix is often to remove the __exit annotation of
> rpcauth_remove_module() so it may be used outside an exit section.
> 
> Probably caused by commit 2f72c9b73730c335381b13e2bd221abe1acea394
> ("sunrpc: The per-net skeleton").

This actually causes a build failure on a sparc32 defconfig build:

`rpcauth_remove_module' referenced in section `.init.text' of net/built-in.o: defined in discarded section `.exit.text' of net/built-in.o

I applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 29 Sep 2010 14:07:07 +1000
Subject: [PATCH] sunrpc: fix up section mismatch

Fixes:

`rpcauth_remove_module' referenced in section `.init.text' of net/built-in.o: defined in discarded section `.exit.text' of net/built-in.o

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/sunrpc/auth.h |    4 ++--
 net/sunrpc/auth.c           |    2 +-
 net/sunrpc/auth_generic.c   |    2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/sunrpc/auth.h b/include/linux/sunrpc/auth.h
index 5bbc447..b202475 100644
--- a/include/linux/sunrpc/auth.h
+++ b/include/linux/sunrpc/auth.h
@@ -122,8 +122,8 @@ extern const struct rpc_authops	authnull_ops;
 int __init		rpc_init_authunix(void);
 int __init		rpc_init_generic_auth(void);
 int __init		rpcauth_init_module(void);
-void __exit		rpcauth_remove_module(void);
-void __exit		rpc_destroy_generic_auth(void);
+void			rpcauth_remove_module(void);
+void			rpc_destroy_generic_auth(void);
 void 			rpc_destroy_authunix(void);
 
 struct rpc_cred *	rpc_lookup_cred(void);
diff --git a/net/sunrpc/auth.c b/net/sunrpc/auth.c
index e9eaaf7..2c0d9e6 100644
--- a/net/sunrpc/auth.c
+++ b/net/sunrpc/auth.c
@@ -658,7 +658,7 @@ out1:
 	return err;
 }
 
-void __exit rpcauth_remove_module(void)
+void rpcauth_remove_module(void)
 {
 	rpc_destroy_authunix();
 	rpc_destroy_generic_auth();
diff --git a/net/sunrpc/auth_generic.c b/net/sunrpc/auth_generic.c
index 43162bb..e010a01 100644
--- a/net/sunrpc/auth_generic.c
+++ b/net/sunrpc/auth_generic.c
@@ -158,7 +158,7 @@ int __init rpc_init_generic_auth(void)
 	return rpcauth_init_credcache(&generic_auth);
 }
 
-void __exit rpc_destroy_generic_auth(void)
+void rpc_destroy_generic_auth(void)
 {
 	rpcauth_destroy_credcache(&generic_auth);
 }
-- 
1.7.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
