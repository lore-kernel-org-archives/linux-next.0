Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9729B3A640F;
	Mon, 30 Mar 2026 22:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774908705; cv=none; b=DEBbtThNsfs5d4WEvhhRDxQayCgLt0/WSK6SXcs3nK+TJxxH/XkiBjWemfAN5AP5RRc9fYitJqUrT3pCH8ZNQqCEXVFc3+gRE6sG/EexliAeJeu9ovNtYFUh1t/8milLhMj7kOWO3cmFM6NSwPMclUh7B0Ju9aa/sDcUXpSd66Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774908705; c=relaxed/simple;
	bh=wpHwLgClr4DBuGBt7N2y0PWUeDI6oyZBL48l2NqR9Jo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipxIyGlVWKvEGbv/YRXBTjmn+igz3x792ZVNtriYbZG3RV1Xjbo6/bJGYO4dm4VzLH0gfTOAJjRI8Ny6E6MKkin2NAKdwhnyDkbFefi2qW46M6J7neP67n+1BEHxDNyreQ4v6A9vKa3IORWGtN1VBZ7rgTtGxqtK2NEDIJoq36A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/NxYWUN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/NxYWUN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A00C4CEF7;
	Mon, 30 Mar 2026 22:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774908705;
	bh=wpHwLgClr4DBuGBt7N2y0PWUeDI6oyZBL48l2NqR9Jo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/NxYWUNd8g4CfXDlRq7qCJ/ZIR/vQtKgnYfSIaQUlP/M7BiqYdksO+vbOgJOm6TS
	 jOC54fJOh3wzCcw6K06WlNidBsW/3yZWoWHh/K2n19fUcdTp4XJ/d+l5XnQtAmpk02
	 4PEu1CziUq5Wq8C0hi/TBu35Zv7w1sBq5/TEOQWiizIrzPfSnpbnaAzeWpYjOamAd6
	 Nz5jAM4qJ/CvCwryafLU2aRhMnoBsLZRCkNXju5QtbSa8DqdDZi1shT8snrw62/0tu
	 IFPL4CezE1KTa2Wv4UHZ25Rbr3wEcGOBjlH21FkBMCDkiwLHhojULOZhpZ1wmq7JIq
	 uX6Tx50vapFiw==
Date: Mon, 30 Mar 2026 23:11:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the rpmsg tree
Message-ID: <aee116cb-6335-47e0-8634-2ad208f4fcd5@sirena.org.uk>
References: <aarBm-e3NUl9XnY8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pb14nQJO1aWdpb+M"
Content-Disposition: inline
In-Reply-To: <aarBm-e3NUl9XnY8@sirena.org.uk>
X-Cookie: Two percent of zero is almost nothing.


--pb14nQJO1aWdpb+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2026 at 11:59:23AM +0000, Mark Brown wrote:
> Commits
>=20
>   390045a24591a ("dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali=
 CDSP")
>   0af8802175d2d ("dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali=
 ADSP")
>=20
> are missing a Signed-off-by from their committers

This issue is still present today.

--pb14nQJO1aWdpb+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnK9RwACgkQJNaLcl1U
h9B4Iwf+IhLYn1mZ/5BJdbGibtOUNpPHiMlwyuGzMgcgi/TrIFjFBAIkOzDS+WmD
c6enRgeICoCQGjbZNV/SRwdFb9HLF8juiAn4BS5R4EUOWvR0VbsTvLrh47+8Ovt2
+b4ggXmbjO+Eyi7eLKSZSIGB8+CXDMCv5LbOcRjkWdNJy8yopAgsgkVGnojq84Cz
CqjwljQn4V2AeMDwMc0TdMjf/0AZWgWal0ZcOBiGnRz4W6wdtCfolBsYuzA58WLo
Ou0/Db1z4a8dLcCGCMZ+vcZIUf7ikx+FDrHZ7e+9f9+SfmfW11v01A6Cl177xQFB
69Cmhfap8kXCiJAeihUxXEiyDu4ODg==
=WWku
-----END PGP SIGNATURE-----

--pb14nQJO1aWdpb+M--
