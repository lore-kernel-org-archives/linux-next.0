Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDF53D7D70;
	Wed, 18 Mar 2026 19:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860909; cv=none; b=UZvNR0Qyqp3QO+w9TuvPZ07jnx3dURpgxnbpVf4zFUtdcUtJO6AMxV9uY2iNVUkdIAIsEHzO6KIIhoscTiVUcTY9j2kpRP5xCB8LRFzk61TytxMaasUApXr41hKQ51znQp67vy6EAn8Bi/08ftaiNTTFkbcIwOBT4HDXcMvWxgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860909; c=relaxed/simple;
	bh=4c635ByKKB8h+jvuMjY1GkQZ5DofyEBnDp4MPKYzvxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1NsK7RXyPRdGOxel0NxmMzeH8Qybf/Rm7u7W7h3UG6rysI8CiJGLV+iWlEL9hUQvdSon8DlcpsZyQv5rHnKNGgXimmehXzyyDqxhWLZOlKgt8gF4ruU7zPPri4cjseg+VOn4WXycnGDN4bw/IEGS/RbelsGMj1orXuKMBREfqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DszX8MXZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DszX8MXZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E6F1C19421;
	Wed, 18 Mar 2026 19:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773860908;
	bh=4c635ByKKB8h+jvuMjY1GkQZ5DofyEBnDp4MPKYzvxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DszX8MXZj1X9nigHmx/ekhkElxJVeRdWsb/97/nf0+lGiadD6brLchtcdx/qtwGI7
	 +kX5beS84M6bQDf3z7V/lqGHMJNMsmEHZR0iYHgGWQqbRmBG//FSuXDBQiMU+HKgYG
	 CrGokH4NAiCmV0NQBwm8ng8huPaIIRBa0ObKdXUSzD20c/WakLjIeFAEEJKq359m4Y
	 eQNH3X+sgPIJ2ng56W4lsgylOAys3yg05S9K/V3cpXXJQ1wIg57nonXJ56fXaV4/yt
	 dnhF2by7sWJAJW22a32xCuN6uWTv9h7DjCDkzsIEcoP00nvnwQdanylzzEJcYcRnYj
	 qFU5Bc7XEl+iw==
Date: Wed, 18 Mar 2026 19:08:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-unstable tree
Message-ID: <885f722d-a639-4a62-b810-2e0cd6c15867@sirena.org.uk>
References: <abqtxbX0eW1Ljdhx@sirena.org.uk>
 <20260318112001.d67d0e84a4d69b991f0f97f4@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="itlC+aPBtizBp7zY"
Content-Disposition: inline
In-Reply-To: <20260318112001.d67d0e84a4d69b991f0f97f4@linux-foundation.org>
X-Cookie: The coast was clear.


--itlC+aPBtizBp7zY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 18, 2026 at 11:20:01AM -0700, Andrew Morton wrote:
> On Wed, 18 Mar 2026 13:51:01 +0000 Mark Brown <broonie@kernel.org> wrote:

> > Diff in /tmp/next/build/drivers/android/binder/page_range.rs:762:
> >      if let Some(unchecked_vma) = mmap_read.vma_lookup(vma_addr) {
> >          if let Some(vma) = check_vma(unchecked_vma, range_ptr) {
> >              let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
> > -        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
> > +            vma.zap_vma_range(user_page_addr, PAGE_SIZE);
> >          }
> >      }

> > Caused by commit

> >   320e410f0294b (mm: rename zap_page_range_single() to zap_vma_range())

> > I have used the tree from next-20260317 instead.

> huh, is this python?

There's standard formatting for Rust, though it's not syntactic like it
is for Python.

> --- a/drivers/android/binder/page_range.rs~mm-rename-zap_page_range_single-to-zap_vma_range-fix
> +++ a/drivers/android/binder/page_range.rs
> @@ -762,7 +762,7 @@ unsafe extern "C" fn rust_shrink_free_pa
>      if let Some(unchecked_vma) = mmap_read.vma_lookup(vma_addr) {
>          if let Some(vma) = check_vma(unchecked_vma, range_ptr) {
>              let user_page_addr = vma_addr + (page_index << PAGE_SHIFT);
> -        vma.zap_vma_range(user_page_addr, PAGE_SIZE);
> +            vma.zap_vma_range(user_page_addr, PAGE_SIZE);
>          }
>      }

That should be it, yes.

--itlC+aPBtizBp7zY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm6+CcACgkQJNaLcl1U
h9DMmQf/S2OGR1tE6V0SBUi8kN1hAWQhPEnkuvD8KR5cwyUhvPgOIrhu95rcQei0
Gy+9cDUOjMnUcwUWKcdx8K9ykVj6X8OUnUeCsps+JvAnQFUYaeXdtxIM4AMDNtzs
7IgcLmaq41DeMNgufeEgixamPKgC+hQANgy0jNnjUUyJP01t4eMZLmyNBT1V7NsJ
pGbGsauHAibgtNyQnbuAw/WcalnGOXOEBnWqW8JT87KLsWQJUY1B70PqBf8s9Hv8
2QfVNHdPPN8ykVPSYWeDTeg4im9pBGQyCbxwiExC/gBN87nWOgYIgoh6nRmjLagm
xYpBp9agtFpCBBA1jyzACRz+cSq4Gw==
=xLPy
-----END PGP SIGNATURE-----

--itlC+aPBtizBp7zY--
