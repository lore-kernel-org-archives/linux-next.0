From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the generic-ipi tree
Date: Thu, 3 Jul 2008 16:56:54 +1000
Message-ID: <20080703165654.d9f4c35e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__3_Jul_2008_16_56_54_+1000_WLDc3Vf/KnT3ZTH4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:39321 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750891AbYGCG5C (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 02:57:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>, Jens Axboe <jens.axboe@oracle.com>
Cc: linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, David Miller <davem@davemloft.net>

--Signature=_Thu__3_Jul_2008_16_56_54_+1000_WLDc3Vf/KnT3ZTH4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ingo, Jens,

Today's linux-next merge of the generic-ipi tree got conflicts in
net/iucv/iucv.c between commit 7b9d1b22a382aa221018c19880ee22c44467feec
("iucv: prevent cpu hotplug when walking cpu_online_map") from the net
tree and commits 8691e5a8f691cc2a4fda0651e8d307aaba0e7d68
("smp_call_function: get rid of the unused nonatomic/retry argument") and
15c8b6c1aaaf1c4edd67e2f02e4d8e1bd1a51c0d ("on_each_cpu(): kill unused
'retry' parameter") from the generic-ipi tree.

Just context conflicts.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__3_Jul_2008_16_56_54_+1000_WLDc3Vf/KnT3ZTH4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhseDYACgkQjjKRsyhoI8wj6ACglNPD9HVPdjcOsNbGWxwTnGVh
rLIAnj4bR8kKyWNf0/N7ldh0ADBSHp9i
=A1FW
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Jul_2008_16_56_54_+1000_WLDc3Vf/KnT3ZTH4--
