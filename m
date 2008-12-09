From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: ide tree build failure
Date: Tue, 9 Dec 2008 11:12:42 +1100
Message-ID: <20081209111242.0898da30.sfr@canb.auug.org.au>
References: <20081208131609.c6e0fd31.sfr@canb.auug.org.au>
	<200812081810.59270.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Dec_2008_11_12_42_+1100_xgg.h8QEiwVM7jxO"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34895 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753488AbYLIAMv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 8 Dec 2008 19:12:51 -0500
In-Reply-To: <200812081810.59270.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org, Borislav Petkov <petkovbb@googlemail.com>

--Signature=_Tue__9_Dec_2008_11_12_42_+1100_xgg.h8QEiwVM7jxO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bart,

On Mon, 8 Dec 2008 18:10:59 +0100 Bartlomiej Zolnierkiewicz <bzolnier@gmail=
.com> wrote:
>
> I see, BLK_DEV_IDECD needs to select IDE_ATAPI now.  I updated
> ide-atapi-accomodate-transfer-length-calculation-for-ide-cd.patch
> accordingly so ppc64_defconfing should build fine again.

Thanks.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Dec_2008_11_12_42_+1100_xgg.h8QEiwVM7jxO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk9t/oACgkQjjKRsyhoI8xZFgCgjwFMxR9HuHgJyAzDVh6hUsir
M4EAoJnrWdZM2ysT79WbJepIP1OLNXrH
=xCVS
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Dec_2008_11_12_42_+1100_xgg.h8QEiwVM7jxO--
