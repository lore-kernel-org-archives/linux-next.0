From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: block tree build failure
Date: Tue, 14 Apr 2009 12:35:02 +1000
Message-ID: <20090414123502.766da661.sfr@canb.auug.org.au>
References: <20090409133716.12af28e6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Apr_2009_12_35_02_+1000_pAq7zJb4YUGi8kMB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38968 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751463AbZDNCfJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2009 22:35:09 -0400
In-Reply-To: <20090409133716.12af28e6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__14_Apr_2009_12_35_02_+1000_pAq7zJb4YUGi8kMB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jens,

On Thu, 9 Apr 2009 13:37:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next build (x86_64 allmodconfig) failed like this:
>=20
> usr/include/linux/fs.h:11: included file 'linux/rwtypes.h' is not exported
> make[4]: *** [usr/include/linux/.check] Error 1
>=20
> Caused by commit 93fe0305df9344f57edfa0444f8764b34ea74f9b ("Document and
> move the various READ/WRITE types") which I have reverted for today.

This is still there, so today I have used the block tree from
next-20090408.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__14_Apr_2009_12_35_02_+1000_pAq7zJb4YUGi8kMB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknj9lYACgkQjjKRsyhoI8xdmwCfUxzzECSIdcLP4TM/lAvAbjnn
04sAoKZkZvkvHG6Mrmhqk4GNEXckKEzO
=nHKa
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Apr_2009_12_35_02_+1000_pAq7zJb4YUGi8kMB--
