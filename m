From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cpus4096 tree
Date: Wed, 16 Jul 2008 12:47:32 +1000
Message-ID: <20080716124732.9fedc3dd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__16_Jul_2008_12_47_32_+1000_hpdp4a=0GrIOPrn8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59882 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751643AbYGPCrl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 15 Jul 2008 22:47:41 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Jens Axboe <jens.axboe@oracle.com>, Mike Travis <travis@sgi.com>

--Signature=_Wed__16_Jul_2008_12_47_32_+1000_hpdp4a=0GrIOPrn8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the cpus4096 tree got a conflict in
net/iucv/iucv.c between commit 8691e5a8f691cc2a4fda0651e8d307aaba0e7d68
("smp_call_function: get rid of the unused nonatomic/retry argument")
from Linus' tree and commit 0e12f848b337fc034ceb3c0d03d75f8de1b8cc96
("net: use performance variant for_each_cpu_mask_nr") from the cpus4096
tree.

This conflict (see below) used to be against generic-ipi tree, but that
has now been merged into Linus' tree.  Simple fixup.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc net/iucv/iucv.c
index cc34ac7,8de5110..0000000
--- a/net/iucv/iucv.c
+++ b/net/iucv/iucv.c
@@@ -497,8 -497,8 +497,13 @@@ static void iucv_setmask_up(void
        /* Disable all cpu but the first in cpu_irq_cpumask. */
        cpumask =3D iucv_irq_cpumask;
        cpu_clear(first_cpu(iucv_irq_cpumask), cpumask);
++<<<<<<< HEAD:net/iucv/iucv.c
 +      for_each_cpu_mask(cpu, cpumask)
 +              smp_call_function_single(cpu, iucv_block_cpu, NULL, 1);
++=3D=3D=3D=3D=3D=3D=3D
+       for_each_cpu_mask_nr(cpu, cpumask)
+               smp_call_function_single(cpu, iucv_block_cpu, NULL, 0, 1);
++>>>>>>> cpus4096/auto-cpus4096-next:net/iucv/iucv.c
  }
 =20
  /**

--Signature=_Wed__16_Jul_2008_12_47_32_+1000_hpdp4a=0GrIOPrn8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh9YUQACgkQjjKRsyhoI8xL+QCgpBbq4Qi+USo8lpxjsDM26hrJ
fisAoKuoRVk9QIQ7G2CdGVw1+1zEEx9A
=UcGV
-----END PGP SIGNATURE-----

--Signature=_Wed__16_Jul_2008_12_47_32_+1000_hpdp4a=0GrIOPrn8--
