Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD5D42F6F2;
	Tue,  7 Jul 2026 15:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439055; cv=none; b=fJEpND/nmLgOBQFGzOnZMoH+boSVHybP1O1BI0UEsTWyQQxDXkCk1K5iAy9bVDKLo/zs0pytvZZo7QhlkLu/x5msuL3FfJJIND+zuKxP0J2Uv8MVGzge+v10NLIWNtF7eqxKUbpCEuIkxHI0GEz6LOMx72wkxPHhyvY1KnxMS7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439055; c=relaxed/simple;
	bh=ceHC6xpMcueJENkYJKMUqp/5HPdDZGNBF/VjznBEfYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5AhYKATwtQj30NyQly3m2SWLElK1CgfJm+AL9T5r6N2y777vEKsr5/DLnbhelVL63YmN3vOB/tK+ZQRAYbLNztlhyWTCEqZPzljl0UJgYVhYXpdD/gUiHcWIlQ3K3/w55IXR4nV24ltQzFmYotOaoNdT3k9SUXJyyh9c+SbBUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNP9A3hd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNP9A3hd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BD21F000E9;
	Tue,  7 Jul 2026 15:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783439053;
	bh=MAaqNf6hA5DEMBlSEZP+445t5kHw2ZCJpl0WjuWSSXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TNP9A3hdPzM8tQnhEeBro9Hqghsi7b4LCrb2mfNqCEL25/z//srOj5jxHOhE4O7MR
	 xY8heLLdEMTtCoTCR1RUbOfoztwOgk3Q3399TZQtdBqqbZexWgAIz32VrKJtlfBocj
	 T00mUSQJYh4UYbgR2IJkLeeZcIqMEUHucm753dLM2NqhKXvm4hqSrTKClHFgAAlaAv
	 wmR5vx7EqeQBBcWnCRt4b2BRUqCeu5SFASMmAy8cYb05ZE/xPTQbyHr7zJVamk2jLS
	 PRNrBUHaductu8yfVx3aF2GdxpIAVv4tTm5N3VXT9ZESyZxsYnt+DzkXen1MqyBSgy
	 AgfqHcevGRGpw==
Date: Tue, 7 Jul 2026 08:44:12 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the kvm-arm-fixes tree
Message-ID: <ak0ezKOs62KN-9FA@kernel.org>
References: <akztC7H2IsEKaq4i@sirena.org.uk>
 <867bn7os67.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867bn7os67.wl-maz@kernel.org>

On Tue, Jul 07, 2026 at 02:17:20PM +0100, Marc Zyngier wrote:
> On Tue, 07 Jul 2026 13:11:55 +0100,
> Mark Brown <broonie@kernel.org> wrote:
> > 
> > Hi all,
> > 
> > After merging the kvm-arm-fixes tree, today's linux-next build
> > (arm64 defconfig) started generating warnings:
> > 
> > In file included from /tmp/next/build/include/linux/limits.h:7,
> >                  from /tmp/next/build/include/linux/overflow.h:6,
> >                  from /tmp/next/build/include/linux/bits.h:32,
> >                  from /tmp/next/build/arch/arm64/include/asm/kvm_pgtable.h:10,
> >                  from /tmp/next/build/arch/arm64/kvm/hyp/pgtable.c:11:
> > /tmp/next/build/arch/arm64/kvm/hyp/pgtable.c: In function 'kvm_pgtable_stage2_relax_perms':
> > /tmp/next/build/include/vdso/limits.h:8:25: warning: overflow in conversion from 'int' to 's8' {aka 'signed char'} changes value from '2147483647' to '-1' [-Woverflow]
> >     8 | #define INT_MAX         ((int)(~0U >> 1))
> >       |                         ^
> > /tmp/next/build/arch/arm64/include/asm/tlbflush.h:131:33: note: in expansion of macro 'INT_MAX'
> >   131 | #define TLBI_TTL_UNKNOWN        INT_MAX
> >       |                                 ^~~~~~~
> > /tmp/next/build/arch/arm64/kvm/hyp/pgtable.c:1361:20: note: in expansion of macro 'TLBI_TTL_UNKNOWN'
> >  1361 |         s8 level = TLBI_TTL_UNKNOWN;
> >       |                    ^~~~~~~~~~~~~~~~
> > In file included from /tmp/next/build/include/linux/limits.h:7,
> >                  from /tmp/next/build/include/linux/overflow.h:6,
> >                  from /tmp/next/build/include/linux/bits.h:32,
> >                  from /tmp/next/build/arch/arm64/include/asm/kvm_pgtable.h:10,
> >                  from /tmp/next/build/arch/arm64/kvm/hyp/nvhe/../pgtable.c:11:
> > /tmp/next/build/arch/arm64/kvm/hyp/nvhe/../pgtable.c: In function 'kvm_pgtable_stage2_relax_perms':
> > /tmp/next/build/include/vdso/limits.h:8:25: warning: overflow in conversion from 'int' to 's8' {aka 'signed char'} changes value from '2147483647' to '-1' [-Woverflow]
> >     8 | #define INT_MAX         ((int)(~0U >> 1))
> >       |                         ^
> > /tmp/next/build/arch/arm64/include/asm/tlbflush.h:131:33: note: in expansion of macro 'INT_MAX'
> >   131 | #define TLBI_TTL_UNKNOWN        INT_MAX
> >       |                                 ^~~~~~~
> > /tmp/next/build/arch/arm64/kvm/hyp/nvhe/../pgtable.c:1361:20: note: in expansion of macro 'TLBI_TTL_UNKNOWN'
> >  1361 |         s8 level = TLBI_TTL_UNKNOWN;
> >       |                    ^~~~~~~~~~~~~~~~
> > 
> > 
> > Caused by commit
> > 
> >    100baf0184896 (KVM: arm64: Ensure level is always initialized when relaxing perms)
> > 
> > I imagine this will cause an allyesconfig build failure when I get to
> > that due to -Werror.
> 
> Crap, I don't know how I missed that one! And the whole thing is
> pretty dodgy anyway:
> 
> - level starts as s8
> - passed to __kvm_tlb_flush_vmid_ipa_nsh() as int
> - passed to __tlbi_level() as u32
> - compared to the value 3
> 
> The problem is that we are conflating the level of a descriptor and
> the TTL, which may or may not be related.
> 
> I'm minded to queue something like this on top. Oliver?
> 
> Thanks for the heads up,
> 
> 	M.
> 
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 8754c99c22f2f..70dceb20dfada 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
> @@ -1356,7 +1356,7 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
>  				   enum kvm_pgtable_prot prot, enum kvm_pgtable_walk_flags flags)
>  {
>  	kvm_pte_t xn = 0, set = 0, clr = 0;
> -	s8 level = TLBI_TTL_UNKNOWN;
> +	s8 level;
>  	int ret;
>  
>  	if (prot & KVM_PTE_LEAF_ATTR_HI_SW)
> @@ -1379,7 +1379,8 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
>  
>  	ret = stage2_update_leaf_attrs(pgt, addr, 1, set, clr, NULL, &level, flags);
>  	if (!ret || ret == -EAGAIN)
> -		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa_nsh, pgt->mmu, addr, level);
> +		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa_nsh, pgt->mmu, addr,
> +			     (ret == -EAGAIN) ? TLBI_TTL_UNKNOWN : level);

Looks good, sorry for the mess.

Reviewed-by: Oliver Upton <oupton@kernel.org>

Thanks,
Oliver
