From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the slab tree
Date: Wed, 28 Sep 2011 19:01:58 +1000
Message-ID: <20110928190158.d313ae65b9dcd0007fff0836@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__28_Sep_2011_19_01_58_+1000_ub83QDer6aZikxxF"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:46971 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751503Ab1I1JCM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Sep 2011 05:02:12 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vasiliy Kulikov <segoon@openwall.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>

--Signature=_Wed__28_Sep_2011_19_01_58_+1000_ub83QDer6aZikxxF
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in mm/slab.c
between commit ab067e99d22e ("mm: restrict access to slab files under
procfs and sysfs") from the slab tree and commit ea14c46ee4d9 ("mm:
restrict access to /proc/slabinfo") from the akpm tree.

The former is a superset of the latter, so I dropped that patch from the
akpm tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__28_Sep_2011_19_01_58_+1000_ub83QDer6aZikxxF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOguKGAAoJEDMEi1NhKgbs7UIH/jOjzu4z+m05UhlbxjtDuKjC
K2KfNe37egRIAuKzLKmfmJyMuAyQBIjOpfBBXTIE0G50cfqpwQZPycw9F7792Jjr
f7ItK0Uk4Jq2ao0AiXFMJ/8+X9LSAzYWGg52NU3D8+Fi2MCV0Bsui+9XRkVkG2qy
BCvvjV7lutpRXx6yZrxma8S+gWxeTnwC1DKh0gGUOQv4q1LQEqu3A2ALLSsHX1Tq
eA1FIFmdwXFn2JyQ28sftcImg1ox54GlQ6qx+tQ0TbjUew9oHROXmt/VcSxBtTu8
tmSJl+2GSJxl124BhYdQi3Mb1volzM2WxsAyDFUt0iJjC88frmCYeebItldcaEo=
=QWxt
-----END PGP SIGNATURE-----

--Signature=_Wed__28_Sep_2011_19_01_58_+1000_ub83QDer6aZikxxF--
