From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the tip tree with the s390 tree
Date: Wed, 11 Oct 2017 16:51:45 +0100
Message-ID: <20171011155145.sfrwpb3b3rol7l3i@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cfv3c6rynq5kjbbr"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:60706 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750999AbdJKPwW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Oct 2017 11:52:22 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Kirill Tkhai <ktkhai@virtuozzo.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--cfv3c6rynq5kjbbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/s390/include/asm/rwsem.h

between commit:

   91a1fad759ffd ("s390: use generic rwsem implementation")

=66rom the s390 tree and commit:

   a61ba2c8a48f1 ("locking/arch, s390: Add __down_read_killable()")

=66rom the tip tree.

I fixed it up by re-deleting the file and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--cfv3c6rynq5kjbbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnePhEACgkQJNaLcl1U
h9BvaQf7BwmyIS4KXo2FXGY6h1BDaklojr+U9C4QTNP9MRb1XgV0iTdVJ9D8VuAv
eW6hxjTio9yGb8wGJAXV7ShOYsG+iYbVN71bDvJS+6NPEQ6p+TETYXBsL68OCuWI
l4nSCc7rfb/WMebKRT4QxVsICZAWNgCuuN2RWrOLkvRsGx4fY0eTmVMaA1NpI9wJ
9PGwn9JajnEQGaTUCEJxtGk6txCnGJ0AkEHSA2jFnFMCTKdSdGz6UTgbieRE7Y0B
G1l6jSkL+koP1OaSrJ3X/1OWC4hC7ZZMRmHlQdVe/lr8JMR2v7ViNpEhRk3vGox+
psIzNA9/XSvG2MAgFZ0PJd17IajZAw==
=X7oK
-----END PGP SIGNATURE-----

--cfv3c6rynq5kjbbr--
