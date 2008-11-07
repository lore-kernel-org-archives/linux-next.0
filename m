From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree
Date: Fri, 7 Nov 2008 16:01:37 +1100
Message-ID: <20081107160137.620c1104.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__7_Nov_2008_16_01_37_+1100_8GfIuaCzSZHG/LBk"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33281 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750745AbYKGFBr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 7 Nov 2008 00:01:47 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

--Signature=_Fri__7_Nov_2008_16_01_37_+1100_8GfIuaCzSZHG/LBk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflicts in
include/linux/cpumask.h and lib/cpumask.c between commit
2d3854a37e8b767a51aba38ed6d22817b0631e33 ("cpumask: introduce new API,
without changing anything") from the cpus4096 tree and commit
0c82f41da4f9a68874b584f23feca217ba4fcd62 ("cpumask:new-API-only") from
the rr tree.

These are just different versions of the same patch, so I used the rr tree
version.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__7_Nov_2008_16_01_37_+1100_8GfIuaCzSZHG/LBk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkTy7EACgkQjjKRsyhoI8xjywCfYAN/zM/lHIb2/QE/L6nhSmSd
jggAoL6u81TRgOsadm33TfveVZVrHjRh
=Ykrx
-----END PGP SIGNATURE-----

--Signature=_Fri__7_Nov_2008_16_01_37_+1100_8GfIuaCzSZHG/LBk--
