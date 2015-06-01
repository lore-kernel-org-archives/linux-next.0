From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm-perf tree with the  tree
Date: Mon, 1 Jun 2015 10:12:53 +1000
Message-ID: <20150601101253.2e454719@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eB9w.5dKEJztSxh6cNd90n2"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56096 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751085AbbFAAM7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 31 May 2015 20:12:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Will Deacon <will.deacon@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>

--Sig_/eB9w.5dKEJztSxh6cNd90n2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Will,

Today's linux-next merge of the arm-perf tree got a conflict in arch/arm/ke=
rnel/perf_event_cpu.c between commit 338d9dd3e2ae ("ARM:
8351/1: perf: don't warn about missing interrupt-affinity property for
PPIs") (and others) from Linus' tree and commit 74cf0bc75f16 ("arm:
perf: unify perf_event{,_cpu}.c") from the arm-perf tree.

I fixed it up (the changes from Linus' tree have been included in the
arm-perf tree change, so I just removed the file) and can carry the fix
as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/eB9w.5dKEJztSxh6cNd90n2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVa6OKAAoJEMDTa8Ir7ZwVewIP/RGMhpci5YshXst/cdqW5W+r
vVV0RsuEJkIZysLU6Zn2NIyzhoMAIqNfC5rjssWs5RhYo4qSOvWARX4292sMIIFw
8aB6R6htVAm9PlVt/vR/Uc7KtOE+lQ5u4t7KDl3gyO4Wv1EfJlp27ttf54DHlgT8
W0w3+Rq/sKO25epGhv5lzhY75CFn5btR9JZEoCrSe3zM9WSzV3qO1OONQNZHXB9n
+YppDhL9IpqSojzSfoN3e0o+D/yyfmM/WCv86eCRxt66pwrUftJd5dXLHG1T8K3y
U/VO3zhYmpGdgcoYZjqqz+poZBPJbFf9bVCsj5y/wXRqB4nb8SfXYqBxQcNVAwFn
qqwqUhrwi1oLwl/yuchaXcUNOXVU/HoO08vlq+JLnCbNRV7OojNPwy1owmQY1yqS
p/RZ7LDIQVpm2GdWcSWKCJMCKi98c8xOKYrDmMQHrs4Pu0cVegZfAWim5FXAL8Ju
jPLmplWGjxTLjglKTlJorZ3rmge+A2JO/v6NrdjWXCHHPEWRd25XPWQ4Solwtk60
q8/Y0R+0+nAjO2BKSXGHpm6Q7yvS67nnAOokJJEbc7oFCkHwD4/+ExOBhRumUPWX
azlviL396dGFfJqrBNe/9kw/SAyhHfV04GDGuhI2CYDsRePj/oxQNTYB6kp3l7HY
6yCnk3lQ0R5VDt/HGw3X
=z3Nd
-----END PGP SIGNATURE-----

--Sig_/eB9w.5dKEJztSxh6cNd90n2--
