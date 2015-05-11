From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the staging tree with the v4l-dvb tree
Date: Mon, 11 May 2015 15:28:04 +1000
Message-ID: <20150511152804.24dffc0a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zgQ41NGAIvFiqPj2XDdA9cA"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54190 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751685AbbEKF2K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 May 2015 01:28:10 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Hans Verkuil <hans.verkuil@cisco.com>

--Sig_/zgQ41NGAIvFiqPj2XDdA9cA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the staging tree got a conflict in
drivers/staging/media/dt3155v4l/dt3155v4l.c between commit cc11b140c3f1
("[media] dt3155: move out of staging into drivers/media/pci") from the
v4l-dvb tree and commit ec80e2428046 ("staging: dt3155v4l: remove
unused including <linux/version.h>") from the staging tree (which moved
the file to drivers/media/pci/dt3155/dt3155.c).

I fixed it up (I just deleted the file from staging - the
linux/config.h patch needs to be applied to the new file) and can carry
the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/zgQ41NGAIvFiqPj2XDdA9cA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVUD3oAAoJEMDTa8Ir7ZwVlywP/i32XnqO4pu6BMSpwc846HZa
zFW3HZ330braGVBUNEz5T9wF4CBkH7tZj2MkkHqg8aadCE5cCi3y4bp0Lq3wxGYp
jacThZtSNB+OcuNiiwWupCjglALO9DZAByua7b/j0P0zR1x0b2S8CQRTOdXqTLKT
mme9DbZarS8TVx5Z55JF7H9st+evx1ZQg71iOFzvcB6LqWm7QdFT3u1LKj9c8cBk
s+RojLYw/Yy9IRuzM8HVM1DC9A5hErVatkDEPnNIz1hNurIT7/AfbV/QvVyuMyoM
UPRqsQl+hh6KAcy5pRBvFHD8q/94mCAqbZn0RFlkaytf8k+aEHkdjLBlsOOcSLsn
i5+X2twwCiWN4FcjVrVo6fRY1YQj9fcMYt4wvjl1HDyft8MQUOPr4bmtJ0A+s3+W
wwPYQSy7o+VgfxdmifOgevni/jN4GDV7OhWIGC3Ch2kDWBI6QbUiIDDlLdAMh5N6
pKRMixK/vR+mm7d/qZOkp2HTxjIlxQbaK7vDTPcKhgk5RNDHRHCNZK1zUunDQD/8
apSunPq4y/ah3N0hat8CZmy+qsX3oLC8BrM3tmDkeFDLe4NrF0P0smLCZ5VHVuzr
EtwafOTa0U2llS0ZP49ggo/cGYmNmKgc4wk/y6Dbdx/Udb9SDgtlCPo6vRhrA3h7
wszT18LlZs1eB97r3yOl
=vWOu
-----END PGP SIGNATURE-----

--Sig_/zgQ41NGAIvFiqPj2XDdA9cA--
