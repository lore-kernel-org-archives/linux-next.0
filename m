From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Tue, 17 Mar 2009 13:45:25 +1100
Message-ID: <20090317134525.a28833ae.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__17_Mar_2009_13_45_25_+1100_M+bP/0.V03ESKSRN"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60564 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753216AbZCQCpb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 22:45:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Tue__17_Mar_2009_13_45_25_+1100_M+bP/0.V03ESKSRN
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

arch/powerpc/kernel/sysfs.c: In function 'read_mmcr0':
arch/powerpc/kernel/sysfs.c:186: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c:186: error: (Each undeclared identifier is repo=
rted only once
arch/powerpc/kernel/sysfs.c:186: error: for each function it appears in.)
arch/powerpc/kernel/sysfs.c: In function 'read_mmcr1':
arch/powerpc/kernel/sysfs.c:187: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pmc1':
arch/powerpc/kernel/sysfs.c:188: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pmc2':
arch/powerpc/kernel/sysfs.c:189: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pmc3':
arch/powerpc/kernel/sysfs.c:190: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pmc4':
arch/powerpc/kernel/sysfs.c:191: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pmc5':
arch/powerpc/kernel/sysfs.c:192: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pmc6':
arch/powerpc/kernel/sysfs.c:193: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pmc7':
arch/powerpc/kernel/sysfs.c:200: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pmc8':
arch/powerpc/kernel/sysfs.c:201: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_mmcra':
arch/powerpc/kernel/sysfs.c:203: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_purr':
arch/powerpc/kernel/sysfs.c:204: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_spurr':
arch/powerpc/kernel/sysfs.c:205: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_dscr':
arch/powerpc/kernel/sysfs.c:206: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pa6t_pmc0':
arch/powerpc/kernel/sysfs.c:215: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pa6t_pmc1':
arch/powerpc/kernel/sysfs.c:216: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pa6t_pmc2':
arch/powerpc/kernel/sysfs.c:217: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pa6t_pmc3':
arch/powerpc/kernel/sysfs.c:218: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pa6t_pmc4':
arch/powerpc/kernel/sysfs.c:219: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pa6t_pmc5':
arch/powerpc/kernel/sysfs.c:220: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_hid0':
arch/powerpc/kernel/sysfs.c:222: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_hid1':
arch/powerpc/kernel/sysfs.c:223: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_hid4':
arch/powerpc/kernel/sysfs.c:224: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_hid5':
arch/powerpc/kernel/sysfs.c:225: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_ima0':
arch/powerpc/kernel/sysfs.c:226: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_ima1':
arch/powerpc/kernel/sysfs.c:227: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_ima2':
arch/powerpc/kernel/sysfs.c:228: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_ima3':
arch/powerpc/kernel/sysfs.c:229: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_ima4':
arch/powerpc/kernel/sysfs.c:230: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_ima5':
arch/powerpc/kernel/sysfs.c:231: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_ima6':
arch/powerpc/kernel/sysfs.c:232: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_ima7':
arch/powerpc/kernel/sysfs.c:233: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_ima8':
arch/powerpc/kernel/sysfs.c:234: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_ima9':
arch/powerpc/kernel/sysfs.c:235: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_imaat':
arch/powerpc/kernel/sysfs.c:236: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_btcr':
arch/powerpc/kernel/sysfs.c:237: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_pccr':
arch/powerpc/kernel/sysfs.c:238: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_rpccr':
arch/powerpc/kernel/sysfs.c:239: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_der':
arch/powerpc/kernel/sysfs.c:240: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_mer':
arch/powerpc/kernel/sysfs.c:241: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_ber':
arch/powerpc/kernel/sysfs.c:242: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_ier':
arch/powerpc/kernel/sysfs.c:243: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_sier':
arch/powerpc/kernel/sysfs.c:244: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_siar':
arch/powerpc/kernel/sysfs.c:245: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_tsr0':
arch/powerpc/kernel/sysfs.c:246: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_tsr1':
arch/powerpc/kernel/sysfs.c:247: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_tsr2':
arch/powerpc/kernel/sysfs.c:248: error: 'val' undeclared (first use in this=
 function)
arch/powerpc/kernel/sysfs.c: In function 'read_tsr3':
arch/powerpc/kernel/sysfs.c:249: error: 'val' undeclared (first use in this=
 function)

I will use yesterday's version of the rr tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__17_Mar_2009_13_45_25_+1100_M+bP/0.V03ESKSRN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm/DsUACgkQjjKRsyhoI8wsxwCdEK2NQjrAnZEFcW5BIA0yKCu1
EjEAoJnzzKmnSuPaiLpyUb1Z8ePU7ncg
=fIyp
-----END PGP SIGNATURE-----

--Signature=_Tue__17_Mar_2009_13_45_25_+1100_M+bP/0.V03ESKSRN--
