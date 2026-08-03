Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2362399375;
	Mon,  3 Aug 2026 07:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785741812; cv=none; b=H2LpkXm8tXDd97BxP9SF2MlcvE+dIK80rEPkTXbeCUOsKQXEh6yDZ6jY+iOvE+P8sLeTJf2D1qKlXMBYEp3wykGZFCOmTBQ1bq5h7c2R/aTbbB0Z+FvswatAhfub5OyGRlz4v1/cKV3HZYSGWyehmH4DHpgkpqbEbB6rCtiTPzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785741812; c=relaxed/simple;
	bh=ySdiy9B5PeaY4MQenoO+4fvK7uaEKT5L9FXbhnTBYRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJS8Y2gzTa3ds5qBAr5QU32J13L25v/mzrU/5tBgrMWjosFNI3DXkylKaDFecD86CUu5kQpz7yCPMv/FggOmlrBEGWXAkLiywfdzeo1jOiOIqjHBAMxOVMYHpsL2iAT15VRQVfIV1+/MuXSH/dvcx2Kko8TjrbXIqvrhQ6R4eF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndXkm76L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndXkm76L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099671F000E9;
	Mon,  3 Aug 2026 07:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785741809;
	bh=uQpOmJTKRG8p4tzO7NyoiLa8Hb+8Z8KrXtGEFOoNAy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ndXkm76Lqu/7l0zg2qIhPS87qveVub1ecnN4oCNrO3i3X7wHcDGxL/QHO2VmUpTIH
	 d5uxZEvD+Op2arlR1V5XzenPPXflB+fXmp4VZWhargRWtccP1O20MIqh/uq1MVSMnr
	 Ii45UPCXlI/2XU2igcwLr5YjR6n/buUMNC1qttj0THRoDtQ1izmH4Gscnax9gftArc
	 gfdIkfAhqLG6Szr68rmTmjuzlnYhAzIHbjMoI80vfNCTf8a7fIDUlAKN+wPT1goOx6
	 Ou1/81NeAKpqg8UmQBLxZO1fnehRZeU7paDc/pwNvjxHMQNJRho9Z0R7cNq/n8c6zh
	 qJxpCk7uaFq0w==
Date: Mon, 3 Aug 2026 07:23:27 +0000
From: Harry Yoo <harry@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, broonie@kernel.org, linux-kernel@vger.kernel.org, 
	linux-next@vger.kernel.org, paulmck@kernel.org, puranjay@kernel.org, vbabka@kernel.org, 
	vbabka@suse.cz, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bert Karwatzki <spasswolf@web.de>
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
Message-ID: <anBBhmBSwLgcLjht@dev>
References: <amth-CMf3Xz5hR32@sirena.org.uk>
 <20260731075644.20215-1-ojeda@kernel.org>
 <am0AjzHc0m03CLVa@tardis.local>
 <CAH5fLggke1Yvv8btJSMFr5tEquydvKev8_7G4gSO5MvoAJUE3A@mail.gmail.com>
 <20260731220137.GA3307698@ax162>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731220137.GA3307698@ax162>

On Fri, Jul 31, 2026 at 03:01:37PM -0700, Nathan Chancellor wrote:
> On Fri, Jul 31, 2026 at 11:14:42PM +0200, Alice Ryhl wrote:
> > I like Nathan's fix as well.

I don't really have a strong preference  this, and it would be
appropriate to fix this in a way Rust folks would prefer...

> > Not sure if it needs to be done in the merge commit, or if we can
> > apply it as a patch to char-misc despite the unknown CFG_*?
> 
> It would need to be applied at the merge of the two trees because
> CONFIG_KVFREE_RCU_BATCHED was introduced back in 6.15 in commit
> c9f8f1242a4c ("slab: don't batch kvfree_rcu() with SLUB_TINY").

What do we do when it needs to be fixed in the merge commit,
mention this in the pull request email?

-- 
Cheers,
Harry / Hyeonggon
