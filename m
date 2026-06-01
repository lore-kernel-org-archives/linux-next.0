Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3431C3EA976;
	Mon,  1 Jun 2026 18:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337849; cv=none; b=Orql+63Fcv9wpGkO/XBbYewuGMoGn3xacU48y4efAhvZ6bXYDX0ZYzoq0BuSRL5qcJjWUyVGhrAT5ZnTBUmg7bgFxb0ntSTPcdIXtU35yd0ynEJLuthnTkudOTGHgGlm8XsgdiyG0AcBDPqnrxMUQ+l9zJBbPnG9Wz+/jlfwUqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337849; c=relaxed/simple;
	bh=QzEqTRr76jLKT26L/xLexPaVVq5uAtXCd8dKKQPRbJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmhLNheiCtvbh0YZQrAk+Hga39kWgBnCbtzA0c6WEVUpSjMHP0FpaoGvhOCnc7RS+JticIB5nxvMS7rG/P6vBokn5aCe6FBTb2MAIxwvuEvsDBIPyeiDDwTOC5J0LHUU/Et+Y6+6S8I5TRBhF3mo451zwbDe0yJRl5px/iy4Bsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6HDW22Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6HDW22Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DAE1F00893;
	Mon,  1 Jun 2026 18:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780337840;
	bh=ixpQcw+HtQEmf+Fa0wEWveYR5hyiCUr3HU4oh7PD7DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n6HDW22Q1BnGWMQICkJwgR8j7paQlIJ8hC+/iokTDbFULb3TLdouzvp03UDKWwNhW
	 JJlAi7Rj+M2qz2WkJde9ug0ifMCcwhL9+d22hhUmRC8Z2kfAxvjSYY7OygZ5cD0hEp
	 hsqUSj9JfxwRiJ/01MBopYmaxN04trN/9/88jFx3BhL7jbXa9IESc98shV0M/eUfHP
	 DcA5uMsie4BSTW8NK5UcVHT5eVUX1X8Ry3D+vo9CGVGS3qyHjPOIczl7wVR4LLZFB+
	 qxzsi+Xvs+9RWbXoeVk3ZqYOGvrEy81o2Z4F/2HhbiZ4LQmjQM/M5Q257L5vrLp+I5
	 LTVJ/Ep9NPmNQ==
Date: Mon, 1 Jun 2026 19:17:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the bluetooth tree
Message-ID: <8b8bf682-f3f4-49d0-95ac-13a541e4596e@sirena.org.uk>
References: <ahgu-mbRz65nDwb3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MEIVUc4pWM73LSsg"
Content-Disposition: inline
In-Reply-To: <ahgu-mbRz65nDwb3@sirena.org.uk>
X-Cookie: Filmed before a live audience.


--MEIVUc4pWM73LSsg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 01:03:06PM +0100, Mark Brown wrote:
> Commit
>=20
>   4fe5ea11ac728 ("Bluetooth: l2cap: clear chan->ident on ECRED reconfigur=
ation success")
>=20
> is missing a Signed-off-by from its committer

This issue is still present today.

--MEIVUc4pWM73LSsg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodzKwACgkQJNaLcl1U
h9CWpwf+PotJP+aVcJtZLmHf1hueoJ0cQyX4MloEUnOCxD/y0x4XN5kamdtAh2ZH
Yq9y3wBPbUXjWIWGke2Wx7ruzfMXNQo8uKLwItZy5x83QDDtWnV2qfN6EgjL4idZ
PXQ+SZ9fBX/F0OGPnddAk6dCGGpPFyFKAkxKL9x8/EgSGVglg4OBo4kwLwEhaIYc
P+ypKvfx2/hrBUpLYm3sXU+Aoa53Fs9gTnQKr60YzFhmV1j10NvDnJIV0F31FyRI
UixfwrT6UhtGnTafVZYDWTN7JjzzVQFXHYomJKCsLvP9jJx2juhP5z0ueM4KwuTz
DfUiUQMS6OiMLF67STIpJuTKzgkfFg==
=BMg6
-----END PGP SIGNATURE-----

--MEIVUc4pWM73LSsg--
