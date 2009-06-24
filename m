From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with Linus' tree
Date: Wed, 24 Jun 2009 13:08:58 +1000
Message-ID: <20090624130858.25ee5c73.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__24_Jun_2009_13_08_58_+1000_Q1Odf/6tVh5NFK.Z"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53124 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751220AbZFXDJF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Jun 2009 23:09:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lai Jiangshan <laijs@cn.fujitsu.com>

--Signature=_Wed__24_Jun_2009_13_08_58_+1000_Q1Odf/6tVh5NFK.Z
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in kernel/cpu.c
between commit 31950eb66ff47c946fd9c65c2f8c94b6b7ba13fc ("mm/init:
cpu_hotplug_init() must be initialized before SLAB") from Linus' tree and
commit 7ad613eb4d867245f0964e395e6087ae7f126b95 ("cpuhotplug: remove
cpu_hotplug_init()") from the rr tree.

It looks like they are trying to do the same thing ... I used the version
from Linus' tree.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__24_Jun_2009_13_08_58_+1000_Q1Odf/6tVh5NFK.Z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpBmMoACgkQjjKRsyhoI8wAjACgumzKUgpESdMlEWK5+OYOTF4C
2dYAnjjAAUYXv6lDQgOR1Av2quYfHChi
=60Pt
-----END PGP SIGNATURE-----

--Signature=_Wed__24_Jun_2009_13_08_58_+1000_Q1Odf/6tVh5NFK.Z--
