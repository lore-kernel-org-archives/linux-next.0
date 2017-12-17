From: Benson Leung <bleung@google.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 chrome-platform tree
Date: Sun, 17 Dec 2017 14:15:12 -0800
Message-ID: <20171217221512.GA93482@decatoncale.mtv.corp.google.com>
References: <20171218075720.56d2cc7b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:32862 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752540AbdLQWPR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 17 Dec 2017 17:15:17 -0500
Received: by mail-it0-f43.google.com with SMTP id o130so3570777itg.0
        for <linux-next@vger.kernel.org>; Sun, 17 Dec 2017 14:15:16 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20171218075720.56d2cc7b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, bleung@chromium.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Mon, Dec 18, 2017 at 07:57:20AM +1100, Stephen Rothwell wrote:
> Hi Benson,
>=20
> Commit
>=20
>   b2104e654703 ("platform/chrome: cros_ec_lpc: remove redundant pointer r=
equest")
>=20
> is missing a Signed-off-by from its committer.

Thanks for the catch. Fixed.

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJaNuxwAAoJEB8J9XsKL+ZYYVgQALHVxL1N+7/uqp8ViDVa7gtN
85xgCZixwketayMpzlc/D0XRjXgIeGW6wdNIIcf34tWsqko9EC/k2GmwhrTj6xz1
T93ESnvaG+4B9HX3XVoXCerAnaAF3dYpWEGUcdC3LhOyfjZxHagmeFB88j1zgS+k
oqcRWWUM8Kq1pusWNy4D1ppFDB77YK/qbVdusYKmQ344i/i3E0TnI9F4wTnJZSGV
x0jPAfqlOd8ICuIpVa56GuNR4KTwAWv7JYU0A+iwhNhnwRkPDJM9fbviA2IXlWrL
Jq+Lux64s9g9mtw3m2hlU+JUpF9zxgZSoQACfkkIB4LQnO6NFYgWyQbBP/3Xf9wn
yl4WBWNH1HiOmiox/hq/cu7J86Af0rzi+dWRoT4514pZKECbYv8eIfOdxbnhC81O
EE3BaWcGukvTeFb6iWWuuHvCtPA1LBQ4myvUNpWQrld5tC1P9ZuviF3aHfhcFP5i
X5frSD3DM+g8BdwtRIEIUxj9AhBP9mv89JksYtspUKMisIhy83CxHnL+5JM+j2e5
epM29uL+5R1zpyJD84G4sFXmh4mq02zZu+DPZpo34Cft4k/kJ1HKazuR+CRmZF9F
CCBaZ4Ft3QkfdZ06EIyM1d2C/Dce443EauBvFTUWciUigOw9gMIqLbsPxCTzvyoL
N5UYvaRKOr63QZqPOPQo
=im64
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
