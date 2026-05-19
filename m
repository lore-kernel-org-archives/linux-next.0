Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5C8409608;
	Tue, 19 May 2026 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207888; cv=none; b=AsUorT+mGByQ2xQX8WXWzJJoLsNz6nXD+px23x4OrOnb2EuofYt6OAghDu6T1l6aIl6d8paQ62DurdO6XMhv5Btt2yRa5LL/lLTcnocN+gHpWrz7TvKLBQnqqyOx+LeiVnT0xxnaVFqilGHsUme4/jm3ATYKt0CBHjUhAqIw37o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207888; c=relaxed/simple;
	bh=VGrGJXezDKoNsH2G+4i4JdIokjMi+z4YLA/sSJ15mJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETgvWT6agQNAAfzp4Dk2+j74YtYIgfoV3I85qiZQH4U9PMCPkSh6DSgH4R5RjjLqXYLS9GfQJtmIAuTBlYBEf3grI3OhsZRkCgVlZVueos+cdqp9IoN3s7WwJ6Y82jy0elmad4sP4rKavUgv+dkveR823rxzUBd90qkD+C8kB7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDUR47pn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDUR47pn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932E3C2BCB3;
	Tue, 19 May 2026 16:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779207888;
	bh=VGrGJXezDKoNsH2G+4i4JdIokjMi+z4YLA/sSJ15mJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RDUR47pni1bugdVCjss+0eCBQJNDSFsVzN2MThvqiKsSH2ldp9yNqhO6pRDvTfA2P
	 33d7Mt7/Fl1/fFj0yo0ZWEBGtCbtE7mqJNZLlGh0f+GBWPHsrENTdCXb9QzBCOJ45U
	 pYQtUcrVXV5BTELvOA5rWeTJMsvBrW2Ml9AAwQ0PdkwtfQqmDtOQMMopZCSOZnfL1Y
	 DUwb8Fw35Vrd21+0VpD233Emkjrn25noaPTU6RK/FCMD5y0uHSMzgwNH9Dk6fRRfPA
	 Bd6BDSPIhXZQ9KZyURCrfnrRRtSqPIQmcfP71BSSdXkncCHSkAc0A159uoKaClLYT+
	 CdvxyRK6z2k3A==
Date: Tue, 19 May 2026 17:24:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Jori Koolstra <jkoolstra@xs4all.nl>
Cc: Dorjoy Chowdhury <dorjoychy111@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	Aleksa Sarai <aleksa@amutable.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <4bd253fa-c363-43cb-adaa-0248ac707a0d@sirena.org.uk>
References: <agruPPybCx8q2XcJ@sirena.org.uk>
 <c34d1f0e-0707-40cc-b0c7-7b2648ec1863@sirena.org.uk>
 <CAFfO_h5QdRG2ptyuGRQtqxrpndwan98aOsX92bvN4hyvpgLPMA@mail.gmail.com>
 <e221b631-00bf-44b5-865b-ac970e6cb11f@sirena.org.uk>
 <1286370201.1726989.1779131564699@kpc.webmail.kpnmail.nl>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L5Ti2qdlEtv5fGeK"
Content-Disposition: inline
In-Reply-To: <1286370201.1726989.1779131564699@kpc.webmail.kpnmail.nl>
X-Cookie: Huh?


--L5Ti2qdlEtv5fGeK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 09:12:44PM +0200, Jori Koolstra wrote:
> > Op 18-05-2026 19:13 CEST schreef Mark Brown <broonie@kernel.org>:

> > Figured it'd be an arch specific version of a similar thing - I didn't
> > audit them as you can see.

> These confusions with octal numbers in lists that aren't even ordered is
> why I would prefer to use shifted values instead. I don't see any reason
> actually why we should not just convert them all, apart from churning and
> perhaps not doing it correctly (which would be bad). My rationale for mixing
> was to use 1 << n at least for the remaining bits. If I remember correctly,
> this is also what Aleksa preferred.

Yeah, shifted values do make sense to me as well - other than the
inconsistent style the only issue I saw was that it's a bit less obvious
that the values collide.

--L5Ti2qdlEtv5fGeK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMjssACgkQJNaLcl1U
h9AEtAf+JtRW8gRKqAZeS3BhGmfjWJMbI2nwTqSBuNkko/LBUfioRoPzOsptGkn0
MnWDEHgKGbac5/c17MbL94Pi4Rvmejetlsm0hheNy7LLiT7Nyd9bmhkLWuvJPVIb
IjwQZFrRt9NWqgezFiTAUBXv4l5DZiBxXl29AD/8Xze8add3FBbJhZn6uDiJ47/4
8+HONbRX5UGsMUlHYEai8J1i6Yd/gSPUiQoJdZaGSEmd6LJKaGLgnszCg0LbvPOO
jlbZx8Ro8OuLCXq7GDpg22orkPeau+Gx/gNzBYs5KnFyy6T6btsNK83viN7emBAE
F7VuKCyrI2yGqgCHqNfEEIuuez9Jgg==
=cRF+
-----END PGP SIGNATURE-----

--L5Ti2qdlEtv5fGeK--
