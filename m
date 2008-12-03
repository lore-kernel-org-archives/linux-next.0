From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: lblnet tree build failure
Date: Wed, 3 Dec 2008 16:22:02 +1100
Message-ID: <20081203162202.01a3088f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__3_Dec_2008_16_22_02_+1100_VKzPR+zBJ4VJOV3L"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37162 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750765AbYLCFWP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Dec 2008 00:22:15 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Moore <paul.moore@hp.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__3_Dec_2008_16_22_02_+1100_VKzPR+zBJ4VJOV3L
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

Today's linux-next build (x86_64 allmodconfig) failed like this:

security/smack/smackfs.c: In function 'smk_unlbl_ambient':
security/smack/smackfs.c:386: warning: passing argument 2 of 'netlbl_cfg_ma=
p_del' makes integer from pointer without a cast
security/smack/smackfs.c:386: error: too few arguments to function 'netlbl_=
cfg_map_del'

Caused by commit dc9d06d6226e4855c50961940498427acb4f9866 ("netlabel:
Update kernel configuration API").

I have dropped the lblnet tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__3_Dec_2008_16_22_02_+1100_VKzPR+zBJ4VJOV3L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk2F3sACgkQjjKRsyhoI8wqZACgjjy3R29SkpMXRO1DZMyUz6PV
XPAAn0AmKBelxapJXhR7B6ZN31EKoGLY
=7c7I
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Dec_2008_16_22_02_+1100_VKzPR+zBJ4VJOV3L--
