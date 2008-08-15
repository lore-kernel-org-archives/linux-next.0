From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ftrace tree
Date: Fri, 15 Aug 2008 11:54:10 +1000
Message-ID: <20080815115410.458633f1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__15_Aug_2008_11_54_10_+1000_+jHr=ruNoPCRiLy8"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43471 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751636AbYHOByV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Aug 2008 21:54:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Jason Baron <jbaron@redhat.com>, Greg KH <greg@kroah.com>

--Signature=_Fri__15_Aug_2008_11_54_10_+1000_+jHr=ruNoPCRiLy8
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in
kernel/module.c between commit 1b75321c2d0561d9ecfe3794fa939264f3eb7e26
("driver core: basic infrastructure for per-module dynamic debug
messages") from the driver-core tree and commit
e543dff1468a55cdff9932dd3a806524790cf0b3 ("tracing: Kernel Tracepoints")
from the ftrace tree.

Overlapping additions.  I fixed it up. Probably worth a look once I
publish the tree.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__15_Aug_2008_11_54_10_+1000_+jHr=ruNoPCRiLy8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkik4cIACgkQjjKRsyhoI8yZkgCfQi6ZMBEK9MFg53NeNMSDO4EP
NlcAn26KhDZN4sr8klLYRzsKR7ketG2y
=AB29
-----END PGP SIGNATURE-----

--Signature=_Fri__15_Aug_2008_11_54_10_+1000_+jHr=ruNoPCRiLy8--
