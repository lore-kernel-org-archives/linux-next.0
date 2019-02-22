From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the powerpc tree
Date: Fri, 22 Feb 2019 18:14:03 +1100
Message-ID: <20190222181403.4ce373bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+FbZc7FKr5m2vNkwx0fiVQQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christophe Leroy <christophe.leroy@c-s.fr>
List-Id: linux-next.vger.kernel.org

--Sig_/+FbZc7FKr5m2vNkwx0fiVQQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the powerpc tree, today's linux-next build (powerpc
allyesconfig) failed like this:

make[4]: *** No rule to make target 'arch/powerpc/mm/ptdump/core.o', needed=
 by 'arch/powerpc/mm/ptdump/built-in.a'.

Caused by commit

  5df1cfa43394 ("powerpc: Move page table dump files in a dedicated subdire=
ctory")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/+FbZc7FKr5m2vNkwx0fiVQQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxvoTsACgkQAVBC80lX
0Gwdbgf9FSrUjejdUoAe9U3PpHeJakQyVdhu9ZoCWGxHwRsdnWi7ZUT4yEB4FD7Q
YRBbEm5sugDNBU+s5vlLHDzUqA34reGO6ntx+rO0ZOtUVnHBZSkpEI+Cn2ipGPWA
t2ximMCh1IYR1kyOB/iNBT8+bv8ep9AhOfyxtjUqNhAB35OvvtMURv5+rZYMuxHX
kdqFgTMsux674D0/ajFqMbh/j79AcIERxVPfjHLCPaXUIoJyjVFLx/2MRvRtaUL2
jbRP4npWJaFapY5xXo+hHQ3kyPCZdBujIvychdEKbVkQToPXXAfKHtcRs4n+LTsz
fqGvP2mfO4oZuRag4Ns71k8S7pArPQ==
=g7aE
-----END PGP SIGNATURE-----

--Sig_/+FbZc7FKr5m2vNkwx0fiVQQ--
