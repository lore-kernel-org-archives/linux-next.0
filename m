From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc tree build failure
Date: Fri, 25 Jul 2008 17:05:27 +1000
Message-ID: <20080725170527.00a7bf4a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__25_Jul_2008_17_05_27_+1000_s8GK+Gzr0zic/qAm"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43279 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751624AbYGYHFn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 25 Jul 2008 03:05:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__25_Jul_2008_17_05_27_+1000_s8GK+Gzr0zic/qAm
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next build (sparc defconfig) failed like this:

  Building modules, stage 2.
.tmp_kallsyms2.o(.rodata+0x0): In function `kallsyms_addresses':
: relocation truncated to fit: R_SPARC_32 _text
.tmp_kallsyms2.o(.rodata+0x4): In function `kallsyms_addresses':
: relocation truncated to fit: R_SPARC_32 _text
.tmp_kallsyms2.o(.rodata+0x8): In function `kallsyms_addresses':
: relocation truncated to fit: R_SPARC_32 _text
.tmp_kallsyms2.o(.rodata+0xc): In function `kallsyms_addresses':
: relocation truncated to fit: R_SPARC_32 _text
.tmp_kallsyms2.o(.rodata+0x10): In function `kallsyms_addresses':
: relocation truncated to fit: R_SPARC_32 _text
.tmp_kallsyms2.o(.rodata+0x14): In function `kallsyms_addresses':
: relocation truncated to fit: R_SPARC_32 _text
.tmp_kallsyms2.o(.rodata+0x18): In function `kallsyms_addresses':
: relocation truncated to fit: R_SPARC_32 _text
.tmp_kallsyms2.o(.rodata+0x1c): In function `kallsyms_addresses':
: relocation truncated to fit: R_SPARC_32 _text
.tmp_kallsyms2.o(.rodata+0x20): In function `kallsyms_addresses':
: relocation truncated to fit: R_SPARC_32 _text
.tmp_kallsyms2.o(.rodata+0x24): In function `kallsyms_addresses':
: relocation truncated to fit: R_SPARC_32 _text
.tmp_kallsyms2.o(.rodata+0x28): In function `kallsyms_addresses':
: additional relocation overflows omitted from the output

Sorry, I have no idea how to fix this.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__25_Jul_2008_17_05_27_+1000_s8GK+Gzr0zic/qAm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEUEARECAAYFAkiJezcACgkQjjKRsyhoI8zz/QCXV1tYEqyx3t6fzHrkS1rW0thn
3ACeJWy7bDU7F7VFICqclCdRgvMouY8=
=vYb1
-----END PGP SIGNATURE-----

--Signature=_Fri__25_Jul_2008_17_05_27_+1000_s8GK+Gzr0zic/qAm--
