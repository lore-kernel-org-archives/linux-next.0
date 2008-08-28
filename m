From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: sparc build failure
Date: Thu, 28 Aug 2008 16:51:49 +1000
Message-ID: <20080828165149.4e6089e8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__28_Aug_2008_16_51_49_+1000_rOncyHcQ5fmThq_7"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35280 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752095AbYH1Gv4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Aug 2008 02:51:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>, Ingo Molnar <mingo@elte.hu>

--Signature=_Thu__28_Aug_2008_16_51_49_+1000_rOncyHcQ5fmThq_7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

The sparc32 allmodconfig build of linux-next (next-20080827) failed like
this (among other things):

ERROR: "nr_irqs" [drivers/net/hamradio/baycom_ser_fdx.ko] undefined!
ERROR: "nr_irqs" [drivers/net/3c59x.ko] undefined!

Introduced by the sparseirq tree.

nr_irqs is not exported for sparc.  I will add a patch to add the export
to linux-next today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__28_Aug_2008_16_51_49_+1000_rOncyHcQ5fmThq_7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAki2SwYACgkQjjKRsyhoI8yq8QCfT4t4gEp4ut4VsDEEn59bg1Ju
VCQAoLxU1nDzgYYt7B1LPVOpNwZfjoH5
=B5Gx
-----END PGP SIGNATURE-----

--Signature=_Thu__28_Aug_2008_16_51_49_+1000_rOncyHcQ5fmThq_7--
