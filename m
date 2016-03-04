From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the powerpc tree
Date: Fri, 4 Mar 2016 15:30:26 +1100
Message-ID: <20160304153026.76c2732b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50133 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755748AbcCDEa3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Mar 2016 23:30:29 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Paul Mackerras <paulus@samba.org>

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/powerpc/kvm/book3s_64_vio_hv.c

between commit:

  f64e8084c94b ("powerpc/mm: Move hash related mmu-*.h headers to book3s/")

from the powerpc tree and commit:

  d3695aa4f452 ("KVM: PPC: Add support for multiple-TCE hcalls")

from the kvm tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/kvm/book3s_64_vio_hv.c
index 039028d3ccb5,44be73e6aa26..000000000000
--- a/arch/powerpc/kvm/book3s_64_vio_hv.c
+++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
@@@ -29,7 -30,8 +30,8 @@@
  #include <asm/tlbflush.h>
  #include <asm/kvm_ppc.h>
  #include <asm/kvm_book3s.h>
 -#include <asm/mmu-hash64.h>
 +#include <asm/book3s/64/mmu-hash.h>
+ #include <asm/mmu_context.h>
  #include <asm/hvcall.h>
  #include <asm/synch.h>
  #include <asm/ppc-opcode.h>
