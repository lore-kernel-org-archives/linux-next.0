From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unable to fetch the cpufreq-move tree
Date: Wed, 8 Jun 2011 11:24:24 +1000
Message-ID: <20110608112424.1147e26e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__8_Jun_2011_11_24_24_+1000_Gogvkg7CwxrOEjsT"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33597 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932732Ab1FHBYb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Jun 2011 21:24:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__8_Jun_2011_11_24_24_+1000_Gogvkg7CwxrOEjsT
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Fetching the cpufreq-move tree today gave this error:

fatal: Couldn't find remote ref refs/heads/move-drivers

I will use the version of the tree from next-20110608 for today (which
was empty, anyway).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__8_Jun_2011_11_24_24_+1000_Gogvkg7CwxrOEjsT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN7s9IAAoJEDMEi1NhKgbsRZsH/0nmGs5HbHAvynTvL2msC9C+
N0bB71NkvtdAeveCrkShaDodb9FnaKU9rxGVSkfruYf89jsfr3XWS65HryU70BZd
wAULCHWrp/y1HU31W04H5r/XWRlTk3QxC+Y27tb3dFs2kjgM/MnoL1KKQpij1Ahj
V11wfSRqvZjm2aQ2a4sWwSHiSXq+rR64w8tb/tia1LQtI5zaysnMmA7QZ2EnAYgP
U/VSdZZZhbmwsG/8bi914JFkMjxIknYr9WjOnuQ9+j8HFkzciPczmwkrSDZ80qlC
sZT9BP1CvTbcwc4Qg1k4rLWUhvBm2Hn5IkzGX57DxgO7jLoiLDEnDy7qN3XeJq8=
=/tQL
-----END PGP SIGNATURE-----

--Signature=_Wed__8_Jun_2011_11_24_24_+1000_Gogvkg7CwxrOEjsT--
