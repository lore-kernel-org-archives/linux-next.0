From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Mon, 29 Dec 2008 19:12:53 +1100
Message-ID: <20081229191253.6c04bf3e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Dec_2008_19_12_53_+1100_9_7rUV/4LBzJVD5h"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37421 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752509AbYL2INA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 03:13:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Mon__29_Dec_2008_19_12_53_+1100_9_7rUV/4LBzJVD5h
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (x86_64 allmodconfig) failed like this:

In file included from include/linux/smp.h:33,
                 from include/linux/topology.h:33,
                 from include/linux/mmzone.h:763,
                 from include/linux/gfp.h:4,
                 from include/linux/kmod.h:22,
                 from include/linux/module.h:13,
                 from include/linux/crypto.h:21,
                 from arch/x86/kernel/asm-offsets_64.c:7,
                 from arch/x86/kernel/asm-offsets.c:4:
arch/x86/include/asm/smp.h: In function 'num_booting_cpus':
arch/x86/include/asm/smp.h:152: error: implicit declaration of function 'cp=
us_weight'

I have dropped the rr tree for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__29_Dec_2008_19_12_53_+1100_9_7rUV/4LBzJVD5h
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklYhoUACgkQjjKRsyhoI8zAIgCfV4MpYjvaHpLzf61rliQBLGPz
0LMAoKaQXJCeRGMKkPocj2qcbpf9SABH
=IHom
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Dec_2008_19_12_53_+1100_9_7rUV/4LBzJVD5h--
