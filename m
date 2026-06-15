Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF51409611;
	Mon, 15 Jun 2026 16:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781540464; cv=none; b=uzkvEETr8NizpkOPmNDC3hPMKambRsFl2hFOv3bmdj7/HR4jPUrFyLcX6dVBhEhy7ZeAbgmd4OqnyZCsVAfYPa9wBL3xNXeemY+mzzYj4N3oa4TIRduEQsUhIzV9iCzLCCw316fMXrXCpgcO8Msx58uFe1QXpcYzQ9Uw27QcPr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781540464; c=relaxed/simple;
	bh=APVbIJKYTu+g50zKGZqnGTdgmZ2uVf/cv1C8qv+kSbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pt+j1Dta7EmpNwW5okDrT2dR0BP0dzcHyuKsZz0q38GjZJ6ZfRCgTFe1NMCgVqTKnxXGDWNkxevDsoof7ED+q5zYqTQX5nh5sGRVl4FWWiglxHnePqE7X4bnk78UTiaGDBSu4QFnYkoDUkJU8s9/6cA7RBRN/UJw4uQLcm40LXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YMPJY18W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YMPJY18W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0206A1F00A3A;
	Mon, 15 Jun 2026 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781540463;
	bh=APVbIJKYTu+g50zKGZqnGTdgmZ2uVf/cv1C8qv+kSbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YMPJY18WeMK8WDcLSj2SEHpjpz0wxUxvDexUpNMqJ3tKKwT2n++lGnBHF1NzBBBFC
	 GUfEj2U2+PpYYJnbFASeK67CJ20smiFm19nMz8TQyfu/7Wze72oUxKuKXqGiNCI2Ns
	 atV9tLMaX61QC8Vyzt79qanVZGUO421++1BAWaqWqxlY98/X5Jtz3Cz74ggMUz7jxD
	 3a2SHGfKzgdroXw1H8qsydun9LNpberH4IlZtK/wHgJuAMiss6L/kSqUqOL3j59kIX
	 L4Qt3iF3ev3hC6jnKG8WT4ilf3FC5sWLJ3N4D2pE8rPZMNAzFPia5Ch9gqGPpR2Eir
	 BjqctGBk7/u/g==
Date: Mon, 15 Jun 2026 17:21:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in final build
Message-ID: <db5fa87a-d08b-4339-aa07-193a7ce67d5e@sirena.org.uk>
References: <ajAPjq6j3hjx7dBz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s9z2DdL75YfrZIVe"
Content-Disposition: inline
In-Reply-To: <ajAPjq6j3hjx7dBz@sirena.org.uk>
X-Cookie: To stay youthful, stay useful.


--s9z2DdL75YfrZIVe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 03:43:26PM +0100, Mark Brown wrote:
> Hi all,
>=20
> In the final build (x86_64 allnoconfig) failed like this:

=2E..

> I have ignored this for today.

Actually this affects everything, I have used the version from 20260612
instead.

--s9z2DdL75YfrZIVe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmowJmsACgkQJNaLcl1U
h9BzTAf/fcG4CwXjvOZBIHiDi4bIU3KNT2Za+XuevN2x/a9/P9EdxUUFPMDgUVJL
VPgKn63vJTp0S0MliebiKUYHwT0uFn8xHmUv9R6LKJyy5BZ78utuBHC9i/hocR5s
nbSPYimVUTI/8iGBB6GH4O/c7yHR4T8owCSF+/GqwL6MTbfB5YNvMrlZW+/W4Myc
d6CNrsvd9p4Ndt8HQ5e2u7UwkTgNz6di+TcfinXwUXohcoIFTW6PQSQ7CowefZRH
4pShXmnvi/Xq73k7hzoZlWBCnIOGTbxcxzvt1OtPuXTNU2/piWysceYdcuNTte+p
NFkHivR6nMvs4fxbG/irdUqiFqkntw==
=5PUp
-----END PGP SIGNATURE-----

--s9z2DdL75YfrZIVe--
