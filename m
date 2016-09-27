From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the percpu tree with the asm-generic
 tree
Date: Tue, 27 Sep 2016 13:54:34 +1000
Message-ID: <20160927135434.0040b41c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58741 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754339AbcI0Dyh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 26 Sep 2016 23:54:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chunyan Zhang <zhang.chunyan@linaro.org>, Nicholas Piggin <npiggin@gmail.com>

Hi all,

Today's linux-next merge of the percpu tree got a conflict in:

  include/asm-generic/percpu.h

between commit:

  acbdf0e98066 ("percpu: make this_cpu_generic_read notrace")

from the asm-generic tree and commit:

  1b5ca1212742 ("percpu: improve generic percpu modify-return implementation")

from the percpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/asm-generic/percpu.h
index 70fefec69e61,40e887068da2..000000000000
--- a/include/asm-generic/percpu.h
+++ b/include/asm-generic/percpu.h
@@@ -108,9 -118,9 +118,9 @@@ do {									
  #define this_cpu_generic_read(pcp)					\
  ({									\
  	typeof(pcp) __ret;						\
 -	preempt_disable();						\
 +	preempt_disable_notrace();					\
- 	__ret = *this_cpu_ptr(&(pcp));					\
+ 	__ret = raw_cpu_generic_read(pcp);				\
 -	preempt_enable();						\
 +	preempt_enable_notrace();					\
  	__ret;								\
  })
  
