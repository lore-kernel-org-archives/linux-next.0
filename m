From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] module.h: add stub for is_module_percpu_address
Date: Tue, 30 Mar 2010 10:31:55 -0700
Message-ID: <4BB2358B.3090800@oracle.com>
References: <20100330191834.f2009292.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:18040 "EHLO
	rcsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751297Ab0C3Rd4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2010 13:33:56 -0400
In-Reply-To: <20100330191834.f2009292.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Tejun Heo <tj@kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Fix build for CONFIG_MODULES not enabled by providing a stub
for is_module_percpu_address().

kernel/lockdep.c:605: error: implicit declaration of function 'is_module_percpu_address'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 include/linux/module.h |    5 +++++
 1 file changed, 5 insertions(+)

--- linux-next-20100330.orig/include/linux/module.h
+++ linux-next-20100330/include/linux/module.h
@@ -567,6 +567,11 @@ static inline bool is_module_address(uns
 	return false;
 }
 
+static inline bool is_module_percpu_address(unsigned long addr)
+{
+	return false;
+}
+
 static inline bool is_module_text_address(unsigned long addr)
 {
 	return false;
