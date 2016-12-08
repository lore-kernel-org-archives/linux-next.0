From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for Dec 7 (kallsyms failure)
Date: Thu, 8 Dec 2016 15:29:35 +1100
Message-ID: <20161208152935.325120da@canb.auug.org.au>
References: <20161207172432.184970d7@canb.auug.org.au>
        <13d83759-40d3-593b-b53f-f3e75fb05b7a@infradead.org>
        <20161208105607.68810cae@canb.auug.org.au>
        <90c66e73-f7c9-3d48-04b7-0985cce53382@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <90c66e73-f7c9-3d48-04b7-0985cce53382@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sachin Sant <sachinp@linux.vnet.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Balbir Singh <bsingharora@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Linus <torvalds@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

Hi all,

On Wed, 7 Dec 2016 18:30:57 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 12/07/16 15:56, Stephen Rothwell wrote:
> > 
> > On Wed, 7 Dec 2016 15:42:32 -0800 Randy Dunlap <rdunlap@infradead.org> wrote:  
> >>
> >> I started seeing this yesterday (2016-1206).
> >> This is on x86_64.
> >>
> >> Anybody know about it?
> >>
> >> kallsyms failure: relative symbol value 0xffffffff81000000 out of range in relative mode  
> > 
> > I got a similar failure starting a few days ago on my powerpc
> > allyesconfig build.  I was assuming that it was PowerPC specific, but
> > noone has found a cause yet.
> >   
> 
> It may just be an invalid randconfig.  I modified scripts/kallsyms.c and
> I see this message:
> kallsyms failure: relative symbol value 0xffffffff81000000 [symbol: Tstartup_64] out of range in relative mode
> 
> and it makes sense that startup_64 would (or could) be at 0xffffffff81000000...
> especially since CONFIG_PHYSICAL_START=0x1000000 and
> (from Documentation/x86/x86_64/mm.txt)
> ffffffff80000000 - ffffffff9fffffff (=512 MB)  kernel text mapping, from phys 0
> 
> 
> Ard, what do you think about this?

The similar failure I saw in the powerpc allyesconfig build

kallsyms failure: relative symbol value 0xc000000000000000 out of range in relative mode

was caused by commit

  8ab2ae655bfe ("default exported asm symbols to zero")

which has been reverted in Linus' tree today.

-- 
Cheers,
Stephen Rothwell
