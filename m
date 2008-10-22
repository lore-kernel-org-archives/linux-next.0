From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: failed import of the rr tree
Date: Thu, 23 Oct 2008 10:29:51 +1100
Message-ID: <20081023102951.db38e08c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__23_Oct_2008_10_29_51_+1100_5t82vnaf0p9pOZ3B"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34972 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751571AbYJVX37 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Oct 2008 19:29:59 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__23_Oct_2008_10_29_51_+1100_5t82vnaf0p9pOZ3B
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next import of the rr tree failed like this:

virtio:net-mergeable-rx-bufs.patch
error: patch failed: include/linux/virtio_net.h:44
error: include/linux/virtio_net.h: patch does not apply

patch(1) will not apply that patch either ...

$ patch -p1 -E <.dotest/patch=20
patching file drivers/net/virtio_net.c
patching file include/linux/virtio_net.h
Hunk #2 FAILED at 45.
1 out of 2 hunks FAILED -- saving rejects to file include/linux/virtio_net.=
h.rej

I removed that patch from the series today and hope that nothing later
depended on it.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__23_Oct_2008_10_29_51_+1100_5t82vnaf0p9pOZ3B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj/t28ACgkQjjKRsyhoI8zEAACdHDVMZnbNtr9Od/8VOFmH8Bjt
AXIAn3HoTc37nCTTGuArG8oDTBI6dKVq
=ZN2F
-----END PGP SIGNATURE-----

--Signature=_Thu__23_Oct_2008_10_29_51_+1100_5t82vnaf0p9pOZ3B--
