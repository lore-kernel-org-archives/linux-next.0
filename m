From: Steven Whitehouse <swhiteho@redhat.com>
Subject: Re: linux-next: sparc32/gcc-3.4.5/ld-2.15 build failure
Date: Thu, 31 Jul 2008 14:20:33 +0100
Message-ID: <1217510433.6317.11.camel@quoit>
References: <20080731171603.799c2c85.sfr@canb.auug.org.au>
	 <20080731003558.965581a6.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1754990AbYGaN0K@vger.kernel.org>
In-Reply-To: <20080731003558.965581a6.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "David S. Miller" <davem@davemloft.net>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Linus,

Please consider reverting the two commits:

> > commit f9247273cb69ba101877e946d2d83044409cc8c5
> > Author: Steven Whitehouse <swhiteho@redhat.com>
> > Date:   Thu Jul 24 17:22:13 2008 +0100
> > 
> >     UFS: add const to parser token table
> >     

> > 
> > commit fb2e405fc1fc8b20d9c78eaa1c7fd5a297efde43
> > Author: Adrian Bunk <bunk@kernel.org>
> > Date:   Fri Jul 25 02:55:49 2008 +0300
> > 
> >     fix fs/nfs/nfsroot.c compilation

It appears that they cause a compile problem (as per below explanation)
on sparc, even though they appear to be ok on other architectures. I'll
redo the patch to avoid the problem and resubmit but it seems best just
to revert in the mean time. Sorry to be a pain,

Steve.

On Thu, 2008-07-31 at 00:35 -0700, Andrew Morton wrote:
> On Thu, 31 Jul 2008 17:16:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Dave,
> > 
> > linux-next builds (sparc32 defconfig) have been failing for some time
> > like this:
> > 
> > .tmp_kallsyms2.o(.rodata+0x0): In function `kallsyms_addresses':
> > : relocation truncated to fit: R_SPARC_32 _text
> > .tmp_kallsyms2.o(.rodata+0x4): In function `kallsyms_addresses':
> > : relocation truncated to fit: R_SPARC_32 _text
> > .tmp_kallsyms2.o(.rodata+0x8): In function `kallsyms_addresses':
> > : relocation truncated to fit: R_SPARC_32 _text
> > 
> > (several more)
> > 
> > I finally bisected it down to this commit:
> > 
> > commit f9247273cb69ba101877e946d2d83044409cc8c5
> > Author: Steven Whitehouse <swhiteho@redhat.com>
> > Date:   Thu Jul 24 17:22:13 2008 +0100
> > 
> >     UFS: add const to parser token table
> >     
> > Reverting this commit and the followup commit:
> > 
> > commit fb2e405fc1fc8b20d9c78eaa1c7fd5a297efde43
> > Author: Adrian Bunk <bunk@kernel.org>
> > Date:   Fri Jul 25 02:55:49 2008 +0300
> > 
> >     fix fs/nfs/nfsroot.c compilation
> > 
> > allows the sparc32 build to succeed.  This is toolchain specific as a
> > different cross toolchain I have does not get this error.
> > 
> > Failing toolchain:
> > 
> > $ gcc-3.4.5-glibc-2.3.6/sparc64-unknown-linux-gnu/bin/sparc64-unknown-linux-gnu-gcc --version
> > sparc64-unknown-linux-gnu-gcc (GCC) 3.4.5
> > $ gcc-3.4.5-glibc-2.3.6/sparc64-unknown-linux-gnu/bin/sparc64-unknown-linux-gnu-ld --version
> > GNU ld version 2.15
> > 
> > An OK toolchain:
> > $ cross/bin/sparc64-linux-gcc --version
> > sparc64-linux-gcc (GCC) 4.2.4
> > $ cross/bin/sparc64-linux-ld --version
> > GNU ld (GNU Binutils) 2.18
> > 
> > Both these commits are actually in Linus' tree, now.
> 
> gee.  nfsroot.c is now effectively doing `const __initconst' which
> might be upsetting the compiler.  And perhaps one of the forty-odd
> other users of match_table_t needs __initconst or somesuch.
> 
> Yes, I'd second a revert-and-try-again-later on that one.
