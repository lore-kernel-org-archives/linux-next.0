From: Will Deacon <will.deacon@arm.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the arm64
 tree
Date: Tue, 11 Dec 2018 10:39:53 +0000
Message-ID: <20181211103953.GC12006@edgewater-inn.cambridge.arm.com>
References: <20181211171102.14c0be9f@canb.auug.org.au>
 <20181211171230.7847fd48@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181211171230.7847fd48@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrey Konovalov <andreyknvl@google.com>, Steve Capper <steve.capper@arm.com>
List-Id: linux-next.vger.kernel.org

On Tue, Dec 11, 2018 at 05:12:30PM +1100, Stephen Rothwell wrote:
> On Tue, 11 Dec 2018 17:11:02 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the akpm-current tree got a conflict in:
> > 
> >   arch/arm64/mm/proc.S
> > 
> > between commits:
> > 
> >   67e7fdfcc682 ("arm64: mm: introduce 52-bit userspace support")
> >   68d23da4373a ("rm64: Kconfig: Re-jig CONFIG options for 52-bit VA")
> > 
> > from the arm64 tree and commit:
> > 
> >   089dc516f651 ("kasan, arm64: enable top byte ignore for the kernel")
> > 
> > from the akpm-current tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc arch/arm64/mm/proc.S
> > index e05b3ce1db6b,d861f208eeb1..73886a5f1f30
> > --- a/arch/arm64/mm/proc.S
> > +++ b/arch/arm64/mm/proc.S
> > @@@ -449,16 -451,8 +455,16 @@@ ENTRY(__cpu_setup
> >   	 */
> >   	ldr	x10, =TCR_TxSZ(VA_BITS) | TCR_CACHE_FLAGS | TCR_SMP_FLAGS | \
> >   			TCR_TG_FLAGS | TCR_KASLR_FLAGS | TCR_ASID16 | \
> > - 			TCR_TBI0 | TCR_A1
> > + 			TCR_TBI0 | TCR_A1 | TCR_KASAN_FLAGS
> >  -	tcr_set_idmap_t0sz	x10, x9
> >  +
> >  +#ifdef CONFIG_ARM64_USER_VA_BITS_52
> >  +	ldr_l		x9, vabits_user
> >  +	sub		x9, xzr, x9
> >  +	add		x9, x9, #64
> >  +#else
> >  +	ldr_l		x9, idmap_t0sz
> >  +#endif
> >  +	tcr_set_t0sz	x10, x9
> >   
> >   	/*
> >   	 * Set the IPS bits in TCR_EL1.

This looks good to me. Thanks, Stephen.

Will
