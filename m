From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Sat, 06 Oct 2018 22:10:23 +1000
Message-ID: <874ldzjmxc.fsf@concordia.ellerman.id.au>
References: <20181005161406.73ef8727@canb.auug.org.au> <87d0sok3dm.fsf@concordia.ellerman.id.au> <20181005224606.2372fece@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005224606.2372fece@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christophe Leroy <christophe.leroy@c-s.fr>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Michael,
>
> On Fri, 05 Oct 2018 22:02:45 +1000 Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Ah fudge, what are the chances we add a new include of bootmem.h just as
>> Mike's removing bootmem.
>
> In my experience, it was almost certain ... almost every API removal
> conflicts with new added uses.  :-)

I suppose. Though the last time we added a new include of bootmem.h was
2015, and that should have actually been memblock.h.

>> I could just apply that to my tree. memblock.h is where early_memtest() is
>> actually defined anyway.
>
> However min_low_pfn and max_low_pfn are defined in bootmem.h until
> after it is removed.

OK. I guess I'll leave it for Andrew to squash in to the series.

cheers
