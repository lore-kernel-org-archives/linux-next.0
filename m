From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -next] net: fix test_bpf build to depend on NET
Date: Tue, 13 May 2014 09:58:44 -0700
Message-ID: <53724F44.2010608@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:57951 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751991AbaEMQ6q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 13 May 2014 12:58:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, David Miller <davem@davemloft.net>

From: Randy Dunlap <rdunlap@infradead.org>

Fix build when CONFIG_NET is not enabled.
Fixes these build errors:

WARNING: "sk_unattached_filter_destroy" [lib/test_bpf.ko] undefined!
WARNING: "kfree_skb" [lib/test_bpf.ko] undefined!
WARNING: "sk_unattached_filter_create" [lib/test_bpf.ko] undefined!
WARNING: "sk_run_filter_int_skb" [lib/test_bpf.ko] undefined!
WARNING: "__alloc_skb" [lib/test_bpf.ko] undefined!

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 lib/Kconfig.debug |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20140513.orig/lib/Kconfig.debug
+++ linux-next-20140513/lib/Kconfig.debug
@@ -1639,7 +1639,7 @@ config TEST_USER_COPY
 config TEST_BPF
 	tristate "Test BPF filter functionality"
 	default n
-	depends on m
+	depends on m && NET
 	help
 	  This builds the "test_bpf" module that runs various test vectors
 	  against the BPF interpreter or BPF JIT compiler depending on the
