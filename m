From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparseirq tree build warning
Date: Mon, 2 Feb 2009 17:48:17 +1100
Message-ID: <20090202174817.dd4a26f0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__2_Feb_2009_17_48_17_+1100_.TH2RDeXdzVN5zEz"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57211 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750698AbZBBGsg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Feb 2009 01:48:36 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>

--Signature=_Mon__2_Feb_2009_17_48_17_+1100_.TH2RDeXdzVN5zEz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo,

Today's linux-next build (powerpc ppc64_defconfig) produced this warning:

arch/powerpc/platforms/cell/interrupt.c: In function 'handle_iic_irq':
arch/powerpc/platforms/cell/interrupt.c:240: warning: unused variable 'cpu'

Caused by commit dee4102a9a5882b4f7d5cc165ba29e8cc63cf92e ("sparseirq:
use kstat_irqs_cpu instead").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__2_Feb_2009_17_48_17_+1100_.TH2RDeXdzVN5zEz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkmGlzEACgkQjjKRsyhoI8yVDQCgsk7WSLR3NAqws35mRQrIVhxD
kVgAoIlIXr2f4q6CZcfbnTKNY1IzlMGt
=g8+n
-----END PGP SIGNATURE-----

--Signature=_Mon__2_Feb_2009_17_48_17_+1100_.TH2RDeXdzVN5zEz--
