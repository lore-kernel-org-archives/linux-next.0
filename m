From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: wireless tree build warning
Date: Wed, 22 Apr 2009 14:45:37 +1000
Message-ID: <20090422144537.06937b16.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__22_Apr_2009_14_45_37_+1000_AvmtiDNB89TDX=ut"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43380 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750890AbZDVEps (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Apr 2009 00:45:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "John W. Linville" <linville@tuxdriver.com>
Cc: linux-next@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>

--Signature=_Wed__22_Apr_2009_14_45_37_+1000_AvmtiDNB89TDX=ut
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

Today's linux-next build (i386 defconfig) produced these warnings:

net/mac80211/mlme.c:1771: warning: left shift count >=3D width of type
net/mac80211/mlme.c:1772: warning: left shift count >=3D width of type
net/mac80211/mlme.c:1773: warning: left shift count >=3D width of type
net/mac80211/mlme.c:1774: warning: left shift count >=3D width of type
net/mac80211/mlme.c:1775: warning: left shift count >=3D width of type

Caused by commit cf4473dfd0e7dbe173be994fe226f88c48a02dd0 ("mac80211:
implement beacon filtering in software").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__22_Apr_2009_14_45_37_+1000_AvmtiDNB89TDX=ut
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknuoPEACgkQjjKRsyhoI8wa6QCfUpVxf59FEwh94OeojUGW72fF
7PUAoInEiXYmUCsnQ6PsYdv7pVCxBhWE
=ZgyF
-----END PGP SIGNATURE-----

--Signature=_Wed__22_Apr_2009_14_45_37_+1000_AvmtiDNB89TDX=ut--
