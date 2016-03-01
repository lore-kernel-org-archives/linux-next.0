From: Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: linux-next: Unable to write into a vma if it has been mapped
 without PROT_READ
Date: Mon, 29 Feb 2016 17:00:55 -0800
Message-ID: <56D4E9C7.4020108@linux.intel.com>
References: <CANaxB-wA_3qh78NUBc2ODqYHyXJLK0O6FRCdWizXBRPpWoBaGQ@mail.gmail.com>
 <20160229201559.GB13188@node.shutemov.name>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20160229201559.GB13188@node.shutemov.name>
Sender: owner-linux-mm@kvack.org
To: "Kirill A. Shutemov" <kirill@shutemov.name>, Andrey Wagin <avagin@gmail.com>
Cc: linux-next@vger.kernel.org, linux-mm@kvack.org
List-Id: linux-next.vger.kernel.org

On 02/29/2016 12:15 PM, Kirill A. Shutemov wrote:
> On Mon, Feb 29, 2016 at 11:11:37AM -0800, Andrey Wagin wrote:
>> > Hello Everyone,
>> > 
>> > I found that now we can't write into a vma if it was mapped without PROT_READ:
>> > 
>> > mmap(NULL, 4096, PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f2ac7eb8000
>> > --- SIGSEGV {si_signo=SIGSEGV, si_code=SEGV_ACCERR, si_addr=0x7f2ac7eb8000} ---
>> > +++ killed by SIGSEGV (core dumped) +++
>> > Segmentation fault
>> > [root@linux-next-test ~]# cat test.c
>> > #include <sys/mman.h>
>> > #include <stdlib.h>
>> > 
>> > int main()
>> > {
>> >     int *p;
>> > 
>> >     p = mmap(NULL, 4096, PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>> >     p[0] = 1;
>> > 
>> >     return 0;
>> > }
>> > 
>> > [root@linux-next-test ~]# uname -a
>> > Linux linux-next-test 4.5.0-rc6-next-20160229 #1 SMP Mon Feb 29
>> > 17:38:25 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
>> > 
>> > This issue appeared in 4.5.0-rc5-next-20160226.
>> > 
>> > https://ci.openvz.org/job/CRIU-linux-next/152/console
> Looks like the regression is caused by change in access_error() by commit
> 62b5f7d013fc ("mm/core, x86/mm/pkeys: Add execute-only protection keys support")
> as per next-20160229.
> 
> 		/*
> 		 * Assume all accesses require either read or execute
> 		 * permissions.  This is not an instruction access, so
> 		 * it requires read permissions.
> 		 */
> 		if (!(vma->vm_flags & VM_READ))
> 			return 1;
> 
> The assumption is false, taking this testcase into account.

I'm taking a look at it.  I might just be able to remove that check, but
I need to do a little due diligence with the execute-only support and
make sure I'm not breaking it.

Thanks for reporting this, btw!

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
