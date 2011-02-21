From: Huang Ying <ying.huang@intel.com>
Subject: Re: linux-next: build failure after merge of the final tree (kvm
 tree related)
Date: Mon, 21 Feb 2011 16:10:27 +0800
Message-ID: <1298275827.13816.3.camel@yhuang-dev>
References: <20110221175658.2dc4d1ac.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:36036 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752609Ab1BUIKa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Feb 2011 03:10:30 -0500
In-Reply-To: <20110221175658.2dc4d1ac.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Avi Kivity <avi@qumranet.com>, Marcelo Tosatti <mtosatti@redhat.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>

Hi, Stephen,

On Mon, 2011-02-21 at 14:56 +0800, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the final tree, today's linux-next build (sparc64 defconfig)
> failed like this:
> 
> mm/memory.c: In function '__get_user_pages':
> mm/memory.c:1584: error: 'EHWPOISON' undeclared (first use in this function)
> 
> Caused by commit b1c4f2836370f5c8207d4c61e91c93bd6a4ce27a ("mm: make
> __get_user_pages return -EHWPOISON for HWPOISON page optionally") from
> the kvm tree.
> 
> Not all architectures use include/asm-generic/errno.h ...

Thanks for reminding.  Does the patch as follow fixes the issue?

Best Regards,
Huang Ying

---
 arch/alpha/include/asm/errno.h  |    2 ++
 arch/mips/include/asm/errno.h   |    2 ++
 arch/parisc/include/asm/errno.h |    2 ++
 arch/sparc/include/asm/errno.h  |    2 ++
 4 files changed, 8 insertions(+)

--- a/arch/parisc/include/asm/errno.h
+++ b/arch/parisc/include/asm/errno.h
@@ -122,4 +122,6 @@
 
 #define	ERFKILL		256	/* Operation not possible due to RF-kill */
 
+#define EHWPOISON	257	/* Memory page has hardware error */
+
 #endif
--- a/arch/sparc/include/asm/errno.h
+++ b/arch/sparc/include/asm/errno.h
@@ -112,4 +112,6 @@
 
 #define	ERFKILL		134	/* Operation not possible due to RF-kill */
 
+#define EHWPOISON	135	/* Memory page has hardware error */
+
 #endif
--- a/arch/alpha/include/asm/errno.h
+++ b/arch/alpha/include/asm/errno.h
@@ -122,4 +122,6 @@
 
 #define	ERFKILL		138	/* Operation not possible due to RF-kill */
 
+#define EHWPOISON	139	/* Memory page has hardware error */
+
 #endif
--- a/arch/mips/include/asm/errno.h
+++ b/arch/mips/include/asm/errno.h
@@ -121,6 +121,8 @@
 
 #define	ERFKILL		167	/* Operation not possible due to RF-kill */
 
+#define EHWPOISON	168	/* Memory page has hardware error */
+
 #define EDQUOT		1133	/* Quota exceeded */
 
 #ifdef __KERNEL__
