From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: kvm tree build warning
Date: Mon, 6 Jul 2009 11:37:52 +1000
Message-ID: <20090706113752.8dec663a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__6_Jul_2009_11_37_52_+1000_M6aF7iBb1J_Ttld3"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41759 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751487AbZGFBhz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 5 Jul 2009 21:37:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gleb Natapov <gleb@redhat.com>

--Signature=_Mon__6_Jul_2009_11_37_52_+1000_M6aF7iBb1J_Ttld3
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Avi,

Today's linux-next build (x86_64_allmodconfig) produced this warning:

arch/x86/kvm/lapic.c: In function 'apic_mmio_write':
arch/x86/kvm/lapic.c:834: warning: 'return' with no value, in function retu=
rning non-void

Introduced by commit 55b23c7377c9f9f0b4a4b90950f0e18b26ac45e8 ("KVM:
x2apic interface to lapic").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__6_Jul_2009_11_37_52_+1000_M6aF7iBb1J_Ttld3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkpRVXAACgkQjjKRsyhoI8z8jACbB5HcAse27/bvsy5NVEDgKTxx
TegAnRKlrD5UeXxF+5p8ieXr4/0QDY0v
=hgBe
-----END PGP SIGNATURE-----

--Signature=_Mon__6_Jul_2009_11_37_52_+1000_M6aF7iBb1J_Ttld3--
