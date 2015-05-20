From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm tree
Date: Wed, 20 May 2015 16:31:56 +1000
Message-ID: <20150520163156.004a883c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Bh_AQdISdjgmj+mOdlY55kj"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56720 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751934AbbETGcG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 May 2015 02:32:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>

--Sig_/Bh_AQdISdjgmj+mOdlY55kj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/gpu/drm/i2c/tda998x_drv.c: In function 'tda998x_write_avi':
drivers/gpu/drm/i2c/tda998x_drv.c:647:3: warning: format '%d' expects argum=
ent of type 'int', but argument 3 has type 'ssize_t' [-Wformat=3D]
   dev_err(&priv->hdmi->dev, "hdmi_avi_infoframe_pack() failed: %d\n", len);
   ^

Introduced by commit 8c7a075da9f7 ("drm/i2c: tda998x: use drm_hdmi_avi_info=
frame_from_display_mode()").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/Bh_AQdISdjgmj+mOdlY55kj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVXCphAAoJEMDTa8Ir7ZwVqqUP/joBd/Plfm56J7ut4XtAyZk3
GoahkbiIVJOrpJfdFDdv/HI8dItmBruDpnmZESiDvtMs05nBE6oJoIhzv1YRyeh2
HHzL+C86qeO/RZRrR5+th8scwOj7pfyVsKmoNok0Oxs8le5VHvjJ2GvfdNDQAI5N
lvrP9hjgp1SfA9uZC95Gf+Tk1vwzw1LbhBxclXwG++yuEnBiUplDUZ1f6BULfcWZ
kdAq415Nb0tEY7ogbJXDltR5odp5etXL33+2nrrblOTcdKHHY88iUja6nQrgHAC4
a3za3dDZbhjRDqQrjRl7SFG91yY1Mne5lE2r7lbpP+OyMpWoQrSUa739i3gamDYo
TluUKhv1mxh3kMTvF6iekHZtVZmfxUEsHQNtFoZR0pEiXFd3Pe9rSMASmrA32F6b
GMXyyFFBkgutBIg/FXZtVFFjkcXSh9f8MBuLVtPJ6+5GG+gpVJQZ5rgWKkYgnR2F
fRoFmZEb4gE9bgN6jLKPD1KlHmpsFk82Po0ZHN415QMY49dRiJ9Zpf41ZIxBrv0o
Jc/qu/QsyJ+rgRWd+uMuLyO6plszP/INRSnKD35SbkNhgtQAQhdC2TxKmDMGJtCX
dpKpGxtYlx6teZGcpozDDagGwbSjZrt8KRNA3hbbT3evhYyvcYtguQuZmNw4JJcW
JSsA9zuZrmbJAByBmugM
=voGI
-----END PGP SIGNATURE-----

--Sig_/Bh_AQdISdjgmj+mOdlY55kj--
