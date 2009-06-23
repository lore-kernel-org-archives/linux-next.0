From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Tue, 23 Jun 2009 16:14:16 +1000
Message-ID: <20090623161416.072b43ba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__23_Jun_2009_16_14_16_+1000_vT1CKCZHo2Anuj.I"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758179AbZFWGO2@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__23_Jun_2009_16_14_16_+1000_vT1CKCZHo2Anuj.I
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (arm realview-smp_defconfig) failed like this:

arch/arm/kernel/smp.c: In function 'flush_tlb_mm':
arch/arm/kernel/smp.c:646: error: lvalue required as unary '&' operand
arch/arm/kernel/smp.c: In function 'flush_tlb_page':
arch/arm/kernel/smp.c:657: error: lvalue required as unary '&' operand
arch/arm/kernel/smp.c: In function 'flush_tlb_range':
arch/arm/kernel/smp.c:680: error: lvalue required as unary '&' operand

Caused by commit e97df8b735e20500a1d6a3743bef153869c472d3
("cpumask:use-mm_cpumask-arm").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__23_Jun_2009_16_14_16_+1000_vT1CKCZHo2Anuj.I
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpAcrgACgkQjjKRsyhoI8yMYQCgjh9MIJMnk85dL8fFP/u2Z6xj
a9wAn2SLPGZTKDjhxkO/Jt4PcmcWz8qY
=3k7E
-----END PGP SIGNATURE-----

--Signature=_Tue__23_Jun_2009_16_14_16_+1000_vT1CKCZHo2Anuj.I--
