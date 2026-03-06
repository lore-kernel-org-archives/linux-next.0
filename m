Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DAF1A6821;
	Fri,  6 Mar 2026 14:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772807341; cv=none; b=AmI0nwXp9a+PuqLVJfG251j+iaAbK/5IQHUc1Bw/YY1CR/umZzCJ3cHKR7oaC5sPdPl8GVGXcKD9B9l5GH9KQL+9fQPtru+vCrpGbuxQ0Jm2kKROrhv6URcJnU+BtEhflSPn+UM6LPxg/aTUOxjSaUhBGwcGRHCcw1Ola4rTI+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772807341; c=relaxed/simple;
	bh=YtNiMYnwE8YcuPU7Pu79/HiaBUNg1xHyKb0YQ233szw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvK3U2asHKtEKojz2OoMM1UL6Vcfy6fpdPKe79C3Jtpyf+HvjCdxMVJuSMX2adIfHyQPHtdHr30IsASwmxfVny2BJ/UrVnbibIBxrm+FBG8bBgrkxr9KAE051T6HbY+7h1e2kFvPeac37OJ3/1Mj1mdqIbkWoxPgfYOI9maj16c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M/6vnMft; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M/6vnMft"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F6AC4CEF7;
	Fri,  6 Mar 2026 14:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772807341;
	bh=YtNiMYnwE8YcuPU7Pu79/HiaBUNg1xHyKb0YQ233szw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/6vnMftdhh4DPnkgEMcArC33MHbYenhcl+rtYzCewSebX2Xns7B7gczMvKIzG2Ad
	 XaVGE0N4RqN+fzsOnoF23dYym10fvbNJmC+pWhIEQF2DkDXTL8cQtJ1hR4Q1doxumA
	 n+R4prde7DXSDYYqhj7YclIfpYRKIOPi8EnbWAJ4bZTgwFtXgpxjt8mTPR1fid9Uto
	 zMgXMq3ijskxbSTuPZeiQtM55mvCGbOM1+A2SLl04/Lya3AYgLC06pJ52asU/6wQg7
	 GuWkK9uEbKMm7YRwc3wvGJrudHMx0SPzf/lDSwL3wQzTuiR6zyGCMggtyptljgzjkq
	 hL7kKVJxupUdg==
Date: Fri, 6 Mar 2026 14:28:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-next@vger.kernel.org
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <e7a09f3f-777c-446c-aaf2-0e01ec45b48f@sirena.org.uk>
References: <aargMJFh-37NAsbc@sirena.org.uk>
 <218A0752-97E0-4291-99B3-6D7D1283A513@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0HObocPonmNFMU3t"
Content-Disposition: inline
In-Reply-To: <218A0752-97E0-4291-99B3-6D7D1283A513@kernel.dk>
X-Cookie: A nuclear war can ruin your whole day.


--0HObocPonmNFMU3t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2026 at 09:13:33AM -0500, Jens Axboe wrote:
> On Mar 6, 2026, at 9:09=E2=80=AFAM, Mark Brown <broonie@kernel.org> wrote:

> > I suspect I ought to be applying a merge fixup however since the block
> > tree obviously isn't intended to be in the state it's in anyway I've
> > merged the version from 20260305 for now instead.
> > <signature.asc>

> What branch are you merging? rw_iter is just a test branch. Next should o=
nly be merging my for-next branch. I=E2=80=99ll check later if I messed up,=
 if the above commit is in my for-next by some accident, just drop my tree =
for today and I=E2=80=99ll take a look later when I=E2=80=99m on my laptop.=
=20

It's the for-next branch, the current HEAD of which is the merge
e356b1868a62cf4a650b451a7296ea4762038666.  The first parent of that is
the fixup commit, the second is a merge up of block-7.0.  Looks like the
fixup ended up on the wrong branch perhaps?

--0HObocPonmNFMU3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmq5KgACgkQJNaLcl1U
h9BvEwf+IYCy3J2F612kYVimtC3cMOGHd0s98KxTWFMdJf6Dc//wcGTin/wuwJ6v
EnqtsfOCJGct+JWs2gPw5w7i/DvDRL6NKHIEIG9WUgQg2li1xlEpSL0aot7SEYpg
amhaW3D9XtjJ+lgivhabm8tvwpFCSvC5zyYPVGd2n3/KKtbgGW1qT3jw1DL0Z1FF
fkbJWpj493grq2SHGXfiDcKUoz+g9oyHM6T5J+zUTQvW9xeg8sZpPgGKfJbnmx0N
xxWiw0Px8WgWz67Nc94W5zrvjQgqZS941Usu0wfR8ijWmsc1taSDGb6Xbpuxq5em
82T+dMFB7Ou89KTOoydApRlV/qcSHw==
=Yfld
-----END PGP SIGNATURE-----

--0HObocPonmNFMU3t--
