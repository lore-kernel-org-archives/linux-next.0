From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with the asm-generic
 tree
Date: Wed, 21 Mar 2018 09:50:47 +1100
Message-ID: <20180321095047.3aee181e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xBNHTtxHG4m6.K59ZtSdJPi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Martin <Dave.Martin@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>
List-Id: linux-next.vger.kernel.org

--Sig_/xBNHTtxHG4m6.K59ZtSdJPi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the arm64 tree got a conflict in:

  include/uapi/asm-generic/siginfo.h

between commit:

  0d7d2a23a347 ("asm-generic: siginfo: define ia64 si_codes unconditionally=
")

from the asm-generic tree and commit:

  266da65e9156 ("signal: Add FPE_FLTUNK si_code for undiagnosable fp except=
ions")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/uapi/asm-generic/siginfo.h
index 5528cdb0b54a,4b3520bf67ba..000000000000
--- a/include/uapi/asm-generic/siginfo.h
+++ b/include/uapi/asm-generic/siginfo.h
@@@ -202,12 -219,18 +202,13 @@@ typedef struct siginfo=20
  #define FPE_FLTRES	6	/* floating point inexact result */
  #define FPE_FLTINV	7	/* floating point invalid operation */
  #define FPE_FLTSUB	8	/* subscript out of range */
 -#ifdef __frv__
 -# define FPE_MDAOVF	9	/* media overflow */
 -#endif
 -#ifdef __ia64__
 -# define __FPE_DECOVF	9	/* decimal overflow */
 -# define __FPE_DECDIV	10	/* decimal division by zero */
 -# define __FPE_DECERR	11	/* packed decimal error */
 -# define __FPE_INVASC	12	/* invalid ASCII digit */
 -# define __FPE_INVDEC	13	/* invalid decimal digit */
 -#endif
 +#define __FPE_DECOVF	9	/* decimal overflow */
 +#define __FPE_DECDIV	10	/* decimal division by zero */
 +#define __FPE_DECERR	11	/* packed decimal error */
 +#define __FPE_INVASC	12	/* invalid ASCII digit */
 +#define __FPE_INVDEC	13	/* invalid decimal digit */
- #define NSIGFPE		13
+ #define FPE_FLTUNK	14	/* undiagnosed floating-point exception */
+ #define NSIGFPE		14
 =20
  /*
   * SIGSEGV si_codes

--Sig_/xBNHTtxHG4m6.K59ZtSdJPi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqxkEcACgkQAVBC80lX
0GybuQf8CE9hVBIuyWFTpYLEZWAU3/U80XmAyL8dyzgNtoYt1QbPbFLApWZOtBL1
clRYXy3I6+o/wmRCQK5eaMzbWHSrNlmpCbHLI0C9tLGrugsuDtUJBQ4UR2UZqUxj
So4I/XKXu+9CO/f72aK5/Pct6aT+DOQV0trzGEgNUlD07QfRhAQ7kHF83Oi6N4cZ
haZFJEstrk8+KCBaqgCy4R2ZFL1HN8V2G1+XVCBWFlGxQdYZU2R3B/KLUVFGxkHL
0DEl5N2ybbqNAwuda0Xf+uMdz83Agkyb94n5qQLvKvseigTd4qHURgdQxe+7rDaN
/F9/RSlhehVSFz93iXZ5HxAzvMSuBw==
=4WZn
-----END PGP SIGNATURE-----

--Sig_/xBNHTtxHG4m6.K59ZtSdJPi--
