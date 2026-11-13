Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559652;
	b=mxm4Cq0+kQzUqvPFynErOd93KhSvzKFiQMBkCFoPjxcxNv+vLLjse4JM1Jwm9DRxUGHV
	 OeNSr3I4X2y5fj+hKTOHSQTa+dC1DiXp5X03P+ubKuPU2dV9pwkw90fnzlTmMq4WAPjJE
	 umNEhpSzXN8HxI2753XK0TbHS8axdr5Q+A+oS2EMxs4KeGGbVL8eCm2tSRTujNGDxX3YM
	 rNJU4chjsHhvmRCXshqFRPPGi68vx9i+VL+Elzi5Y+4siTbGCU5Z3x+GARjCIKnmS63Pu
	 VsRZRLVjGYctg00uHCKcYwkP6rXiTRp3Ppu5sWEf068gNXlioqGHUkIsUiXPHjqvTww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559652;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GT8QppbSzqicNDKU6AlHr1erxpoGKs5IMtOFm/24HAA=;
	b=jJK7CNSZ950mdcqXR/MP/sgCGZ7kF71vSeP2Ceh4/jXMKRjy+O3zxlu0d5hnTwAtr+Bh
	 gPM0hnRH1tF/rV+6dGBN+zT3hF94cVuPKUP8oFzoCLgdzIGUuuuDmO+kSfSSyUZVyyqAp
	 3QDlpEM6iyAyGRXOsWNF0jSYeT8K1hmJ6OHP8EPjm6qtgUdjV1eqQ21cJnd19vZKGHLGz
	 sFfPwbMh10rMhXtvMvupeg8+PPdPQeky8/hZONBfOIEzUXxP/z/5tRBbXdTEmTx1zM9ls
	 hFgVK+vEmxaIo/R2zmmXVIxxDPZVVaKv22d4TZ/jnCxjfeV8lhj2oZCkaDgZu+QhEsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c4T5or3s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717E1606A33B
	for <linux-next@vger.kernel.org>; Fri, 13 Nov 2026 08:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c4T5or3s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906B71F000C4;
	Fri, 13 Nov 2026 08:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559652;
	bh=GT8QppbSzqicNDKU6AlHr1erxpoGKs5IMtOFm/24HAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c4T5or3sDGUL0j+0ped4XdG0fjxOyTo+HRAZETzGkBJb3Nw4jHQK8ivpV3LprAy15
	 RCY6MINl03YoD6wY8ybo6vIajqkr68gLc7+JqPcwsyYg49gQZTPnlnO+avb11QYd09
	 FGv9jUeu/nVuaQPsE4D5KLqdR4lDaYKc/OxjAkR8Ebc3UNz5eNEkG4fCKZZ8jG6Z0p
	 AbhaxPKkmqM5jpeTR2D2WQF/XL+jMvahuhrzW2wwXpJ5i0mHaVeJMNNtmcE7gNE5Uc
	 L9my2mtWqK2hjoGi43T3gPLxICpx5x31QyODTMSq+mqDYIOVwEGV+qxK1xA4IPMuwC
	 7ay8sZuFUZkuA==
Date: Fri, 13 Nov 2026 09:47:28 +0100
From: Thorsten Blum <blum@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-next@vger.kernel.org
Subject: Re: linux-next: Add blum/linux.git for-next
Message-ID: <avbOoCsjrarxvY9g@kernel.org>
References: <avW7g6pH3ILcSAkq@kernel.org>
 <0601ed55-a7fb-4f08-9e34-164103e140bb@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0601ed55-a7fb-4f08-9e34-164103e140bb@sirena.org.uk>

On Thu, Nov 12, 2026 at 01:42:23PM +0000, Mark Brown wrote:
> On Thu, Nov 12, 2026 at 02:13:39PM +0100, Thorsten Blum wrote:
> 
> > Could you please add
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/blum/linux.git for-next
> >
> > to linux-next?
> 
> What is this branch intended to contain?  Usually branches in -next are
> for specific trees or purposes, and this affects where they are included
> in the merge.

The branch is intended for cleanups and fixes across several subsystems
that have remained unmerged for some time.

It will contain only reviewed changes that are ready for integration
testing in linux-next ahead of the next merge window. I'll drop any
patches that maintainers pick up in the meantime.

I'm planning to send pull requests directly to Linus.
