From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: tests tree unfetchable
Date: Tue, 29 Jul 2008 10:04:07 +1000
Message-ID: <20080729100407.954c35f7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__29_Jul_2008_10_04_07_+1000_VBUGwaTXeKbZ5RrM"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48568 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752244AbYG2AET (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Jul 2008 20:04:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Ananth N Mavinakayanahalli <ananth@in.ibm.com>, linux-next@vger.kernel.org

--Signature=_Tue__29_Jul_2008_10_04_07_+1000_VBUGwaTXeKbZ5RrM
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam, Ananth,

I am unable to fetch the tests tree this morning:

$ git fetch tests
fatal: '/pub/scm/linux/kernel/git/sam/tests.git': unable to chdir or not a =
git archive
fatal: The remote end hung up unexpectedly

Looking on master.kernel.org, I notice that there is
a /pub/scm/linux/kernel/git/sam/test.git (note "test", not "tests")
directory.  Would that be it?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__29_Jul_2008_10_04_07_+1000_VBUGwaTXeKbZ5RrM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiOXncACgkQjjKRsyhoI8ybJACffXn/EeVdt6qox0eEXTze3aC7
iZcAn1xwX+jVTGQ4vOqdVS9j3+zLmhtE
=Ovl8
-----END PGP SIGNATURE-----

--Signature=_Tue__29_Jul_2008_10_04_07_+1000_VBUGwaTXeKbZ5RrM--
