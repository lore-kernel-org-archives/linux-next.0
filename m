From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
Subject: Re: mmotm 2018-01-04-16-19 uploaded
Date: Fri, 5 Jan 2018 12:13:17 +0530
Message-ID: <7e35e16a-d71c-2ec8-03ed-b07c2af562f8@linux.vnet.ibm.com>
References: <5a4ec4bc.u5I/HzCSE6TLVn02%akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <5a4ec4bc.u5I/HzCSE6TLVn02%akpm@linux-foundation.org>
Sender: owner-linux-mm@kvack.org
To: akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, mhocko@suse.cz, broonie@kernel.org
List-Id: linux-next.vger.kernel.org

On 01/05/2018 05:50 AM, akpm@linux-foundation.org wrote:
> The mm-of-the-moment snapshot 2018-01-04-16-19 has been uploaded to
> 
>    http://www.ozlabs.org/~akpm/mmotm/
> 
> mmotm-readme.txt says
> 
> README for mm-of-the-moment:
> 
> http://www.ozlabs.org/~akpm/mmotm/
> 
> This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> more than once a week.
> 
> You will need quilt to apply these patches to the latest Linus release (4.x
> or 4.x-rcY).  The series file is in broken-out.tar.gz and is duplicated in
> http://ozlabs.org/~akpm/mmotm/series
> 
> The file broken-out.tar.gz contains two datestamp files: .DATE and
> .DATE-yyyy-mm-dd-hh-mm-ss.  Both contain the string yyyy-mm-dd-hh-mm-ss,
> followed by the base kernel version against which this patch series is to
> be applied.
> 
> This tree is partially included in linux-next.  To see which patches are
> included in linux-next, consult the `series' file.  Only the patches
> within the #NEXT_PATCHES_START/#NEXT_PATCHES_END markers are included in
> linux-next.
> 
> A git tree which contains the memory management portion of this tree is
> maintained at git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git

Seems like this latest snapshot mmotm-2018-01-04-16-19 has not been
updated in this git tree. I could not fetch not it shows up in the
http link below.

https://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git

The last one mmotm-2017-12-22-17-55 seems to have some regression on
powerpc with respect to ELF loading of binaries (see below). Seems to
be related to recent MAP_FIXED_SAFE (or MAP_FIXED_NOREPLACE as seen
now in the code). IIUC (have not been following the series last month)
MAP_FIXED_NOREPLACE will fail an allocation request if the hint address
cannot be reserve instead of changing existing mappings. Is it possible
that ELF loading needs to be fixed at a higher level to deal with these
new possible mmap() failures because of MAP_FIXED_NOREPLACE ?

[   22.448068] 9060 (hostname): Uhuuh, elf segment at 0000000010020000 requested but the memory is mapped already
[   22.450135] 9063 (sed): Uhuuh, elf segment at 0000000010030000 requested but the memory is mapped already
[   22.456484] 9066 (hostname): Uhuuh, elf segment at 0000000010020000 requested but the memory is mapped already
[   22.458171] 9069 (sed): Uhuuh, elf segment at 0000000010030000 requested but the memory is mapped already
[   22.505341] 9078 (sed): Uhuuh, elf segment at 0000000010030000 requested but the memory is mapped already
[   22.506961] 9081 (sed): Uhuuh, elf segment at 0000000010030000 requested but the memory is mapped already
[   22.508736] 9084 (sed): Uhuuh, elf segment at 0000000010030000 requested but the memory is mapped already
[   22.510589] 9087 (sed): Uhuuh, elf segment at 0000000010030000 requested but the memory is mapped already
[   22.512442] 9090 (sed): Uhuuh, elf segment at 0000000010030000 requested but the memory is mapped already
[   22.514685] 9093 (sed): Uhuuh, elf segment at 0000000010030000 requested but the memory is mapped already
[   22.565793] 9103 (sed): Uhuuh, elf segment at 0000000010030000 requested but the memory is mapped already
[   22.567874] 9106 (sed): Uhuuh, elf segment at 0000000010030000 requested but the memory is mapped already
[  123.469490] 9173 (fprintd): Uhuuh, elf segment at 0000000010020000 requested but the memory is mapped already
[  137.468372] 9182 (hostname): Uhuuh, elf segment at 0000000010020000 requested but the memory is mapped already
[  137.644647] 9205 (pkg-config): Uhuuh, elf segment at 0000000010020000 requested but the memory is mapped already
[  137.811893] 9219 (sed): Uhuuh, elf segment at 0000000010030000 requested but the memory is mapped already
[  164.739135] 9232 (less): Uhuuh, elf segment at 0000000010040000 requested but the memory is mapped already

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
