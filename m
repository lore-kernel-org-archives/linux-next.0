From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the percpu tree with the s390 tree
Date: Tue, 7 Oct 2014 16:34:24 +1100
Message-ID: <20141007163424.771808f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WCMah4K9Fod8Tf4p65yDxaI"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38827 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753611AbaJGFeg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Oct 2014 01:34:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/WCMah4K9Fod8Tf4p65yDxaI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the percpu tree got a conflict in
arch/s390/kernel/irq.c between commit 201b275f0459 ("s390/nohz: use a
per-cpu flag for arch_needs_cpu") from the s390 tree and commit
eb7e7d766326 ("s390: Replace __get_cpu_var uses") from the percpu tree.

I fixed it up (the former changed the
"__get_cpu_var(s390_idle).nohz_delay =3D 1" into
"set_cpu_flag(CIF_NOHZ_DELAY)", so I used that) and can carry the fix
as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/WCMah4K9Fod8Tf4p65yDxaI
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUM3toAAoJEMDTa8Ir7ZwVGZ4P/3ZB0PUkUwXXnGtoNcsBT+s9
gGPc98XQtn/sq697mJRhk15WOvt6pfrJ4Fn0anmTi+9OquZsXQAv++dU78zFsBjQ
IRjBJhCd2ivjJiNy9zG1rjWJ5fBKDgvh/kIElaON/ATvAG6hua9f4fCuK3hB1iBl
GNNHcVoml2v0+i9SKHQqx6+ZCmoKO13+ivJBDWPPWAIN93n3V3PtBJXSd2qENZAE
9wk0eZP6cTBy2BVun9rp3YDIV6q2DRDKwnZD/dkFfDWUgQgifthfteNX8anAKTyl
aERWidGZDMvLnV/qEe+tcqOG4jMqsYel1ChUV5wcx0YBZGzb1YlODX6ENk2PtiTr
k90MLz3eIQBk4QiPj0yOG93mslzMeJjMX6qBi0tm4ji5c5bskngzvu2AaaGid7EV
UMqino/79r5pmLXeGu4cRh4IJF/CeHZvJTGfmd8U5iBo5QZvASB2Hrp848GrtXsi
2m4jZAguwYwca9zX9X01+ASRf+q8laDPQoGEcOR51jWLhaxdNHk/6zfmxb5QQFX8
xOb300S6/8qRgCE3bPcZwWd0Rqxq9BUwvWzZm3u+AMPj3PropfjBDqUYMvaewTss
CX2gSzmtaQM7h5ympLtATOrc4z1czDjvnnBHCij9FGCCTQ2dAnraVENwFauhWhUg
EfJW53K9B3l65H58jxHR
=mtGX
-----END PGP SIGNATURE-----

--Sig_/WCMah4K9Fod8Tf4p65yDxaI--
