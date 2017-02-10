From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the powerpc tree
Date: Fri, 10 Feb 2017 14:47:07 +1100
Message-ID: <20170210144707.64071681@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, KVM <kvm@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@ozlabs.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/powerpc/include/asm/head-64.h

between commit:

  852e5da99d15 ("powerpc/64s: Tidy up after exception handler rework")

from the powerpc tree and commit:

  7ede531773ea ("KVM: PPC: Book3S: Move 64-bit KVM interrupt handler out from alt section")

from the kvm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/include/asm/head-64.h
index a475711cd9c3,9bd81619d090..000000000000
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@@ -223,8 -217,8 +223,8 @@@ name
  	FIXED_SECTION_ENTRY_BEGIN(virt_trampolines, name)
  
  #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 -#define TRAMP_KVM_BEGIN(name)						\
 +#define TRAMP_KVM_BEGIN(name)					\
- 	TRAMP_REAL_BEGIN(name)
+ 	TRAMP_VIRT_BEGIN(name)
  #else
  #define TRAMP_KVM_BEGIN(name)
  #endif
