From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the driver-core.current
 tree
Date: Fri, 30 Apr 2010 09:35:34 +1000
Message-ID: <20100430093534.9fc6ab8f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__30_Apr_2010_09_35_34_+1000_/ayvj170/D/9CpDO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, Tomas Winkler <tomas.winkler@intel.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__30_Apr_2010_09_35_34_+1000_/ayvj170/D/9CpDO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

After merging the driver-core.current tree, today's linux-next build
(x86_64 allmodconfig) produced this warning:

drivers/base/firmware_class.c: In function 'release_firmware':
drivers/base/firmware_class.c:597: warning: passing argument 1 of 'firmware=
_free_data' discards qualifiers from pointer target type
drivers/base/firmware_class.c:133: note: expected 'struct firmware *' but a=
rgument is of type 'const struct firmware *'

Introduced by commit 6454d23dedf4019fcae868818ae63c755dd42be0
("firmware_class: fix memory leak - free allocated pages").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__30_Apr_2010_09_35_34_+1000_/ayvj170/D/9CpDO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvaF8YACgkQjjKRsyhoI8zBoQCdGwop4mPi9FxVd5pnQ4GEzVt3
PoMAn0B3/L+KSErb2aAe54O/BFv2AX00
=Nvqy
-----END PGP SIGNATURE-----

--Signature=_Fri__30_Apr_2010_09_35_34_+1000_/ayvj170/D/9CpDO--
