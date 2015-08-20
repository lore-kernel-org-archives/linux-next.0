From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the s390 tree
Date: Thu, 20 Aug 2015 15:32:38 +1000
Message-ID: <20150820153238.673130bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59117 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750880AbbHTFck (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Aug 2015 01:32:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/s390/lib/uaccess.c

between commit:

  cabc4abe8e36 ("s390/uaccess: remove uaccess_primary kernel parameter")

from the s390 tree and commit:

  ed79e946732e ("s390/uaccess, locking/static_keys: employ static_branch_likely()")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/s390/lib/uaccess.c
index 0d002a746bec,93cb1d09493d..000000000000
--- a/arch/s390/lib/uaccess.c
+++ b/arch/s390/lib/uaccess.c
@@@ -370,10 -370,23 +370,10 @@@ long __strncpy_from_user(char *dst, con
  }
  EXPORT_SYMBOL(__strncpy_from_user);
  
 -/*
 - * The "old" uaccess variant without mvcos can be enforced with the
 - * uaccess_primary kernel parameter. This is mainly for debugging purposes.
 - */
 -static int uaccess_primary __initdata;
 -
 -static int __init parse_uaccess_pt(char *__unused)
 -{
 -	uaccess_primary = 1;
 -	return 0;
 -}
 -early_param("uaccess_primary", parse_uaccess_pt);
 -
  static int __init uaccess_init(void)
  {
 -	if (!uaccess_primary && test_facility(27))
 +	if (test_facility(27))
- 		static_key_slow_inc(&have_mvcos);
+ 		static_branch_enable(&have_mvcos);
  	return 0;
  }
  early_initcall(uaccess_init);
