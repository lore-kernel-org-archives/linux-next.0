Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9243E6DCE;
	Mon,  8 Jun 2026 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931469; cv=none; b=ggMuWmKObzgm3ItcQ6zYlOdYQCcI7PyFxq52cSZ75dw+9rVqMCyZBkuNRHMMG3Mtca+UAsaCr1YYTcN+UMy83v0G4sxqO6yWkodfkGHfIy8bQUmZNKjN86MlGF9kEY3wQzady8+docmI9ENR37TZCV/9dOgnnmcVidcDFxm0Ges=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931469; c=relaxed/simple;
	bh=Et+xoY0vZoRss6WJQZ8Mbx73re7hUm5MrYcWJNYAsWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHKDMBpXADk+3MHjDydFABTpayP6sedMJGijriZe3XnYfroev3qrfKjdc3mEd+mJ4WH01Lr65Ca6ubEqAK4fFNQrMfxT+rX9j/CNJmhU6Zwk2S2kp+r7bP6s+4yBULU7KmTvIq8aP8SRO8+ICthjWC8rmgVgPNtwKYdcgrli/H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVPN5oQV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVPN5oQV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB1F1F00893;
	Mon,  8 Jun 2026 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931468;
	bh=Df12vVdmPlkLiATWviS2vOZWFCSwgBPFrDmuElA2rFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TVPN5oQVNjWhK2sYS1u/hleCyZCFVJx9E4hUL07oaJO016mHQIWly215gDZYaTgWO
	 Yy63qUJVWoPZFIHuNVx7EI+IHfTSIPuKoSJeRZ3RWS6ZSP5BWYEDrqZTC8Hps493fu
	 aA0EWLt8HymjP5B23FrfC/KMA3l9ugc14zQF2mZ4SSrSjqaqVEeJfVtnaCudHlHSH6
	 Gp41b68Rld65rxcYpYt84V2Fsxuzw5HfVzuAv0sTzXLZWX/Z+NwRoRJ6xOGhsv5kGX
	 0OjROpyEmp1iBqKTXwitdLr2vdDCl2vDkB3+dhFL06BFphn317nCYvq8juKyzoQOh2
	 GA0aK4bL/xyVA==
Date: Mon, 8 Jun 2026 16:11:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the bluetooth tree
Message-ID: <fbd42b73-2f0a-4269-b4a6-fa98c6aedc51@sirena.org.uk>
References: <ahgu-mbRz65nDwb3@sirena.org.uk>
 <8b8bf682-f3f4-49d0-95ac-13a541e4596e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vw+ugZebSvToFf3d"
Content-Disposition: inline
In-Reply-To: <8b8bf682-f3f4-49d0-95ac-13a541e4596e@sirena.org.uk>
X-Cookie: Programmers do it bit by bit.


--Vw+ugZebSvToFf3d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2026 at 07:17:17PM +0100, Mark Brown wrote:
> On Thu, May 28, 2026 at 01:03:06PM +0100, Mark Brown wrote:
> > Commit
> >=20
> >   4fe5ea11ac728 ("Bluetooth: l2cap: clear chan->ident on ECRED reconfig=
uration success")
> >=20
> > is missing a Signed-off-by from its committer
>=20
> This issue is still present today.

and today.

--Vw+ugZebSvToFf3d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmom24cACgkQJNaLcl1U
h9BtYwf+PnM5lzmEPZ+mShPc3fLPl3DP82zq3zxxMh9WPWVaL3/4UEzDP8hRTGOM
Sh0LhLea8CqXAcuWXAKHrd7fjH/UMDfzGjqxIuh/g+jPFPwAIpaIKTf9oi5kCyMY
yA/d0m3Rn2ZdfV+5cAzqx6ohU6fhqZVmoiIfD8YtkdWU7Cnxa3b1MDDPiCYoJziM
o6J7OOSUWJSmH33U84oCbtJHDf0dhIPkXd2++oENqdVe2c8r9fuWEXKv0I7zASnA
9akjqHKe+BHs4WQvBDyCA5XUF4GwfLMQTu8ExMEJzweufPvoTN0229o26z9056e6
uM3AOayAtQLZxHUwIo+f4ymAHlR2SQ==
=KhGG
-----END PGP SIGNATURE-----

--Vw+ugZebSvToFf3d--
