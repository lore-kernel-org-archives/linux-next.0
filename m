From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the  tree (nfs tree
 related)
Date: Mon, 27 Sep 2010 15:23:04 +1000
Message-ID: <20100927152304.a6463447.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__27_Sep_2010_15_23_04_+1000_HgzN3buw7.7akkFw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42093 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752696Ab0I0FXL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Sep 2010 01:23:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Bryan Schumaker <bjschuma@netapp.com>

--Signature=_Mon__27_Sep_2010_15_23_04_+1000_HgzN3buw7.7akkFw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Trond,

After merging the final tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/nfs/dir.c: In function 'nfs_readdir_free_large_page':
fs/nfs/dir.c:464: error: implicit declaration of function 'vm_unmap_ram'
fs/nfs/dir.c: In function 'nfs_readdir_large_page':
fs/nfs/dir.c:485: error: implicit declaration of function 'vm_map_ram'
fs/nfs/dir.c:485: warning: assignment makes pointer from integer without a =
cast

Caused by commit 2af4eb9746092aab7811b5b581d004049c068a02 ("NFS: readdir
with vmapped pages").

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__27_Sep_2010_15_23_04_+1000_HgzN3buw7.7akkFw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMoCo4AAoJEDMEi1NhKgbsNlwIAI8TllKjSvpZi4MkGhVeWXOH
O4/CFlLmB0gN+VJJjML3mQRfOvT1D+xamoBl48rBPEJv9n8gBk4ZI3xf04eqLCCE
lLn3X7JflbkZ/r/AwtU/ZEzClyCDBcw1tjzc7ibHagkyT6TE0E23+Eqkx7ZJUESs
KKbqpVuvAekmV0FKRxhegplqkklWpPZZ2QRyUzgak2WcYx/w5eRruNxwkbPtqZ1r
4UX1qpj8X3uWI+i8d2I/BwV4GLlB3nfMSorXBK1OX2WiWhm6E5IeByrR36OTFBGb
A7VywG00+zNScpMP+k++YWJuTtx5yfgpl6EUSciK4/zS1dHKJ1vEbw5ffcYygZo=
=txbt
-----END PGP SIGNATURE-----

--Signature=_Mon__27_Sep_2010_15_23_04_+1000_HgzN3buw7.7akkFw--
