From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (akpm tree
 related)
Date: Wed, 30 Nov 2011 15:52:26 +1100
Message-ID: <20111130155226.b571cfd7887f03f9e8e1285b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Wed__30_Nov_2011_15_52_26_+1100_nKmj.hMCD7Ioe5om"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from calzone.tip.net.au ([203.10.76.15]:46206 "EHLO
	calzone.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752271Ab1K3Ewd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 29 Nov 2011 23:52:33 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Wed__30_Nov_2011_15_52_26_+1100_nKmj.hMCD7Ioe5om
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from include/linux/netdevice.h:54:0,
                 from arch/powerpc/net/bpf_jit_comp.c:14:
include/net/netprio_cgroup.h:34:12: error: 'net_prio_subsys_id' redeclared =
as different kind of symbol
include/linux/cgroup_subsys.h:71:1: note: previous definition of 'net_prio_=
subsys_id' was here

And many more similar.

Caused (or exposed) by commit 9222aa56c0ce
("include/net/netprio_cgroup.h: various fixes") from the akpm tree.

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__30_Nov_2011_15_52_26_+1100_nKmj.hMCD7Ioe5om
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBCAAGBQJO1baKAAoJEECxmPOUX5FEtPAQAIfz+pGTykdFoYAt8JrQgxg7
kCpVNvO2MYbyNmJNAxJ66En/nRAYQjco/ZFFN+PiqfVg6G/g3OJjgO6QxJbQ9Yfk
g/qv8/tvlluwTgVwiyaPgHKbnfeDRuFtZHh5IWA5jwryPTILU+/bdmQbxHdhZxYi
rVoeak+zRajuIwsLzyWVC4GLBUSyQxOAxIlM74v7iKut5lI8kxfM6xGUNP7IA4SI
oAriHklEbwlZC58p6NrmFcb66I9gXsDXtauZTnaPhpI+YRrso0VqMdbTDTtRZjtY
ITyDfUe4T0sW7kkfNXumUn1EwvxT/xrsIVTbWqoJQIybl6xaKixGPb6gPe8Hatqx
2a9QTvd57s5nFRs7t+6KyuW68n4rwIxKJVvmZwJQ2OmAtCI1EFgg1RML2ZPXE54N
ttbcyvAT+ovcC9DGDV8ygctp3pR8cOCJ4GRanbo+JQpe26TATN7S9cogwYa/t78x
WAlqknwn2FGasJ3+ik8zt4j22R4RKuYYmoTXgODiMhbcpBqkvKYD5o5QOgR431oy
XabWf81U0W1qwHjOMct133bG2V7G2C+oEicnVVImv7FarjEr5j6E4lGuKd28CSga
gi56JsHKO7g3VRKl8UCVBBIpOhgpQrI1MBzSnM2hH0Rbv9eDK7JtBQ/qwTsBnCPc
f3NQZ+mm4ypo55mb973u
=s/zC
-----END PGP SIGNATURE-----

--Signature=_Wed__30_Nov_2011_15_52_26_+1100_nKmj.hMCD7Ioe5om--
