From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the cifs tree
Date: Thu, 1 Apr 2010 11:50:59 +1100
Message-ID: <20100401115059.d0bdb1bd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__1_Apr_2010_11_50_59_+1100_tLGndIcf21WS7aeD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Steve French <smfrench@gmail.com>, linux-cifs-client@lists.samba.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Suresh Jayaraman <sjayaraman@suse.de>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__1_Apr_2010_11_50_59_+1100_tLGndIcf21WS7aeD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Steve,

After merging the cifs tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

fs/cifs/cifssmb.c: In function 'CIFSSMBWrite':
fs/cifs/cifssmb.c:1516: warning: suggest explicit braces to avoid ambiguous=
 'else'

Introduced by commit 5702f749ee6645f70412cfe6408503a735366ffe ("cifs:
initialize nbytes at the beginning of CIFSSMBWrite()").

The cFYI() macro that is invoked in the (unbraced) if clause contains an
if statement ...  so this warning actually indicates a bug.  Those
debugging macros look like a real mess ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__1_Apr_2010_11_50_59_+1100_tLGndIcf21WS7aeD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuz7fMACgkQjjKRsyhoI8wK8gCfQ6hlYEaHt9CstI046s55rUCe
jAgAoLETu8apz1owpgeaZJJAGrBLtBG3
=UgKh
-----END PGP SIGNATURE-----

--Signature=_Thu__1_Apr_2010_11_50_59_+1100_tLGndIcf21WS7aeD--
