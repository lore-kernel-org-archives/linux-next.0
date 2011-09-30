From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (akpm tree
 related)
Date: Fri, 30 Sep 2011 11:52:13 +1000
Message-ID: <20110930115213.eb2dbb2074b23c5a990f0f8a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__30_Sep_2011_11_52_13_+1000_rtD3nACw6rw9G6.e"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__30_Sep_2011_11_52_13_+1000_rtD3nACw6rw9G6.e
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, the next-20110929 build (um defconfig)
failed like this:

In file included from arch/um/os-Linux/sys-i386/registers.c:13:
arch/um/include/shared/user.h:26: error: expected declaration specifiers or=
 '...' before numeric constant
arch/um/include/shared/user.h:26: error: expected declaration specifiers or=
 '...' before numeric constant
arch/um/include/shared/user.h:26: warning: return type defaults to 'int'
arch/um/include/shared/user.h:26: warning: function declaration isn't a pro=
totype
arch/um/include/shared/user.h: In function '__printf':
arch/um/include/shared/user.h:29: error: expected declaration specifiers or=
 '...' before numeric constant
arch/um/include/shared/user.h:29: error: expected declaration specifiers or=
 '...' before numeric constant
arch/um/include/shared/user.h:29: error: expected '=3D', ',', ';', 'asm' or=
 '__attribute__' before 'int'

And it went downhill from here ...

Caused by commit 820b1a71d7a7 ("treewide: use __printf not __attribute__
((format(printf,...)))").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__30_Sep_2011_11_52_13_+1000_rtD3nACw6rw9G6.e
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOhSDNAAoJEDMEi1NhKgbsHlAH/3+ETA7wTtKwfEg06+fZlQIx
dqa9ANBFia2/LJtArQ5IjaAmvsjQGXG6QeC4qlkIAASMlUGf3HFoFum+j1c2ybFt
1HTGgzE5+S1qEfMUfEC2fuAe6oSsRvqODjIFROTp4OMN9wTEYw/JgS+301IeFEcg
HWQKMj9z+IlUCtFYUpXybXt827wcEjUyg9NAUTu3hTRRZPdzPIWjkMgIvI1vlKLC
ChIQU9r1aLZzpI6aVR2MQaOk4BFpLjKvb/mZjN6QJpA4nxgnmd/IkzatLa3yyGCY
hugEK1EiUwDi+OJh/Vy5fVu9VSl3MsxLQGTeR5CxLbBJEcxgjwfhlcw1gbX3vhE=
=uPhd
-----END PGP SIGNATURE-----

--Signature=_Fri__30_Sep_2011_11_52_13_+1000_rtD3nACw6rw9G6.e--
