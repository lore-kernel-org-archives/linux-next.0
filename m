From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the signal tree with the vfs tree
Date: Fri, 12 Oct 2012 15:09:16 +1100
Message-ID: <20121012150916.ef4a48cd60846edfc23f9676@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__12_Oct_2012_15_09_16_+1100_AI14n.88CL//XV=q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:43066 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751325Ab2JLEJT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 12 Oct 2012 00:09:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Layton <jlayton@redhat.com>

--Signature=_Fri__12_Oct_2012_15_09_16_+1100_AI14n.88CL//XV=q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the signal tree got a conflict in
arch/powerpc/kernel/sys_ppc32.c between commit 2a5e5beb88c5 ("vfs: define
struct filename and have getname() return it") from the vfs tree and
commit be6abfa769fa ("powerpc: switch to generic sys_execve()/
kernel_execve()") from the signal tree.

The latter removed removed the function that was modified by the former,
so I did that and can carry the fix as necessary (no action is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__12_Oct_2012_15_09_16_+1100_AI14n.88CL//XV=q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQd5fsAAoJEECxmPOUX5FEkBYP/iInroyMaCa4MvZjR/1IdCK0
n6r1S+UsdEVeVud86k7rKDHyi+rtgsMgKscbOkvqe1QZ4DX4JFEYJ2D3uNl0vJD5
eqTwnHPv8V3SbVwA/iA7DcM8iDtHb5AL431qvTQntiukYuGdPyZTkAjyZWF6UDuz
+C+Egiys5zCHfYzIq2OXKtyGY4jCHtjKDC5nt3jhHz0PzF+mJRoSgERXEZb+N8l5
8zZtAt3IlI6kDXSy72qVlhscxjcog+CeU+pUB0lIpI4mp3z7TIFzk0iuDV42hEps
t8qXs2nmS62hutEDTGQKdUCu9Bz0HwY+4ShpW9uI0ev5DtY6bfVvKghCEFNyM748
r4IKWs1atSan48QjTAYfH4rKFit8AU2t6gt+609azdqpTr8qcqdxG34cVK9eMvM/
8uxwj6OpTzZPtaXGB0aNBOfavg04xFHZWE4XB3bWfMpjosDBOmyOoDj3A27RaXrD
8Z2neUPEd6/mfRx0EiyqiTx0s6Txq5XpXOxL8LkecVPDBT0AhPnBC6524AXiEosx
Xti/4SWqQqqo4wLul8P9mhcaDxNzibjjEA2BX0K/IXWIAONrQYsp5YXdXsd+0W+J
xYF97EM7VbKYpCrTxiXxtqOHXFListdrwc6epXmGOevcKs1ypiP4qYHDfg99PeRp
Q737vOZJogBYnaclfeeX
=rfEm
-----END PGP SIGNATURE-----

--Signature=_Fri__12_Oct_2012_15_09_16_+1100_AI14n.88CL//XV=q--
