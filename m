From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the tip
 tree
Date: Fri, 26 Feb 2016 13:35:36 -0800
Message-ID: <20160226133536.0a37978a1de54154db747c49@linux-foundation.org>
References: <20160226160712.754b765c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:58809 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423244AbcBZVfh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 26 Feb 2016 16:35:37 -0500
In-Reply-To: <20160226160712.754b765c@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>, Piotr Kwapulinski <kwapulinski.piotr@gmail.com>

On Fri, 26 Feb 2016 16:07:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Andrew,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   mm/mprotect.c
> 
> between commit:
> 
>   62b5f7d013fc ("mm/core, x86/mm/pkeys: Add execute-only protection keys support")
> 
> from the tip tree and commit:
> 
>   aff3915ff831 ("mm/mprotect.c: don't imply PROT_EXEC on non-exec fs")
> 
> from the akpm-current tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary
> (no action is required).
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc mm/mprotect.c
> index fa37c4cd973a,6ff5dfa65b33..000000000000
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@@ -414,7 -409,11 +411,11 @@@ SYSCALL_DEFINE3(mprotect, unsigned long
>   
>   		/* Here we know that vma->vm_start <= nstart < vma->vm_end. */
>   
> + 		/* Does the application expect PROT_READ to imply PROT_EXEC */
> + 		if (rier && (vma->vm_flags & VM_MAYEXEC))
> + 			prot |= PROT_EXEC;
> + 
>  -		newflags = calc_vm_prot_bits(prot);
>  +		newflags = calc_vm_prot_bits(prot, pkey);
>   		newflags |= (vma->vm_flags & ~(VM_READ | VM_WRITE | VM_EXEC));
>   
>   		/* newflags >> 4 shift VM_MAY% in place of VM_% */

OK, thanks.

I moved this patch
(mm-mprotectc-dont-imply-prot_exec-on-non-exec-fs.patch) into the
"post-linux-next" section and reworked it to accommodate the -tip
changes.



From: Piotr Kwapulinski <kwapulinski.piotr@gmail.com>
Subject: mm/mprotect.c: don't imply PROT_EXEC on non-exec fs

The mprotect(PROT_READ) fails when called by the READ_IMPLIES_EXEC binary
on a memory mapped file located on non-exec fs.  The mprotect does not
check whether fs is _executable_ or not.  The PROT_EXEC flag is set
automatically even if a memory mapped file is located on non-exec fs.  Fix
it by checking whether a memory mapped file is located on a non-exec fs. 
If so the PROT_EXEC is not implied by the PROT_READ.  The implementation
uses the VM_MAYEXEC flag set properly in mmap.  Now it is consistent with
mmap.

I did the isolated tests (PT_GNU_STACK X/NX, multiple VMAs, X/NX fs).  I
also patched the official 3.19.0-47-generic Ubuntu 14.04 kernel and it
seems to work.

Signed-off-by: Piotr Kwapulinski <kwapulinski.piotr@gmail.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Konstantin Khlebnikov <koct9i@gmail.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/mprotect.c |   13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff -puN mm/mprotect.c~mm-mprotectc-dont-imply-prot_exec-on-non-exec-fs mm/mprotect.c
--- a/mm/mprotect.c~mm-mprotectc-dont-imply-prot_exec-on-non-exec-fs
+++ a/mm/mprotect.c
@@ -359,6 +359,9 @@ SYSCALL_DEFINE3(mprotect, unsigned long,
 	struct vm_area_struct *vma, *prev;
 	int error = -EINVAL;
 	const int grows = prot & (PROT_GROWSDOWN|PROT_GROWSUP);
+	const bool rier = (current->personality & READ_IMPLIES_EXEC) &&
+				(prot & PROT_READ);
+
 	prot &= ~(PROT_GROWSDOWN|PROT_GROWSUP);
 	if (grows == (PROT_GROWSDOWN|PROT_GROWSUP)) /* can't be both */
 		return -EINVAL;
@@ -375,11 +378,6 @@ SYSCALL_DEFINE3(mprotect, unsigned long,
 		return -EINVAL;
 
 	reqprot = prot;
-	/*
-	 * Does the application expect PROT_READ to imply PROT_EXEC:
-	 */
-	if ((prot & PROT_READ) && (current->personality & READ_IMPLIES_EXEC))
-		prot |= PROT_EXEC;
 
 	down_write(&current->mm->mmap_sem);
 
@@ -414,6 +412,10 @@ SYSCALL_DEFINE3(mprotect, unsigned long,
 
 		/* Here we know that vma->vm_start <= nstart < vma->vm_end. */
 
+		/* Does the application expect PROT_READ to imply PROT_EXEC */
+		if (rier && (vma->vm_flags & VM_MAYEXEC))
+			prot |= PROT_EXEC;
+
 		newflags = calc_vm_prot_bits(prot, pkey);
 		newflags |= (vma->vm_flags & ~(VM_READ | VM_WRITE | VM_EXEC));
 
@@ -445,6 +447,7 @@ SYSCALL_DEFINE3(mprotect, unsigned long,
 			error = -ENOMEM;
 			goto out;
 		}
+		prot = reqprot;
 	}
 out:
 	up_write(&current->mm->mmap_sem);
_
