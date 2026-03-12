Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556D735DA45;
	Thu, 12 Mar 2026 17:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773338329; cv=none; b=Anhk0gBYmUiFyL6TfzxUupeJmjukTWVpr/WX/ayme6fvRWC9icJ81DEFivH/XEcOl4A3FMHCH3r+bExcOwahRD/EgYK4qNpOT41nnTdSfc6JQyFpkhCfy/DNv9tUf0zOd+IBx184QGIw6mExrQXu0xFlY+zBqPPNQdrivfRDIRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773338329; c=relaxed/simple;
	bh=TeMWIrWTTq1Ah/I6OpMA5e7wdtx6b4ALfr4fq6gCeHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtOgjWInrC8R/xSFvPlqQjnV+IcstvohCpaHUWj1MwGOq32nib2YSCHnGldsCrhnmvFAiEAD2kHCTmts54qxwu0YqHt2xx1lr4Vj1Wsuo1Hiss8gjwaxn1urbrapYbxJ4Xk3ylUlVNdEWGVv/LuMwIhpgSWQ6wNDUhK1vyn7/tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROIHMWwX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROIHMWwX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4B9C4CEF7;
	Thu, 12 Mar 2026 17:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773338329;
	bh=TeMWIrWTTq1Ah/I6OpMA5e7wdtx6b4ALfr4fq6gCeHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ROIHMWwXp8XhCXgzYzS0Bbx0uWGDM14Fe4BkQeMnhYNctg7kmyMVozPHTnSxltbLe
	 DUiVZGZAIngAvQLRoEtcb1cF3wXjyV5hmQ1ATZxRIneuszMPkIHlZubocTKiBDTiPS
	 Sw4CM3SzKH+P0Z8U4u4Y+Bmel+Vv6CsIvxmFabyIN8NgadEdaPMEeDuie3jOl6PK7P
	 a49c1S8YqBwr5R2gdXUbLgNNgWsmj1VsCrROrMl9Wy15DAxOJ6ex21NuesvYeg6i2q
	 jjby00QKm0VTTTqBboDcXkJRdp7m6K0oQLOjdMM1M32S/l29/7ktXNu2B871qNrvv9
	 UcVKMD0vwgYGw==
Date: Thu, 12 Mar 2026 17:58:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Yosry Ahmed <yosry@kernel.org>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the kvm-fixes
 tree
Message-ID: <c5ea3bed-20f4-4c42-be82-f7223dc90038@sirena.org.uk>
References: <abL2MPhXKOn_Zdz9@sirena.org.uk>
 <a48b3130-54d6-4cf4-a059-e576f163ebcd@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cd8z9GiLyLRZuVfF"
Content-Disposition: inline
In-Reply-To: <a48b3130-54d6-4cf4-a059-e576f163ebcd@redhat.com>
X-Cookie: I feel better about world problems now!


--cd8z9GiLyLRZuVfF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2026 at 06:54:18PM +0100, Paolo Bonzini wrote:
> On 3/12/26 18:21, Mark Brown wrote:

> >   -	ret = enter_svm_guest_mode(vcpu, smram64->svm_guest_vmcb_gpa, false);
> > - 	if (nested_svm_check_cached_vmcb12(vcpu) < 0)
> > - 		goto unmap_save;

> The right resolution is to keep these two lines...

Yeah, that was the bit about the prior resolution being wrong.

--cd8z9GiLyLRZuVfF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmy/tQACgkQJNaLcl1U
h9AFYwf/fLjL0tJHjwwDzX4+q+sn4xY5M5yxVHBFwmR1a8xSJ59dIv1RkRNFsIxU
6yqdyy56q1LmLP6XICzwlnsViy5qi8jiHoFkZOMx9MFKrpAXjvpRCxpF7DLmtRNY
IehHHNBpFA7LHDqbsns7j/TULZ1b38Tbj4piAoI+TkPaPnMy+cqWpAjgjH6nCWVa
e6dEMstEcPAsivwa43cfZLBzQiiwE4bQaEtDpw9O8p8ffWDbaIC6g/OY1rt1mrpR
QZb6Bp/JRJ10Xe06QKiFvwzLkgdGAvzFD3+cOLedUfe15Er7DonPG7QHJ9L92FgE
y8tqyX1nt5Qsl9sxhbQW9zp26GJwSA==
=sAAV
-----END PGP SIGNATURE-----

--cd8z9GiLyLRZuVfF--
