Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025770;
	b=K0qB2MnBmGnL8zvaDYnQhK4IsZmZQkAqq1bBdlosTCUMeTAU5JcQSr0fek7ddcfFiAmJ
	 mgjro32cW5RggBM2aV/B4tfgCzsvR29GN2ZZK1/By9omPBZ3I4XeYYP/XyxQaY8q5PDSm
	 5z0a8441xBZVi7zbgznYMaDnC5X23LTQ+BOgNvSrH/i15QREcclttZeieoalbVgzTKsP9
	 pN2dsekibggB3v43qrLxQPggWGOoIghQ4kPL5LEkXFlOhkfSsOZJ9uIyAJxJ3QtBJtKoy
	 XDOri0mx6cO8cd2rNCuwSDDhXIOA/BHsKqFcMTFrT1DB0uZZU8dD3J7wI/bVXINrQIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025770;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Nujw8ZBuy30Jkv42Ki62QjnZNoO5iKnjtzRAfIreqEE=;
	b=lpdtXcijaV6XalS+InUspdXu5EXLr7K/N0vdHcRsLtcivpwoYYhiLT1skkYmWGVAKbAt
	 Mhsv2IeOwDJuIZOlk/+yRSnCeuEFfjRvVPdXVytQk1My3l7LqjljTG8hS/ed4y37yFIxv
	 WZFjHCeGZ9OsQdDgEPnkB/7eCatIW8qsNqxB5XjrEyG6wfA6W8bOMTI2MVACIp/lilCfv
	 v4+ULDns7P9btBkeI6sJWQ0AsyC5MKF5cirP+zRKEBtDBcP2ckBfHhS7ihgypihCAWrKg
	 2pot1lSye8RGO1btlOZmLTeMIgtTNuEI/Jcp6r+o6kGgkSYBm5xzF793DtpL59eWffw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wv7kys3F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45626606A320;
	Wed, 18 Nov 2026 18:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wv7kys3F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D75D1F000C5;
	Wed, 18 Nov 2026 18:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795025769;
	bh=Nujw8ZBuy30Jkv42Ki62QjnZNoO5iKnjtzRAfIreqEE=;
	h=Date:From:To:Cc:Subject;
	b=Wv7kys3FiT9kucBMu49jB0QSDETv0SaouMwA64RlBI6ptRTihIugg90gsw7YrZx9P
	 Yciq5qzzPzwAGBMZK/aVJu6q18Fh9lMCiR1iHAN3X0CuZYnZuTcsOj0IVa70/+hJMR
	 vPNZqkYLjv81fMsSEgKKJXm0+sZeBBtPmiWD/HhW6cCVsfT4HKmFClqltdV7nuMFeA
	 gFKXg/5wx0Gixj1JRgC8Bogwz+4iaGoeztr+ZPNiEvnlvSRo+QDxiX9J8VTJ7WjQnE
	 2cxjjIb8+MjTDOLFzwpxhphxJGrh+mhN/fFLbMozZ2LV1bO1nUYI6LNOiHy8IoPXzP
	 SCPbI1C+rsEIg==
Date: Wed, 18 Nov 2026 18:16:05 +0000
From: Mark Brown <broonie@kernel.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: HOYOUNG SEO <hy50.seo@samsung.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Stanley Jhu <stanleyjhu@google.com>
Subject: linux-next: manual merge of the scsi-mkp tree with the scsi-fixes
 tree
Message-ID: <av3rZYEmB8CYNM6N@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="aKdo6aIjWKKAd0Pm"
Content-Disposition: inline


--aKdo6aIjWKKAd0Pm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/ufs/core/ufshcd.c

between commit:

  6da1bc55c060b ("scsi: ufs: core: Keep clock-gating hold on failed W-LUN r=
untime resume")

=66rom the scsi-fixes tree and commit:

  7693e76c9f8b7 ("scsi: ufs: core: Limit early link recovery in the error h=
andler to runtime PM")

=66rom the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/ufs/core/ufshcd.c
index c9b2eefbd7b0b,56a77f4a2a6ef..0000000000000
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@@ -10659,15 -10678,9 +10694,15 @@@ vendor_suspend
  out:
  	if (ret)
  		ufshcd_update_evt_hist(hba, UFS_EVT_WL_RES_ERR, (u32)ret);
 -	hba->clk_gating.is_suspended =3D false;
 -	ufshcd_release(hba);
 +	/*
 +	 * A failed runtime resume leaves the W-LUN RPM_SUSPENDED, so keep
 +	 * is_suspended and the suspend hold for the next resume.
 +	 */
 +	if (!ret || pm_op !=3D UFS_RUNTIME_PM) {
 +		hba->clk_gating.is_suspended =3D false;
 +		ufshcd_release(hba);
 +	}
- 	hba->pm_op_in_progress =3D false;
+ 	WRITE_ONCE(hba->pm_op_in_progress, false);
  	return ret;
  }
 =20

--aKdo6aIjWKKAd0Pm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr962QACgkQJNaLcl1U
h9AUBgf9FWqT97YowkPbNAmetjkOzsA6JlUAD68H6RQKLY2BObcRzTTULER7c9sV
CR5yXpMlIt42QK/T5kw8RYoJPc/w9ZUBY4dYpFNNcFzMnYdKSfmDV8cD20eY8S83
LK7Xn4hE5S/JXRcaQLLhkluoSYeX9wIhbcTWpdWasFXMuYoDPmyrYlv4poHZj3LT
mGeMNkm7QMhlsl9sPILXgl4O+Dxp64Zow1sCFDyZFxrK6yAK5erYU0idb3mNLWnB
qBUHYSLiNxasvLP7uKe/FNKKutH7spmbXesnac+HVBprRjfsXgmcFKApiiB5NdCd
LdIOv3Q+UvJG4rWsNrzEYu6xMw0cKg==
=b171
-----END PGP SIGNATURE-----

--aKdo6aIjWKKAd0Pm--
