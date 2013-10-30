From: Joe Perches <joe@perches.com>
Subject: Re: [RFC PATCH -next] Fix printk_once build errors due to
 __read_mostly
Date: Wed, 30 Oct 2013 10:02:02 -0700
Message-ID: <1383152522.9435.29.camel@joe-AO722>
References: <1383128301-20231-1-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtprelay0151.hostedemail.com ([216.40.44.151]:35964 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751330Ab3J3RCG (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 30 Oct 2013 13:02:06 -0400
In-Reply-To: <1383128301-20231-1-git-send-email-james.hogan@imgtec.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, linux-metag@vger.kernel.org

On Wed, 2013-10-30 at 10:18 +0000, James Hogan wrote:
> Commit 3e39c1ab04ba (printk: mark printk_once test variable
> __read_mostly) added __read_mostly to the __print_once bool in the
> printk_once() macro, but __read_mostly is defined in <linux/cache.h>
> which isn't included from <linux/printk.h>. This results in build errors
> like this:
> 
> arch/metag/mm/l2cache.c: In function 'meta_l2c_setup':
> arch/metag/mm/l2cache.c:56: error: '__read_mostly' undeclared
> 
> This is fixed by adding an include of <linux/cache.h> from
> <linux/printk.h> since I don't think printk_once() users should need to
> include <linux/cache.h> for it to work.
> 
> Note that this actually adds a recursive include, since <linux/cache.h>
> includes <linux/kernel.h>, which includes <linux/printk.h>. The actual
> dependencies are all in macros so it doesn't actually seem to result in
> any build failures, but it's clearly less than ideal.
[]
> I'm not too keen on this due to the recursive include. Is it better to
> just workaround the problem by including <linux/cache.h> from the .c
> file that fails to build, or should the original patch be removed
> instead?

Maybe also using this would help avoid some of the
circular dependency:
---
 include/linux/cache.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/cache.h b/include/linux/cache.h
index 4c57065..17e7e82 100644
--- a/include/linux/cache.h
+++ b/include/linux/cache.h
@@ -1,11 +1,11 @@
 #ifndef __LINUX_CACHE_H
 #define __LINUX_CACHE_H
 
-#include <linux/kernel.h>
+#include <uapi/linux/kernel.h>
 #include <asm/cache.h>
 
 #ifndef L1_CACHE_ALIGN
-#define L1_CACHE_ALIGN(x) ALIGN(x, L1_CACHE_BYTES)
+#define L1_CACHE_ALIGN(x) __ALIGN_KERNEL(x, L1_CACHE_BYTES)
 #endif
 
 #ifndef SMP_CACHE_BYTES
