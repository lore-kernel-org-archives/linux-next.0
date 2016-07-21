From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with the powerpc tree
Date: Thu, 21 Jul 2016 14:37:56 +1000
Message-ID: <20160721143756.1d24c16f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcelo Tosatti <mtosatti@redhat.com>, Gleb Natapov <gleb@kernel.org>, kvm@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, Kevin Hao <haokexin@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the kvm tree got a conflict in:

  arch/powerpc/kernel/Makefile

between commit:

  27d114966735 ("powerpc/32: Remove RELOCATABLE_PPC32")

from the powerpc tree and commit:

  fd7bacbca47a ("KVM: PPC: Book3S HV: Fix TB corruption in guest exit path on HMI interrupt")

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

diff --cc arch/powerpc/kernel/Makefile
index 62df36c3f138,6972a23433d3..000000000000
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@@ -46,7 -41,8 +46,7 @@@ obj-$(CONFIG_VDSO32)		+= vdso32
  obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
  obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_ppc970.o cpu_setup_pa6t.o
  obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_power.o
- obj-$(CONFIG_PPC_BOOK3S_64)	+= mce.o mce_power.o
+ obj-$(CONFIG_PPC_BOOK3S_64)	+= mce.o mce_power.o hmi.o
 -obj64-$(CONFIG_RELOCATABLE)	+= reloc_64.o
  obj-$(CONFIG_PPC_BOOK3E_64)	+= exceptions-64e.o idle_book3e.o
  obj-$(CONFIG_PPC64)		+= vdso64/
  obj-$(CONFIG_ALTIVEC)		+= vecemu.o
