From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: problem importing the kernel-doc quilt series
Date: Mon, 25 Jul 2011 10:55:38 +1000
Message-ID: <20110725105538.aeff499a557e3a0f33d68963@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__25_Jul_2011_10_55_38_+1000_TlEVrdG6q+Jc89/K"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43705 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751737Ab1GYAzx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 Jul 2011 20:55:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__25_Jul_2011_10_55_38_+1000_TlEVrdG6q+Jc89/K
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Randy,

I got this error:

Importing kernel-doc based on 3.0.0
fatal: Needed a single revision
Unknown BASE

I changed the base to v3.0
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__25_Jul_2011_10_55_38_+1000_TlEVrdG6q+Jc89/K
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOLL8LAAoJEDMEi1NhKgbsFr8H/3PI1R0ovHVVFvj3kqj0qUEu
dGFDZ+B0aeTWdQOEXbpUYDyCJGlyfM1gfgpy7U2kbyZ/EHTYh/PPIOstGhlewNF2
9bRQZqSf6G+PhhVmJxtfNXujETvaBTTrwYuzGb4bw+JdjrkYFr1lqFZOBAebvvJH
JMbtH2KQzsORh4v8evCAKr4eIq/P3p8oCqfSWzE75Qy6wmFmNtFdVhvwqZgB0ODq
8hJUw0o0Eqk64LSqkC4AVC805Y6lqfyL5uaMhtk5R3ZcB3KmBM0fTF4ufE4LeKmh
1PKSdDsep6towjvZG60D36cXhyzKZTMrTVftIliYuFINNji1iX6ppOoVdC/Hp94=
=MmSB
-----END PGP SIGNATURE-----

--Signature=_Mon__25_Jul_2011_10_55_38_+1000_TlEVrdG6q+Jc89/K--
