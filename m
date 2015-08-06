From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the
 char-misc tree
Date: Thu, 6 Aug 2015 16:35:52 +1000
Message-ID: <20150806163552.5eabeba3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:49924 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751072AbbHFGfy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 6 Aug 2015 02:35:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vitaly Kuznetsov <vkuznets@redhat.com>, "dyoung@redhat.com" <dyoung@redhat.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/kexec.h

between commit:

  2b94ed245861 ("kexec: define kexec_in_progress in !CONFIG_KEXEC case")

from the char-misc tree and commit:

  3d86985f695b ("kexec: split kexec_load syscall from kexec core code")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/kexec.h
index b63218f68c4b,5f193d80a6fb..000000000000
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@@ -323,8 -325,7 +325,8 @@@ struct pt_regs
  struct task_struct;
  static inline void crash_kexec(struct pt_regs *regs) { }
  static inline int kexec_should_crash(struct task_struct *p) { return 0; }
 +#define kexec_in_progress false
- #endif /* CONFIG_KEXEC */
+ #endif /* CONFIG_KEXEC_CORE */
  
  #endif /* !defined(__ASSEBMLY__) */
  
