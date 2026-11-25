Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615880;
	b=TA+FxLWjZgS8E/x8ZalQrdKAVGUZXdQuFz6mCsLYzNZ41U0I7pR0LMpbLSaB0mKmgQM0
	 1srMMZ3glBx2oNxGUQw7pbKkqJMsuaDL1WTXCZEPDyqT2wMJ49sgXoc9Hla6IgGRvHwby
	 2GRN2NRGpAYq5tp8PJlHW1e8ZhbQFymZkhdE7J+nndCC2EQnuw6aTraAEAaXmMt3cW7X/
	 g/aNOswLB5cCxZpRds+YzLpiu0d3QLVo6IStaQ2oEJnoWCo441k5E+af+Bbncd41kFMsl
	 uh2SujGrmVF4uyak8sIZMdqfnoie8MyIuv3Nou0aE3/evaDn81rm6ak8ZkNtK/cjFbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615880;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=+i5ssGR5sNI3C2N9fU4v7fX1PODn5s6kS2Fhzn4uA00=;
	b=vrwMt5RYdhdqqulX3WJr2dMZQrpa68M941e1gxcc/d7qinTjXQ0XVVTpy1/AQsUkRSly
	 1PNVb5pPQZ/ITl1KU+iICGSIbohfNZFbY1GrVJG0guv77+386J/8QmSvHzZV91EfmklFa
	 FVjq7Tbrukbk2XZCxgoa3o1er6LX7f8esPvKuZOPvoMog5e3IufHGIu6X7dnCqLrNF53u
	 BBeRm0yAfJuviy+hOYU3IEtIWEj/OHgMX2+95GY7m4vXtXcLZu/RSn3vC+qc3PcG+A+HP
	 aWb1bL2aDwRdSsJp3uZ5pGTj1GmR5Ew1ckPnTt1XD+XvWCzOooEsDZFfd/eKDky0K1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g1Y07DsS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27411606A680;
	Wed, 25 Nov 2026 14:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g1Y07DsS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA171F000C0;
	Wed, 25 Nov 2026 14:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615879;
	bh=+i5ssGR5sNI3C2N9fU4v7fX1PODn5s6kS2Fhzn4uA00=;
	h=Date:From:To:Cc:Subject;
	b=g1Y07DsSO+tijPVOlWYC+svIwoCd8ADrQ6my0cNQHphk+PH9VoVclhNc97BmY/Wi+
	 RJVEpbnBjkDo86rZpp2HQ31xiQ8SOACJQ08WoQ+UULC3LVquV/fPT3rwFL8XyHdmZx
	 8aWdtMec+GXEB17QgRwGctrWz4AqMF+WZrxB48oKPE6BsFzwrS+Pw50hE06XykTbtA
	 uofB4jLd/NRHrXd00yNdo7VsNte9NtRS9xJJO0kcVGm2i717UfpieyqUTt9qRLJ3vz
	 IpK9XoV/jcTKhfE9Su3H3UAT57Wm5EHo0r788yE+BzTYg9O9M08ZjoxY7nXMUmbbt+
	 ZGt9zD38onqkw==
Date: Wed, 25 Nov 2026 14:11:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbsgyEZchSwLxp2@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="knwI51e4SvPxW6xY"
Content-Disposition: inline


--knwI51e4SvPxW6xY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  481710ae49944 ("arm64: dts: imx95-aquila-clover: Keep DP_PWR always enabled")

Fixes tag

  Fixes: 3f519121e120 ("arm64: dts: imx95-aquila: Add Clover carrier board")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--knwI51e4SvPxW6xY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7IMACgkQJNaLcl1U
h9BRnQf/fz/6Y60ySvJEyYVbsmVUuHQgSf21aANajEOcuw+G+e2hnQL+KoCxKLEn
lW8+WAsd1GZEBa5up3E48d8STMUy3eBmVkdz91B23ke0VwifryWFovG/z5D+87Lj
EDFK56LNQMbwrSSxbJqFRADqxvv0UrLPocIWq0fKy9g6hC5HI2cwtqQJsEeOY/jR
6X9BcuBRRfrAOpRTk0T7Nby6QAqGB2wB2wVP0kEh7w5Nm2yltFjXa9z9DqMIIYy7
Pah9lulcBAEgNkaEf34Ykr6kRHc1+pPcMWC5oCkPVQhxZevpYkamdKlQ13qsnQ9m
5jLnx2zoIuEunRDOUlB93XISXjr0oQ==
=C/qX
-----END PGP SIGNATURE-----

--knwI51e4SvPxW6xY--
