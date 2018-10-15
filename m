From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with the tip tree
Date: Mon, 15 Oct 2018 15:11:59 +1100
Message-ID: <20181015151159.5ce4faa5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/b_8QmCn.wvnP8kXtALQjGJi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Eric W. Biederman" <ebiederm@xmission.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/b_8QmCn.wvnP8kXtALQjGJi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Today's linux-next merge of the userns tree got a conflict in:

  arch/x86/mm/fault.c

between commit:

  164477c2331b ("x86/mm: Clarify hardware vs. software "error_code"")
(and others from that series)

from the tip tree and commits:

  768fd9c69bb5 ("signal/x86: Remove pkey parameter from bad_area_nosemaphor=
e")
  25c102d803ea ("signal/x86: Remove pkey parameter from mm_fault_error")

from the userns tree.

I fixed it up (I think - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/x86/mm/fault.c
index c2e3e5127ebc,8d77700a7883..000000000000
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@@ -968,19 -884,40 +892,41 @@@ bad_area_access_error(struct pt_regs *r
  	 * But, doing it this way allows compiler optimizations
  	 * if pkeys are compiled out.
  	 */
- 	if (bad_area_access_from_pkeys(error_code, vma))
- 		__bad_area(regs, error_code, address, vma, SEGV_PKUERR);
- 	else
- 		__bad_area(regs, error_code, address, vma, SEGV_ACCERR);
+ 	if (bad_area_access_from_pkeys(error_code, vma)) {
+ 		/*
+ 		 * A protection key fault means that the PKRU value did not allow
+ 		 * access to some PTE.  Userspace can figure out what PKRU was
+ 		 * from the XSAVE state.  This function captures the pkey from
+ 		 * the vma and passes it to userspace so userspace can discover
+ 		 * which protection key was set on the PTE.
+ 		 *
+ 		 * If we get here, we know that the hardware signaled a X86_PF_PK
+ 		 * fault and that there was a VMA once we got in the fault
+ 		 * handler.  It does *not* guarantee that the VMA we find here
+ 		 * was the one that we faulted on.
+ 		 *
+ 		 * 1. T1   : mprotect_key(foo, PAGE_SIZE, pkey=3D4);
+ 		 * 2. T1   : set PKRU to deny access to pkey=3D4, touches page
+ 		 * 3. T1   : faults...
+ 		 * 4.    T2: mprotect_key(foo, PAGE_SIZE, pkey=3D5);
+ 		 * 5. T1   : enters fault handler, takes mmap_sem, etc...
+ 		 * 6. T1   : reaches here, sees vma_pkey(vma)=3D5, when we really
+ 		 *	     faulted on a pte with its pkey=3D4.
+ 		 */
+ 		u32 pkey =3D vma_pkey(vma);
+=20
+ 		__bad_area(regs, error_code, address, pkey, SEGV_PKUERR);
+ 	} else {
+ 		__bad_area(regs, error_code, address, 0, SEGV_ACCERR);
+ 	}
  }
 =20
 +/* Handle faults in the kernel portion of the address space */
  static void
  do_sigbus(struct pt_regs *regs, unsigned long error_code, unsigned long a=
ddress,
- 	  u32 *pkey, unsigned int fault)
+ 	  unsigned int fault)
  {
  	struct task_struct *tsk =3D current;
- 	int code =3D BUS_ADRERR;
 =20
  	/* Kernel mode? Handle exceptions or die: */
  	if (!(error_code & X86_PF_USER)) {
@@@ -1238,74 -1187,41 +1191,74 @@@ do_kern_addr_fault(struct pt_regs *regs
  	 * only copy the information from the master page table,
  	 * nothing more.
  	 *
 -	 * This verifies that the fault happens in kernel space
 -	 * (error_code & 4) =3D=3D 0, and that the fault was not a
 -	 * protection error (error_code & 9) =3D=3D 0.
 +	 * Before doing this on-demand faulting, ensure that the
 +	 * fault is not any of the following:
 +	 * 1. A fault on a PTE with a reserved bit set.
 +	 * 2. A fault caused by a user-mode access.  (Do not demand-
 +	 *    fault kernel memory due to user-mode accesses).
 +	 * 3. A fault caused by a page-level protection violation.
 +	 *    (A demand fault would be on a non-present page which
 +	 *     would have X86_PF_PROT=3D=3D0).
  	 */
 -	if (unlikely(fault_in_kernel_space(address))) {
 -		if (!(error_code & (X86_PF_RSVD | X86_PF_USER | X86_PF_PROT))) {
 -			if (vmalloc_fault(address) >=3D 0)
 -				return;
 -		}
 -
 -		/* Can handle a stale RO->RW TLB: */
 -		if (spurious_fault(error_code, address))
 +	if (!(hw_error_code & (X86_PF_RSVD | X86_PF_USER | X86_PF_PROT))) {
 +		if (vmalloc_fault(address) >=3D 0)
  			return;
 +	}
 =20
 -		/* kprobes don't want to hook the spurious faults: */
 -		if (kprobes_fault(regs))
 -			return;
 -		/*
 -		 * Don't take the mm semaphore here. If we fixup a prefetch
 -		 * fault we could otherwise deadlock:
 -		 */
 -		bad_area_nosemaphore(regs, error_code, address);
 +	/* Was the fault spurious, caused by lazy TLB invalidation? */
 +	if (spurious_kernel_fault(hw_error_code, address))
 +		return;
 =20
 +	/* kprobes don't want to hook the spurious faults: */
 +	if (kprobes_fault(regs))
  		return;
 -	}
 +
 +	/*
 +	 * Note, despite being a "bad area", there are quite a few
 +	 * acceptable reasons to get here, such as erratum fixups
 +	 * and handling kernel code that can fault, like get_user().
 +	 *
 +	 * Don't take the mm semaphore here. If we fixup a prefetch
 +	 * fault we could otherwise deadlock:
 +	 */
- 	bad_area_nosemaphore(regs, hw_error_code, address, NULL);
++	bad_area_nosemaphore(regs, hw_error_code, address);
 +}
 +NOKPROBE_SYMBOL(do_kern_addr_fault);
 +
 +/* Handle faults in the user portion of the address space */
 +static inline
 +void do_user_addr_fault(struct pt_regs *regs,
 +			unsigned long hw_error_code,
 +			unsigned long address)
 +{
 +	unsigned long sw_error_code;
 +	struct vm_area_struct *vma;
 +	struct task_struct *tsk;
 +	struct mm_struct *mm;
 +	vm_fault_t fault, major =3D 0;
 +	unsigned int flags =3D FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
 +	u32 pkey;
 +
 +	tsk =3D current;
 +	mm =3D tsk->mm;
 =20
  	/* kprobes don't want to hook the spurious faults: */
  	if (unlikely(kprobes_fault(regs)))
  		return;
 =20
 -	if (unlikely(error_code & X86_PF_RSVD))
 -		pgtable_bad(regs, error_code, address);
 +	/*
 +	 * Reserved bits are never expected to be set on
 +	 * entries in the user portion of the page tables.
 +	 */
 +	if (unlikely(hw_error_code & X86_PF_RSVD))
 +		pgtable_bad(regs, hw_error_code, address);
 =20
 -	if (unlikely(smap_violation(error_code, regs))) {
 -		bad_area_nosemaphore(regs, error_code, address);
 +	/*
 +	 * Check for invalid kernel (supervisor) access to user
 +	 * pages in the user address space.
 +	 */
 +	if (unlikely(smap_violation(hw_error_code, regs))) {
- 		bad_area_nosemaphore(regs, hw_error_code, address, NULL);
++		bad_area_nosemaphore(regs, hw_error_code, address);
  		return;
  	}
 =20
@@@ -1314,7 -1230,7 +1267,7 @@@
  	 * in a region with pagefaults disabled then we must not take the fault
  	 */
  	if (unlikely(faulthandler_disabled() || !mm)) {
- 		bad_area_nosemaphore(regs, hw_error_code, address, NULL);
 -		bad_area_nosemaphore(regs, error_code, address);
++		bad_area_nosemaphore(regs, hw_error_code, address);
  		return;
  	}
 =20
@@@ -1362,49 -1252,31 +1315,49 @@@
 =20
  	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 =20
 -	if (error_code & X86_PF_WRITE)
 +	if (sw_error_code & X86_PF_WRITE)
  		flags |=3D FAULT_FLAG_WRITE;
 -	if (error_code & X86_PF_INSTR)
 +	if (sw_error_code & X86_PF_INSTR)
  		flags |=3D FAULT_FLAG_INSTRUCTION;
 =20
 +#ifdef CONFIG_X86_64
 +	/*
 +	 * Instruction fetch faults in the vsyscall page might need
 +	 * emulation.  The vsyscall page is at a high address
 +	 * (>PAGE_OFFSET), but is considered to be part of the user
 +	 * address space.
 +	 *
 +	 * The vsyscall page does not have a "real" VMA, so do this
 +	 * emulation before we go searching for VMAs.
 +	 */
 +	if ((sw_error_code & X86_PF_INSTR) && is_vsyscall_vaddr(address)) {
 +		if (emulate_vsyscall(regs, address))
 +			return;
 +	}
 +#endif
 +
  	/*
 -	 * When running in the kernel we expect faults to occur only to
 -	 * addresses in user space.  All other faults represent errors in
 -	 * the kernel and should generate an OOPS.  Unfortunately, in the
 -	 * case of an erroneous fault occurring in a code path which already
 -	 * holds mmap_sem we will deadlock attempting to validate the fault
 -	 * against the address space.  Luckily the kernel only validly
 -	 * references user space from well defined areas of code, which are
 -	 * listed in the exceptions table.
 +	 * Kernel-mode access to the user address space should only occur
 +	 * on well-defined single instructions listed in the exception
 +	 * tables.  But, an erroneous kernel fault occurring outside one of
 +	 * those areas which also holds mmap_sem might deadlock attempting
 +	 * to validate the fault against the address space.
  	 *
 -	 * As the vast majority of faults will be valid we will only perform
 -	 * the source reference check when there is a possibility of a
 -	 * deadlock. Attempt to lock the address space, if we cannot we then
 -	 * validate the source. If this is invalid we can skip the address
 -	 * space check, thus avoiding the deadlock:
 +	 * Only do the expensive exception table search when we might be at
 +	 * risk of a deadlock.  This happens if we
 +	 * 1. Failed to acquire mmap_sem, and
 +	 * 2. The access did not originate in userspace.  Note: either the
 +	 *    hardware or earlier page fault code may set X86_PF_USER
 +	 *    in sw_error_code.
  	 */
  	if (unlikely(!down_read_trylock(&mm->mmap_sem))) {
 -		if (!(error_code & X86_PF_USER) &&
 +		if (!(sw_error_code & X86_PF_USER) &&
  		    !search_exception_tables(regs->ip)) {
 -			bad_area_nosemaphore(regs, error_code, address);
 +			/*
 +			 * Fault from code in kernel from
 +			 * which we do not expect faults.
 +			 */
- 			bad_area_nosemaphore(regs, sw_error_code, address, NULL);
++			bad_area_nosemaphore(regs, sw_error_code, address);
  			return;
  		}
  retry:
@@@ -1500,7 -1369,7 +1450,7 @@@ good_area
 =20
  	up_read(&mm->mmap_sem);
  	if (unlikely(fault & VM_FAULT_ERROR)) {
- 		mm_fault_error(regs, sw_error_code, address, &pkey, fault);
 -		mm_fault_error(regs, error_code, address, fault);
++		mm_fault_error(regs, sw_error_code, address, fault);
  		return;
  	}
 =20

--Sig_/b_8QmCn.wvnP8kXtALQjGJi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvEE48ACgkQAVBC80lX
0GwIkgf/fWVjUMfekZEmKIz7bOumvSbYNHsKkUNFyImUaN3+7ZcpdUT66ScB6HeD
hDjeXxMfxIRUFzR1wgCHUJYPuq6fKvSNzCpIXvem6+p2QhcQdO0n1KhbD0F+wxAH
PA79NzxNbK/F0iJZaE5c3vF7oYyElqMjdM344zb3+4Ap9VddqoVa+fr8TF0wRBAe
DBPl98sYEzAsz28+6ZQ/EztcswH/MIDV0NubHxz68zgx9X1B+KAdeMVq72YuVG4i
WYSFzU24KtOJNVf6kQRJeK/oC7RhEkTV+/XrEr9CKPCq9Wb+Rf/bkIEgm/uY9TNE
4a2yqxeS2qhtCrlmvcluuFnQv/UcJw==
=xKOQ
-----END PGP SIGNATURE-----

--Sig_/b_8QmCn.wvnP8kXtALQjGJi--
