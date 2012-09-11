From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the final tree (slab tree
 related)
Date: Tue, 11 Sep 2012 16:19:23 +1000
Message-ID: <20120911161923.10299045655dd4c84f96f4b3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__11_Sep_2012_16_19_23_+1000_5FL/aH.V5069RRMU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:55381 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756615Ab2IKGTe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 11 Sep 2012 02:19:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Tue__11_Sep_2012_16_19_23_+1000_5FL/aH.V5069RRMU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (sparc64 defconfig)
produced this warning:

mm/slab.c:808:13: warning: '__slab_error' defined but not used [-Wunused-fu=
nction]

Introduced by commit 945cf2b6199b ("mm/sl[aou]b: Extract a common function =
for kmem_cache_destroy").  All uses of slab_error() are now guarded by DEBU=
G.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Tue__11_Sep_2012_16_19_23_+1000_5FL/aH.V5069RRMU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQTtfrAAoJEECxmPOUX5FEl+IP/0EHZETnbzQO1tjv6QXMKStC
o4gZJUP8/ifZbczsGSTfrZN2MQ6AbH8g+4gRorTv/PVjq0S3xtys78Uzt9FgkI9b
km+/oGiSkpxVfnPN4pFTfQUg6zy/RG5ITksZQEfW1D9MA5bj+e+KRl0KId4Gfgyo
Y1hfYhhuACc6K1+pMtPXniJs2REFGOYa8NpmrIrE02PSYqipIclg4azU1wWWrPFM
cUBB0ue0eE57X49LiXyKthaOFlFIPtAaMRNDbbYx2SH9gOCBQE/I044hrFrBxxG/
/kpXvyMl7JC15Ih/e87ec4UyV6cF3v/Bx5zbq7ttS5RHdW9j/MLVDpuFBywYqngl
kIvBLh0We4VykqeHV1EX/IalISmvvOUP+EnyMJhtXCEBlOkvENRQwhr625WWPlE8
EJfirss09+NKagiuH8BDvuvs8GNizy9zM2nkqp3t+/jRXZC6wmIKu0Cb4UMa6Kva
8sAAN90rZyjY081uewQf6RFJDSZUGSkFxtiTaQqxDGj27pjN4YRtITr8a9+8p6Wn
Jtfu0EAK3QeBON6600+NLiqPQChCCHSvfwcuBEXHpRKpPStSKw2B0hVEx8wSeRQi
2eEhJ674BfM0oQndY70oFkCbSe06MMAKGFFIDy4mUN1T47xeD1BrAeFwKKJCo+RJ
lpgNtKqnK6RMSRcHcsp1
=nFUJ
-----END PGP SIGNATURE-----

--Signature=_Tue__11_Sep_2012_16_19_23_+1000_5FL/aH.V5069RRMU--
