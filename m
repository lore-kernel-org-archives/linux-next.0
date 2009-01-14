From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unable to fetch nfs or nfsd trees
Date: Thu, 15 Jan 2009 10:30:28 +1100
Message-ID: <20090115103028.44016344.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__15_Jan_2009_10_30_28_+1100_I_efPu/.e5=xeC.H"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46977 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755291AbZANXak (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 14 Jan 2009 18:30:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>, "J. Bruce Fields" <bfields@fieldses.org>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__15_Jan_2009_10_30_28_+1100_I_efPu/.e5=xeC.H
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I was unable to fetch the nfs or nfsd trees this morning due to this:

git.linux-nfs.org[0: 141.211.133.37]: errno=3DConnection timed out

I will use what have fetch previously.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__15_Jan_2009_10_30_28_+1100_I_efPu/.e5=xeC.H
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkludZQACgkQjjKRsyhoI8zUdQCfYBZP2BAdhUOkeQ2lCNnjOQU6
uuoAn1V8LCwu8lvVk/VST0DZ+iX3J8Do
=4rfs
-----END PGP SIGNATURE-----

--Signature=_Thu__15_Jan_2009_10_30_28_+1100_I_efPu/.e5=xeC.H--
