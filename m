From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Fri, 17 Oct 2008 18:59:11 +1100
Message-ID: <20081017185911.45295d6b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__17_Oct_2008_18_59_11_+1100_SZ752k8x3hY=B6F9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:47919 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753333AbYJQH7T (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 17 Oct 2008 03:59:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org

--Signature=_Fri__17_Oct_2008_18_59_11_+1100_SZ752k8x3hY=B6F9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi ,

Today's linux-next build (sparc defconfig) failed like this:

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

I have no idea what to do about this.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__17_Oct_2008_18_59_11_+1100_SZ752k8x3hY=B6F9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj4Rc8ACgkQjjKRsyhoI8wOyQCaAr7/wPcjYtQr4shSKidObv9l
H1UAoL2CVqFNAbeQHoRevIFLiumr+snC
=FwT6
-----END PGP SIGNATURE-----

--Signature=_Fri__17_Oct_2008_18_59_11_+1100_SZ752k8x3hY=B6F9--
