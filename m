From: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: linux-next: Unable to write into a vma if it has been mapped
 without PROT_READ
Date: Mon, 29 Feb 2016 23:15:59 +0300
Message-ID: <20160229201559.GB13188@node.shutemov.name>
References: <CANaxB-wA_3qh78NUBc2ODqYHyXJLK0O6FRCdWizXBRPpWoBaGQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:37835 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753634AbcB2UQD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Feb 2016 15:16:03 -0500
Received: by mail-wm0-f54.google.com with SMTP id p65so5499559wmp.0
        for <linux-next@vger.kernel.org>; Mon, 29 Feb 2016 12:16:01 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <CANaxB-wA_3qh78NUBc2ODqYHyXJLK0O6FRCdWizXBRPpWoBaGQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrey Wagin <avagin@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-mm@kvack.org

On Mon, Feb 29, 2016 at 11:11:37AM -0800, Andrey Wagin wrote:
> Hello Everyone,
> 
> I found that now we can't write into a vma if it was mapped without PROT_READ:
> 
> mmap(NULL, 4096, PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f2ac7eb8000
> --- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_ACCERR, si_addr=0x7f2ac7eb8000} ---
> +++ killed by SIGSEGV (core dumped) +++
> Segmentation fault
> [root@linux-next-test ~]# cat test.c
> #include <sys/mman.h>
> #include <stdlib.h>
> 
> int main()
> {
>     int *p;
> 
>     p = mmap(NULL, 4096, PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>     p[0] = 1;
> 
>     return 0;
> }
> 
> [root@linux-next-test ~]# uname -a
> Linux linux-next-test 4.5.0-rc6-next-20160229 #1 SMP Mon Feb 29
> 17:38:25 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
> 
> This issue appeared in 4.5.0-rc5-next-20160226.
> 
> https://ci.openvz.org/job/CRIU-linux-next/152/console

Looks like the regression is caused by change in access_error() by commit
62b5f7d013fc ("mm/core, x86/mm/pkeys: Add execute-only protection keys support")
as per next-20160229.

		/*
		 * Assume all accesses require either read or execute
		 * permissions.  This is not an instruction access, so
		 * it requires read permissions.
		 */
		if (!(vma->vm_flags & VM_READ))
			return 1;

The assumption is false, taking this testcase into account.

Dave?

-- 
 Kirill A. Shutemov
