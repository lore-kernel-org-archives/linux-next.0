Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC0141A923;
	Mon, 24 Aug 2026 13:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577560; cv=none; b=iiHxaiPiCLux4Tc81Na5GD+NjmBZXxSwbkzrRLu61mK6GAe3umtbM89gqGVsf7BdTRVneTJ60+pTbeK/mv06TxHmFR3bsxxI5JyJpjSThpBkcq+7ccDR+lmp+sxXQBvcZCwD/bTNYGCEZFWNg7a4JkL5UMAFhGfrChFflJf+rWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577560; c=relaxed/simple;
	bh=li8tVXcZNvTDlhe+eni2pdRUsTgApEBLDH18fdkJmb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glCVUb7NnvePm1ftqN2qOBP87vcnEn88rIGda9uCpmtl0OLDW8odX5xPXWeTAlQWPeHe4hLGTIIqFSWpJT2GxbUry/X/AKNQG2x2pUNxbttooNHv6UonfQ/7QASU8WBHyJ4ZCWIywjVzSpk8kuV7cyoDHuFga9Txwhkis/TkQjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vvmx1EKm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vvmx1EKm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3BFF1F000E9;
	Mon, 24 Aug 2026 13:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787577558;
	bh=uKJmp2eVeM/70xOWghr/gOJhCKwN8UEtE3ESYkUw/mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vvmx1EKmytyvaSlxfLqt2W1UxBVuYB8EcmkTY7mkYmkeaErtN3YQGLZ/8G0wZu256
	 T1s76ui2sCv3/Xj7Q7H97YgDZetpKGx9sQ1OmTZ+l9Tjj5oU37RW21QXLnkExm3T1P
	 6weXuBv/E4K+gJLjk75qdPWbhSWOMeBQHZJ9P7fGqICLox0k3bym7vFV7I40kfipwm
	 vfPUa86YJQof5VvITI2GUue3GGMIzENYbBFxlWd7+TneAzMyd7Gi/oEqAy29JnRULf
	 GnGu/tM3RDbVLDpxJdhHryujC04CpMEHlZerMGjChUoPlWCJ+vqT7xDVwHJId2ddNl
	 2GFEP/llvwuPA==
Date: Mon, 24 Aug 2026 14:19:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the risc-v-fixes tree
Message-ID: <f9762405-0d05-4b83-b04c-c21097239861@sirena.org.uk>
References: <aog9BzBzb-2Yfgyz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dLTWKClOqoR7VIQc"
Content-Disposition: inline
In-Reply-To: <aog9BzBzb-2Yfgyz@sirena.org.uk>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING


--dLTWKClOqoR7VIQc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 12:56:55PM +0100, Mark Brown wrote:
> Commit
>=20
>   3c98c44748385 ("riscv: patch: skip fixmap mapping when kernel text is a=
lready writable")
>=20
> is missing a Signed-off-by from its author

This issue is still present today.

--dLTWKClOqoR7VIQc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqMRNIACgkQJNaLcl1U
h9AwOQf+Jh/R+OElCX753Gflr90ENMz/GeP3a+IC+h1IqP1yZNoZQ6y+bZ/uewFG
LJi8l6IZNEhK4/miw2xu8uKwN5aqwvt9CaXh3V+lwrPRyg43GnOvbbRnTY5iBLlU
oPmIJdjRU/EyQXnlN2O5kZALwRq1V66feqOB/944ezw4490OFZKoJ/oAHaeLlc+d
+QLKhS/9eEoShBQaEVv9M/ANPb6U9KG/dfds294WbmVSpmAFQ2jED0DLSL3ai9Vw
UsRQnw3ytqxRxS8FCf7UWe1ZeX2ctVAgqWTN8nGAFLVU6Yp59C2QS4LbCVjNzBrg
65LTqjRyuH8mcknXVxl84yYyf+D6vw==
=p1Mv
-----END PGP SIGNATURE-----

--dLTWKClOqoR7VIQc--
