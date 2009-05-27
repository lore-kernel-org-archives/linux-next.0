From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: failed to fetch osd tree
Date: Wed, 27 May 2009 10:58:15 +1000
Message-ID: <20090527105815.95bb2a29.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__27_May_2009_10_58_15_+1000_B9.vDmWJSAO7Xafl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46090 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751229AbZE0A6a (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 May 2009 20:58:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Boaz Harrosh <bharrosh@panasas.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__27_May_2009_10_58_15_+1000_B9.vDmWJSAO7Xafl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Boaz,

I got this error trying to fetch the osd tree this morning:

git.open-osd.org[0: 67.152.220.82]: errno=3DConnection timed out
fatal: unable to connect a socket (Connection timed out)

I will use the tree I fetched yesterday.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__27_May_2009_10_58_15_+1000_B9.vDmWJSAO7Xafl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkockCcACgkQjjKRsyhoI8xKtACfYhkFNTwswoIt5Fs7WsgeLdV0
skEAn0SRusc0WjOrY/PR/YjYSvgaGe8U
=0XhA
-----END PGP SIGNATURE-----

--Signature=_Wed__27_May_2009_10_58_15_+1000_B9.vDmWJSAO7Xafl--
