From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: scsi-post-merge tree build failure
Date: Thu, 11 Dec 2008 19:27:37 +1100
Message-ID: <20081211192737.44532af0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__11_Dec_2008_19_27_37_+1100_4KN5uiKEX3Q9TX6H"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:44826 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754702AbYLKI1q (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Dec 2008 03:27:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__11_Dec_2008_19_27_37_+1100_4KN5uiKEX3Q9TX6H
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next build (powerpc ppc44x_config) failed like this:

arch/powerpc/lib/dma-noncoherent.c:80: error: redefinition of 'struct vm_re=
gion'

Caused by commit f65466230e8afd45f716e5b836711ce270f45105 ("NOMMU: Make
VMAs per MM as for MMU-mode linux").

I have dropped the nommu tree for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__11_Dec_2008_19_27_37_+1100_4KN5uiKEX3Q9TX6H
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAklAzvkACgkQjjKRsyhoI8zqhwCdEf/HNOqSlnRWkFeLqI274fNH
mVwAn3jQAYjPWli++jyBYbD1q1YsyCCB
=v5Du
-----END PGP SIGNATURE-----

--Signature=_Thu__11_Dec_2008_19_27_37_+1100_4KN5uiKEX3Q9TX6H--
