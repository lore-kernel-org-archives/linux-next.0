From: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>
Subject: [RFC] alpha: use asm-generic/io.h
Date: Fri, 31 Jul 2015 17:38:29 -0700
Message-ID: <1438389509-16908-1-git-send-email-mcgrof@do-not-panic.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:35794 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751891AbbHAAih (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 31 Jul 2015 20:38:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rth@twiddle.net
Cc: ink@jurassic.park.msu.ru, mattst88@gmail.com, will.deacon@arm.com, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, paul.gortmaker@windriver.com, mingo@kernel.org, linux-next@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@suse.com>

From: "Luis R. Rodriguez" <mcgrof@suse.com>

Since alpha does not include asm-generic/io.h it would mean
alpha folks have to always carefully monitor asm-generic patches
and before they get merged make sure their own arch implementation
solution gets added. By using asm-generic/io.h alpha gets sensible
defaults, in this case ioremap_uc() would be one example, where
by default it would return NULL, so not implemented. When alpha
folks get a chance then they can add the appropriate
implementation.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
Signed-off-by: Luis R. Rodriguez <mcgrof@suse.com>
---

The easy solution *for now* is to just do:

#define ioremap_uc ioremap_nocache

*But* that would have to be done for any other asm-generic/io.h collateral
evolution, this on the other hand, would get it right for alpha from the
get-go -- so I ask -- can this please be tested and if it is OK then consider
it be merged?

If we can't add asm-generic/io.h then the above define replacement would
be the way to go.

 arch/alpha/include/asm/io.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
index f05bdb4b1cb9..16a5bda42750 100644
--- a/arch/alpha/include/asm/io.h
+++ b/arch/alpha/include/asm/io.h
@@ -581,4 +581,6 @@ extern void outsl (unsigned long port, const void *src, unsigned long count);
 
 #endif /* __KERNEL__ */
 
+#include <asm-generic/io.h>
+
 #endif /* __ALPHA_IO_H */
-- 
2.3.2.209.gd67f9d5.dirty
