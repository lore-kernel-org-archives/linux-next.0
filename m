From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: md/md-current tree fetch failure
Date: Thu, 5 Feb 2009 09:13:13 +1100
Message-ID: <20090205091313.91afdcb1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__5_Feb_2009_09_13_13_+1100_q_LSs=9qxIT1tx_R"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52403 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760731AbZBDWNU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2009 17:13:20 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Neil Brown <neilb@suse.de>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__5_Feb_2009_09_13_13_+1100_q_LSs=9qxIT1tx_R
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Neil,

Today's linux-next fetch of the md and md-current trees failed like this:

neil.brown.name[0: 220.233.11.133]: errno=3DConnection timed out
fatal: unable to connect a socket (Connection timed out)

I will use yesterday's trees.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__5_Feb_2009_09_13_13_+1100_q_LSs=9qxIT1tx_R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmKEvkACgkQjjKRsyhoI8wIwQCfWDo34fq05EGCWGrrwK1UQjMP
NVoAnAtxuxTs/dVd/Fue5oBSpNSWaej+
=5mvG
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Feb_2009_09_13_13_+1100_q_LSs=9qxIT1tx_R--
