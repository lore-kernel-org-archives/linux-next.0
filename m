From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build warnings
Date: Mon, 16 Mar 2009 16:47:10 +1100
Message-ID: <20090316164710.e0a9974a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Mar_2009_16_47_10_+1100_CsfaKbBgBgwoG.=5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59929 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751314AbZCPFrU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 01:47:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__16_Mar_2009_16_47_10_+1100_CsfaKbBgBgwoG.=5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (powerpc ppc64_defconfig) produced these
warnings:

arch/powerpc/kernel/sysfs.c: In function 'store_mmcr0':
arch/powerpc/kernel/sysfs.c:187: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_mmcr1':
arch/powerpc/kernel/sysfs.c:188: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pmc1':
arch/powerpc/kernel/sysfs.c:189: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pmc2':
arch/powerpc/kernel/sysfs.c:190: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pmc3':
arch/powerpc/kernel/sysfs.c:191: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pmc4':
arch/powerpc/kernel/sysfs.c:192: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pmc5':
arch/powerpc/kernel/sysfs.c:193: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pmc6':
arch/powerpc/kernel/sysfs.c:194: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pmc7':
arch/powerpc/kernel/sysfs.c:201: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pmc8':
arch/powerpc/kernel/sysfs.c:202: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_mmcra':
arch/powerpc/kernel/sysfs.c:204: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_purr':
arch/powerpc/kernel/sysfs.c:205: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_spurr':
arch/powerpc/kernel/sysfs.c:206: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_dscr':
arch/powerpc/kernel/sysfs.c:207: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pa6t_pmc0':
arch/powerpc/kernel/sysfs.c:216: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pa6t_pmc1':
arch/powerpc/kernel/sysfs.c:217: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pa6t_pmc2':
arch/powerpc/kernel/sysfs.c:218: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pa6t_pmc3':
arch/powerpc/kernel/sysfs.c:219: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pa6t_pmc4':
arch/powerpc/kernel/sysfs.c:220: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pa6t_pmc5':
arch/powerpc/kernel/sysfs.c:221: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_hid0':
arch/powerpc/kernel/sysfs.c:223: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_hid1':
arch/powerpc/kernel/sysfs.c:224: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_hid4':
arch/powerpc/kernel/sysfs.c:225: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_hid5':
arch/powerpc/kernel/sysfs.c:226: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_ima0':
arch/powerpc/kernel/sysfs.c:227: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_ima1':
arch/powerpc/kernel/sysfs.c:228: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_ima2':
arch/powerpc/kernel/sysfs.c:229: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_ima3':
arch/powerpc/kernel/sysfs.c:230: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_ima4':
arch/powerpc/kernel/sysfs.c:231: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_ima5':
arch/powerpc/kernel/sysfs.c:232: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_ima6':
arch/powerpc/kernel/sysfs.c:233: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_ima7':
arch/powerpc/kernel/sysfs.c:234: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_ima8':
arch/powerpc/kernel/sysfs.c:235: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_ima9':
arch/powerpc/kernel/sysfs.c:236: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_imaat':
arch/powerpc/kernel/sysfs.c:237: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_btcr':
arch/powerpc/kernel/sysfs.c:238: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_pccr':
arch/powerpc/kernel/sysfs.c:239: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_rpccr':
arch/powerpc/kernel/sysfs.c:240: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_der':
arch/powerpc/kernel/sysfs.c:241: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_mer':
arch/powerpc/kernel/sysfs.c:242: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_ber':
arch/powerpc/kernel/sysfs.c:243: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_ier':
arch/powerpc/kernel/sysfs.c:244: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_sier':
arch/powerpc/kernel/sysfs.c:245: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_siar':
arch/powerpc/kernel/sysfs.c:246: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_tsr0':
arch/powerpc/kernel/sysfs.c:247: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_tsr1':
arch/powerpc/kernel/sysfs.c:248: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_tsr2':
arch/powerpc/kernel/sysfs.c:249: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type
arch/powerpc/kernel/sysfs.c: In function 'store_tsr3':
arch/powerpc/kernel/sysfs.c:250: warning: passing argument 2 of 'smp_call_f=
unction_single' from incompatible pointer type

Caused by commit 971fa46b1a83d63d3610009e44ba5cab039df611
("cpumask:smp_call_function-in-powerpc-sysfs).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Mar_2009_16_47_10_+1100_CsfaKbBgBgwoG.=5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkm9594ACgkQjjKRsyhoI8zNvACeKXpVzQGE63WY7U0f/7Vlmnro
CTAAn3tEhJ6s396gZeuqMKKb0/+gfOB5
=SFxE
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Mar_2009_16_47_10_+1100_CsfaKbBgBgwoG.=5--
