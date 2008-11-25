From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Tue, 25 Nov 2008 17:45:54 +1100
Message-ID: <20081125174554.dbd84cde.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__25_Nov_2008_17_45_54_+1100_sPJ=98ueBupYsNpB"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46514 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751379AbYKYGqM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Nov 2008 01:46:12 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

--Signature=_Tue__25_Nov_2008_17_45_54_+1100_sPJ=98ueBupYsNpB
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

arch/powerpc/sysdev/mpic.c:809: error: conflicting types for 'mpic_set_affi=
nity'
arch/powerpc/sysdev/mpic.h:39: error: previous declaration of 'mpic_set_aff=
inity' was here

The declaration in the header file was missed.

Also, the x86_64 allmodconfig build failed like this:

ERROR: "hvc_resize" [drivers/char/virtio_console.ko] undefined!

hvc_resize is currently not exported to modules.

I have dropped the rr tree again.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__25_Nov_2008_17_45_54_+1100_sPJ=98ueBupYsNpB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkrnyIACgkQjjKRsyhoI8x0mgCglij4+9B2C6onK8+BVR0cSYTE
twAAnj/794mcTiUkMuFKP+BK6SsHLXsa
=1MR2
-----END PGP SIGNATURE-----

--Signature=_Tue__25_Nov_2008_17_45_54_+1100_sPJ=98ueBupYsNpB--
