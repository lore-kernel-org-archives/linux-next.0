From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: scsi-post-merge tree build failure
Date: Tue, 23 Dec 2008 01:25:45 +1100
Message-ID: <20081223012545.5b1e7f5e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__23_Dec_2008_01_25_45_+1100_C4uTIam8W6Qi0gB4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:59245 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754198AbYLVOZy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 22 Dec 2008 09:25:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org
Cc: linux-next@vger.kernel.org, Kumar Gala <galak@kernel.crashing.org>

--Signature=_Tue__23_Dec_2008_01_25_45_+1100_C4uTIam8W6Qi0gB4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul, Ben,

Today's linux-next build (powerpc ppc44x_config) failed like this:

arch/powerpc/kvm/powerpc.c: In function 'kvm_arch_vcpu_put':
arch/powerpc/kvm/powerpc.c:333: error: implicit declaration of function '_t=
lbil_all'

Probably caused by commit 2a4aca1144394653269720ffbb5a325a77abd5fa
("powerpc/mm: Split low level tlb invalidate for nohash processors").
Reverting just that commit was too difficult, so I have reverted the
powerpc tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__23_Dec_2008_01_25_45_+1100_C4uTIam8W6Qi0gB4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklPo2kACgkQjjKRsyhoI8ziswCdGd83tTUePmb/VttFAMm7qbk9
raMAoKZDYnH54V5Dq3g2T1w5LaqJK6Yv
=EYk9
-----END PGP SIGNATURE-----

--Signature=_Tue__23_Dec_2008_01_25_45_+1100_C4uTIam8W6Qi0gB4--
