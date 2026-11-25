Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616026;
	b=eKKM4x6kzTrNuEt1Ffm6mFB14z+wzD1Q4k08XiuCtU9oDKeVDqOHqriKV+LD5HDlqz2f
	 N693D2vo8xQ0vC2PJ3SDCGUgK0N2qRgDddB/aadDGBVIXpXYs5EhanbDxDxUM3RPNRdh/
	 /rRW76hktpLEmUxgWdcw5RwesjKZkgeufHtzS5Y3mXNJqeSAkMpzeXFirfZF0Gl1ocmO8
	 iHnPI9xmumSqsWr+QMuiCly/6YDilRP7ELckuiPpfKPWJjF46dKdm/RiHQaT8NhA0IktK
	 8GXL8Q+apncGhevcdiMvjSEitkxQe2F12moP3+PJ3nWH15cWCi9CXE5QMui49snfH4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616026;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=VaSarvD7CCjwLHnhsDSg14x+xn10/hyeK4XfTkS+f+o=;
	b=ni3Xj7zgzPjVw43WXoK3kqJ+zEKbh44GGvWUefdapkDL5vgVvnbEiHx1ygiCWXAb7KO1
	 WOKm0UyiWPSfbSPqtQ/LUcdNq6qB5EmpwJx8RNj3E/2VGZWXNT2belvFIYhNs8a6gAqvX
	 BcKOmeuYr/4k9AVoVLRFgPLKoeRaiFmO5roQQ7Yyq13tEfXxO6OLrrdstZaeznu8+vMbs
	 wDA/ZiqMLROpkX9rpmwamHgZgDL3k3PlRcE3u6NhmnycU3/j6QKA9b97MN8M6gJS7jHys
	 IT9CpzW+dxzsN4CTeO7AdssmaYr4yJVG9aW0A0KX9ea2ODiC0jgAZ2p8UTXzOgdO8lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kXIWknA+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFAE606A326;
	Wed, 25 Nov 2026 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kXIWknA+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F02461F000C4;
	Wed, 25 Nov 2026 14:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795616025;
	bh=VaSarvD7CCjwLHnhsDSg14x+xn10/hyeK4XfTkS+f+o=;
	h=Date:From:To:Cc:Subject;
	b=kXIWknA+gpegjLRR8OhE80fvFahgvj4YJ45XfeGNrEd4yOe/lgXS2Y4SJPBj/3DRi
	 doOgGAjnApmV6HpiDdhvmDYBufMn9XDj9n87bbPkkjVnQBt7v0E6IjVTtrYf0KjMOZ
	 VVtb/9Y9+sJjQyGkdVRCrRdwhskN9d1LE+OvmjHQgYStIOMkg3li09uYROnWnBVNRZ
	 2PB7lZrLHt6BxwN2fvlT02y5dac+yN6onWa9wFvDak4b89WgZwKV+v7Vf94eNsUm4W
	 NpNN9p2Vb1DmrrYNO2wDOagjLSEfuK8NHz8Od5P8LJQpfNLIVT9SM+wwz6yHkphsZ9
	 HV327ALRr2bYw==
Date: Wed, 25 Nov 2026 14:13:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbtFpEvTkCXEFsK@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="XjUhcewBQY7xuMwV"
Content-Disposition: inline


--XjUhcewBQY7xuMwV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  b4087f46936a0 ("arm64: dts: imx95-verdin: fix i3c2 pinctrl group node name")

Fixes tag

  Fixes: 676d7ce22f00 ("arm64: dts: Add Verdin iMX95 support")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--XjUhcewBQY7xuMwV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7RUACgkQJNaLcl1U
h9DISQf+KJBET2zThwuTUFsuiGYprhTQ8C+S4BYa6/5F+ItUsApY+Wbv4RY2VLE6
TgB5UaMzTT76NJydsvQ+5zp/QaEfALBNTZZS9sk1qikajTzqSgyUaKlVRcFzTL2+
dqWdepqVXo2x0KSgpRfFhKC4hQ8lrU9UGvgq7lZycUaI9LPWN5k0gsZJq+mQaB2O
+YBdQqnBJdGiTqK/O1hDFSGmJ2PaRewo+2FPbEQEmUxVAhb7HjmbcZxkBTpeVRW0
r4jizym2KOG55H2u6qdtZ6XihSC65MHKEek9zBDrxld9WlqoV/qSxm0IRXhlpw05
gI0MbfHB0qIG/h9LzZQssWzad52ooA==
=QgZ5
-----END PGP SIGNATURE-----

--XjUhcewBQY7xuMwV--
