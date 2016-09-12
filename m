From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the arm64 tree
Date: Mon, 12 Sep 2016 12:54:23 +1000
Message-ID: <20160912125423.636f916a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55742 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932255AbcILCy0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 11 Sep 2016 22:54:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Will Deacon <will.deacon@arm.com>, Tony Luck <tony.luck@intel.com>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  include/linux/jump_label.h

between commit:

  ef0da55a84a3 ("jump_labels: Allow array initialisers")

from the arm64 tree and commit:

  b8fb03785d4d ("locking/static_keys: Provide DECLARE and well as DEFINE macros")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/jump_label.h
index a534c7f15a61,595fb46213fc..000000000000
--- a/include/linux/jump_label.h
+++ b/include/linux/jump_label.h
@@@ -272,16 -273,9 +275,19 @@@ struct static_key_false 
  #define DEFINE_STATIC_KEY_FALSE(name)	\
  	struct static_key_false name = STATIC_KEY_FALSE_INIT
  
+ #define DECLARE_STATIC_KEY_FALSE(name)	\
+ 	extern struct static_key_false name
+ 
 +#define DEFINE_STATIC_KEY_ARRAY_TRUE(name, count)		\
 +	struct static_key_true name[count] = {			\
 +		[0 ... (count) - 1] = STATIC_KEY_TRUE_INIT,	\
 +	}
 +
 +#define DEFINE_STATIC_KEY_ARRAY_FALSE(name, count)		\
 +	struct static_key_false name[count] = {			\
 +		[0 ... (count) - 1] = STATIC_KEY_FALSE_INIT,	\
 +	}
 +
  extern bool ____wrong_branch_error(void);
  
  #define static_key_enabled(x)							\
