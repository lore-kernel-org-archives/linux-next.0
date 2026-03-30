Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C793921ADB7;
	Mon, 30 Mar 2026 14:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774879584; cv=none; b=hYnA8VeApwb3TWFYQDqBSR1mCHYb8Em87JrK/UjI0nBagSPZV9iFDz/hgCD3VB9MAS1pOBI3DH0XrqUwWmrzwmNAtjUoppCpjeemFeBSeO7JGLqF8ToYFNXI7hUhibE+i9TfUCtkPcMAv8kbnvrRtGQ18AUkTH47Ciu/gNcEGSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774879584; c=relaxed/simple;
	bh=DCZi16xLgxQOQUHwvhsvWU0Xzecg89HpYzP88P+efUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=huxB7weNHD+nzGoCyXRxUAzzCFtJ7blbHJZDj2ADDbLAL3PJCRANQAft4SrmEPljXc2TBIg3AmEnOfyoKOqXT2rzCaDlaaBTgfgnB+ar6FPGHM7lsSR/tFRm9vBMbuaHYUiS8715FhWUEF7vCXcB6dTqM3yzlVkQowXZ5DPlnrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r619sdKU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r619sdKU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E21C2BCB1;
	Mon, 30 Mar 2026 14:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774879584;
	bh=DCZi16xLgxQOQUHwvhsvWU0Xzecg89HpYzP88P+efUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r619sdKUVDtkaCAmscUI28jeCPpVXtojWxwYFYRl0FCbhYtnen3siMD9MQCDYZj1a
	 /9zf+okw1iHa2iuSdVJaluV6o7PK0PwxGq9L0Wgw9u5mGRfOV2F4iu/aQ+3BZFKPQV
	 7wI161ZAMBqO2Bumu0KuXzJ0wGloHLwNWezC8cr9gW3S5IlWdS2cLUWnzMiI8/qKuf
	 lTqk4zmVL3bn+nIerX4wE1zjaLaUwmHZdvY8R62pKpY0KRXlX0bkbAO7nYNvGciM31
	 qkufhX77A6LU/DH1up+chm/W/bH2TrbIU7oucammFVfulDSFXvTDMuT/fzlF5OeRox
	 ftH70hFWGo5AA==
Date: Mon, 30 Mar 2026 15:06:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Simon Richter <Simon.Richter@hogyros.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pci tree
Message-ID: <0e1a5161-ca49-4fad-9ef3-640236c2600f@sirena.org.uk>
References: <acbrkFFGPIVppK0B@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5CktXxqkuU+l7jRA"
Content-Disposition: inline
In-Reply-To: <acbrkFFGPIVppK0B@sirena.co.uk>
X-Cookie: HUGH BEAUMONT died in 1982!!


--5CktXxqkuU+l7jRA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 08:41:52PM +0000, Mark Brown wrote:
> Hi all,
>=20
> After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:

This is still present today.

--5CktXxqkuU+l7jRA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnKg1sACgkQJNaLcl1U
h9A67Af+MFApCqGpf4h4vz+b05Jo26ldvanUF5bcpvxvzGrzbwEoYJxlyATU+ljF
4pQd5qKss8+Kh6ZVTlIqPoshzAvwkojTkmUpx3KUkTqJFOd5mLsI/S3UlYEpnnKh
TxGlP9IXKiM3jHSZO/aCpJdpkO2tCcLG/t/OQRVIhMZMYh7UyqyHLgcYvJkipb9U
waOWYieSG1rGNcVKEt16ms6AwBhCtXIGgNm4MDd8dvUkRIkG/yAANgdduIIJ8Zol
pH/lh+Zx2P+R7EEQv8YUAspjtqDaiDfYoCXg3zMttYeimNlQEUSpAW428WcbdX5t
/aTZPnTdSxfntux+CPdtBVn+ZhKrvA==
=NpvE
-----END PGP SIGNATURE-----

--5CktXxqkuU+l7jRA--
