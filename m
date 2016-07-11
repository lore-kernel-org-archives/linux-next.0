From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Mon, 11 Jul 2016 10:14:06 +1000
Message-ID: <20160711101406.66a5c148@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Catalin,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/mm/fault.c

between commit:

  e19a6ee2460b ("arm64: kernel: Save and restore UAO and addr_limit on exception entry")

from Linus' tree and commit:

  541ec870ef31 ("arm64: kill ESR_LNX_EXEC")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/mm/fault.c
index b1166d1e5955,fc5a34a72c6d..000000000000
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@@ -279,9 -282,8 +282,9 @@@ static int __kprobes do_page_fault(unsi
  		mm_flags |= FAULT_FLAG_WRITE;
  	}
  
- 	if (permission_fault(esr) && (addr < USER_DS)) {
+ 	if (is_permission_fault(esr) && (addr < USER_DS)) {
 -		if (get_fs() == KERNEL_DS)
 +		/* regs->orig_addr_limit may be 0 if we entered from EL0 */
 +		if (regs->orig_addr_limit == KERNEL_DS)
  			die("Accessing user space memory with fs=KERNEL_DS", regs, esr);
  
  		if (!search_exception_tables(regs->pc))
