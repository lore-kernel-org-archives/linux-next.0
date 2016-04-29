From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Fri, 29 Apr 2016 16:12:48 +1000
Message-ID: <20160429161248.7e17f45b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Matt Fleming <matt@codeblueprint.co.uk>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/efi.h

between commit:

  2c23b73c2d02 ("Ard Biesheuvel <ard.biesheuvel@linaro.org>")

from the tip tree and commit:

  9f2c36a7b097 ("include/linux/efi.h: redefine type, constant, macro from generic code")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/efi.h
index aa36fb8bea4b,5b1d5c5b4080..000000000000
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@@ -21,7 -21,7 +21,8 @@@
  #include <linux/pfn.h>
  #include <linux/pstore.h>
  #include <linux/reboot.h>
 +#include <linux/screen_info.h>
+ #include <linux/uuid.h>
  
  #include <asm/page.h>
  
