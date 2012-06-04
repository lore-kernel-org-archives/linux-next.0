From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the origin tree
Date: Mon, 4 Jun 2012 12:57:24 +1000
Message-ID: <20120604125724.603f62215c9dc9269db898a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__4_Jun_2012_12_57_24_+1000_taO9farJFwzN6e4R"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:38992 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755661Ab2FDC5g (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 3 Jun 2012 22:57:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Paul Mundt <lethal@linux-sh.org>

--Signature=_Mon__4_Jun_2012_12_57_24_+1000_taO9farJFwzN6e4R
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Building the origin tree (v3.5-rc1 sh lboxre2_defconfig and other sh
configs) failed like this:

arch/sh/include/asm/thread_info.h:172:2: error: 'TAINT_WARN' undeclared (fi=
rst use in this function)

Caused by commit edd63a2763bd ("set_restore_sigmask() is never called
without SIGPENDING (and never should be)").  Missing include of kernel.h.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__4_Jun_2012_12_57_24_+1000_taO9farJFwzN6e4R
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPzCQUAAoJEECxmPOUX5FEMaQQAKLmwg6MQyHYyzHQTGZLZL9o
fuaE9HQsRhtDwEaf57JEKIa1BCNvyoc7lxpDpMsFvGN3JegMpFzKXBYYemkZW1dZ
tgDEQGLNUnZT+JssOL78I36e/saehbTxVCEJ1TE2yaDhkRHcozQ4F40eFeoER6rF
CqnrsPd1KxD50Dusj1vn3yiOy2K0fIKcqXiD6IM5N+3k+J/Dj685PaQ4fv49zEan
/vrhQVaSMwFpUQswMLw4cg18qRetAbo1VWcsZ5ucbvNe6rxZQkz4NNYKFIwQpGH+
VeSYy8vdHjLTcKzRSP7cVvAENVsVKFJBn+eXqEvk96ns8s4MxIYBl4l92owARbDs
QNkcVV8clFaIRU0wou1VjjpZEzRwOIVxbH92q9B+89TQ3EGYqQvM1uYLydEx/aiE
cVhOM06pmXIN+dmktV++evfdISAUPZ3rHRSG6x8pfHbzO8Y/vVjFOjEW9iNrkMLS
1r0sluFkAwI8MeczHUk8SK89sk/RBCRwIFs29EciO7j2ajc6xU/tf6dvV+no4ENi
CbBLohIn1AGUuDSunXQnbv0FPvjVI2VCFA5RwkxcEpcKoV9vEMlQwnIwelIQI3gN
COGbkiGPSXV77uJMBCbiVjgnVtXCheJdCEkgqAVE4Wxw2+ZjtRTcKNIdltWJG3xb
/vGOx4eIvzbAje/vAkxs
=BDQa
-----END PGP SIGNATURE-----

--Signature=_Mon__4_Jun_2012_12_57_24_+1000_taO9farJFwzN6e4R--
