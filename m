Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458149;
	b=IgGuspBi3dS0VXZHah7ZQWtvbWMTr68HtP0365VMkpgmVjVD+13AKMPoB9QmZ2MCb1Y7
	 KsL864aPBbDzek5DPNJB+w9pf++5Wgxi/A7nf94vXGtW/xGhVSZZoBwjtEPOrDBX+8pot
	 AC6MHo09OcJV+q8vfnz89VUYyeocPEnpeh5bnUMdgtpvCKEc/XycQTvvZVPaK7tKLUhpe
	 hq03pTnfhPVIzkey3yMba/gvc9E5FadTdrQtnDAq/ttGceJ4PEFV1DBJ13ym+Ld55Y82n
	 Ng5wUArIjpWP4fWISvDFTdY3yN7rx5hV3y9892OuNRm9PsbR3+HhZZlNrW7fE6LSPVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458149;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=Xyjruwr4MbdArRquZ6WIyKlfzT3nVvOgUFaDrodez+0=;
	b=5BLi4OoePanDvYUZ5LUAMgv5uxhkrM1l2OTgv4rtn0PYLlypK6z6PImu3zdmStW9xrK6
	 1DhgY0sCpgIIq01UIha7nzo8kkH9NzuAVGaQK9O/we15fk2+FnWGZqDbszq1fDoXugcz6
	 7YGEWoKNMaeiCw33YSWeghMzphK8bzMwIRc/B7whyxvt1ybNc6Kzdr8igZ4JYfICs4WqF
	 bbfbTgip7XoAcpQ/LnZX5b25hwg2dGmTQbZ7grJc9hIN8iiN0+Bv9AARt+PKI7haOCnZc
	 BOaVC3PB/Jy+Bgue85tfjwkE7jfEX8iqM5MvyB5ZG1K1yGh/zQEMM8Hxscn+e5VZBNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AQxX/AnL";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B877B606A331;
	Mon, 23 Nov 2026 18:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQxX/AnL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC891F000C0;
	Mon, 23 Nov 2026 18:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458149;
	bh=Xyjruwr4MbdArRquZ6WIyKlfzT3nVvOgUFaDrodez+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AQxX/AnLStDMxL5foDTjuAU0YvowDPhbYNiM4u0Ez+PFpCCFxnor4LDWZ1P1f92Kw
	 DRq6LG8wsyS+ubTHT+w+L4QpbRkBLdwpwyv7q8CDdEmf/CyENZihB4oXxDNSlJwCO+
	 8l/OnpkSSdz18JDLpGDOg2R1SfddFaPZ2c6KAAn17sL6IlsNL2svG7Wlxi9nC7FdRG
	 XWc+3azNkQ23MLYBPsSSxKvyRWjS5vjgOFwilwfRryO46Zyu/fPTbks8yiR7J223Hk
	 arheGWRk8+Nm16unHOEsIevxyc7XHNgSTcG8Rg/xt9J4/aT0qdA+tgfHQD6hBA/48A
	 0bqGwSI+xyzfA==
Date: Mon, 23 Nov 2026 18:22:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhang Rui <rui.zhang@intel.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the thermal tree
Message-ID: <03320894-97d4-46bc-b11e-5fec18146963@sirena.org.uk>
References: <au4SKRePRjYBItxx@sirena.co.uk>
 <56328964-8d06-452a-adf5-ea37fede069e@sirena.org.uk>
 <782a33af-566d-406e-9f4d-52d80cd3c756@sirena.org.uk>
 <70a066cf-533e-45c8-9db7-e79727dc6c44@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="5vXsJeC3B2o6+2iQ"
Content-Disposition: inline
In-Reply-To: <70a066cf-533e-45c8-9db7-e79727dc6c44@sirena.org.uk>
X-Cookie: Brain off-line, please wait.


--5vXsJeC3B2o6+2iQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 10:18:31PM +0000, Mark Brown wrote:
> On Mon, Nov 16, 2026 at 10:17:14PM +0000, Mark Brown wrote:
> > On Mon, Nov 16, 2026 at 09:51:27PM +0000, Mark Brown wrote:
> > > On Fri, Nov 06, 2026 at 05:45:13PM +0000, Mark Brown wrote:
> > > > Commit
> > > >=20
> > > >   115b4ff52cd35 ("dt-bindings: timer: renesas,tmu: Add SH7305 suppo=
rt")
> > > >=20
> > > > is missing a Signed-off-by from its committer
> > >=20
> > > This issue is still present today.
> >=20
> > ...and you've not told me about your new email address so you've
> > probably been missing some of these mails :(
>=20
> Found another address to try.

This issue is still present today.

--5vXsJeC3B2o6+2iQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsEhGAACgkQJNaLcl1U
h9AClwf+NurXSsMQoSNylFUDI+GEjETnpyaNaKnRN7csrERbj3HGSsaqTt8kCdjA
0zN+/zfrxwr+JbxG30mgE8cJ73IOfBiDmLXXEm214ZAEelEw+hbfP4x1DOsjT4Hs
U3wy5t/8nVIx4p3KzwLn14gow/uPEdTwRlcV2f4Ul/pfu3gJgYiwwpc/ai9DAC2Z
OtHsqPcsszATMtlvxmEwIIRtlMl+sPdyYbACYysyYb2aRHjZSSOQOMhtOSlbQUqm
0qJlRWg4h8+AGt+Zf2r0GFdB2cJ0XszCBjiujcA6Spv/fr2O0UxJVkj5zQc1xNvZ
vmHuPoE2I+vg9WSeD9RY2TntNLPkdg==
=vt/+
-----END PGP SIGNATURE-----

--5vXsJeC3B2o6+2iQ--
