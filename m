From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the kspp
 tree
Date: Fri, 17 Feb 2017 15:53:21 +1100
Message-ID: <20170217155321.4df9c41a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47447 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754965AbdBQExY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Feb 2017 23:53:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jinbum Park <jinb.park7@gmail.com>, Laura Abbott <labbott@redhat.com>

Hi all,

Today's linux-next merge of the akpm-current tree got conflicts in:

  arch/x86/Kconfig.debug
  arch/x86/kernel/Makefile

between commits:

  ad21fc4faa2a ("arch: Move CONFIG_DEBUG_RODATA and CONFIG_SET_MODULE_RONX to be common")
  3ad38ceb2769 ("x86/mm: Remove CONFIG_DEBUG_NX_TEST")

from the kspp tree and commit:

  ae4aea38de49 ("mm: add arch-independent testcases for RODATA")

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

diff --cc arch/x86/Kconfig.debug
index c4cba00dbdee,3fa469c82707..000000000000
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
diff --cc arch/x86/kernel/Makefile
index bdcdb3b3a219,f6caf829085a..000000000000
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@@ -100,7 -100,7 +100,6 @@@ obj-$(CONFIG_HPET_TIMER) 	+= hpet.
  obj-$(CONFIG_APB_TIMER)		+= apb_timer.o
  
  obj-$(CONFIG_AMD_NB)		+= amd_nb.o
- obj-$(CONFIG_DEBUG_RODATA_TEST)	+= test_rodata.o
 -obj-$(CONFIG_DEBUG_NX_TEST)	+= test_nx.o
  obj-$(CONFIG_DEBUG_NMI_SELFTEST) += nmi_selftest.o
  
  obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvmclock.o
