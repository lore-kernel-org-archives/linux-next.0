From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Please include modem_shm in linux-next
Date: Fri, 13 Jan 2012 11:10:55 +1100
Message-ID: <20120113111055.83755960f93161d3542e4763@canb.auug.org.au>
References: <CACRpkdYDR4S_P-CUiJoB1bBpESGs9nG+5=Mr5M-5cGF5UkOvJw@mail.gmail.com>
	<81C3A93C17462B4BBD7E272753C105791FB10F9CC9@EXDCVYMBSTM005.EQ1STM.local>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__13_Jan_2012_11_10_55_+1100_unB_bfdUQzEcC43E"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:57813 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756128Ab2AMALE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Jan 2012 19:11:04 -0500
In-Reply-To: <81C3A93C17462B4BBD7E272753C105791FB10F9CC9@EXDCVYMBSTM005.EQ1STM.local>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

--Signature=_Fri__13_Jan_2012_11_10_55_+1100_unB_bfdUQzEcC43E
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, 13 Jan 2012 00:40:07 +0100 Sjur BRENDELAND <sjur.brandeland@sterics=
son.com> wrote:
>
> Could you please consider pulling the driver tree=20
> git@github.com:sjurbren/modem-ipc.git for-next.

That is not a URL I can pull ... git://... please

> I have gpg-signed the tag modem_shm_v5.
>=20
> This replaces the previous branch you pulled from Linus Walleij:
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git=
 xshm-for-next
>=20
> Please get back to me if any issues.

I don't like adding new trees during the merge window.  If this code is
for v3.4, please ping me after v3.3-rc1 is out.  Is the code in the old
xshm tree going to be sent to Linus Torvalds during this merge window?

I just had a look at this new version (I used
git://github.com/sjurbren/modem-ipc.git branch for-next to fetch it) and
there seems like a large amount of churn in the code if it is to be
merged this merge window.   Also, the last patch (that adds the cif shm
driver) you effectively change the module name of an existing driver - I
am not sure what impat that will have on existing users.

I would also like to hear from Linus Walleij ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__13_Jan_2012_11_10_55_+1100_unB_bfdUQzEcC43E
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJPD3aPAAoJEECxmPOUX5FEmEoP/RJTXuRZ4/lhFFWcDiDXpsiO
zpcQo7HndaeTjJ/2uAndaVHZEAnReGA7KMEWgf1fMPy8DFbPFLWV/F1FB1iiFQHn
GnPemCU9hbXZMYJXgkVsNCOJMTGxBvifIajR3J0OxOSzfiHBhHDy85o1/oUEf7Gm
w/nvq5IjRr8RZNjXWQ3kF1g5E2gBJoXFMtofFMacQt+OkjpHQ9Q5kT8cfEjIzDdP
uZhMcm2Fhk7dBlI0okNG1Nk1Pyfu//MZ4kqi9rkRHHiAaMVo/KN3pJnAuMT60lMj
q3/m6KzAjpCkFSt5N11GoX8zSwBNSjf395pdOK9dc/skLESMtDoTb5nvM3Oejznv
D9cUATDyzrAA7qKC8u6r28h5A47gitZXC9bWt9pDnE9Gkp9PktUpJFLdfW/9gIF6
LI+BjuKRdmyVElyRv2csrsDh53lXaFXyd5u8dgxSatwqYlb4vbsWYX0YCHE8tt6v
P7Xa2JPHNM5WDXMJl2FMYF/fxFpRHcTY1FBJeJy1/K09bCojKve1dEYRFbWINIYi
6cdiKY7MKH6swgAc+LwI+wcCJJw73BTswrRakqSAfrEHI29217rRwuKNHNkXsgpt
M6dtbnUU5LnmtIrflk5jz70iEcfDMeYM0KtOv/oK/1MB4L/24CtmkJWjMmVSr+GX
auIF2pPRsrEMulZlHloM
=6LQi
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Jan_2012_11_10_55_+1100_unB_bfdUQzEcC43E--
