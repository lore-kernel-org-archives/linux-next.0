From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with Linus' tree
Date: Wed, 8 Jul 2015 11:43:07 +1000
Message-ID: <20150708114307.3da73865@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/S_jg4HMWNZxhOWmCrSEMall"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59065 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752195AbbGHBnR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Jul 2015 21:43:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>

--Sig_/S_jg4HMWNZxhOWmCrSEMall
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Today's linux-next merge of the vhost tree got a conflict in:

  MAINTAINERS

between commit:

  4ad6ee91aa9f ("Add MAINTAINERS entry for virtio-gpu")

from Linus' tree and commit:

  f2dbda3b4fc2 ("MAINTAINERS: separate section for s390 virtio drivers")

from the vhost tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc MAINTAINERS
index d558d280fdc1,fbef7d0a4dd5..000000000000
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@@ -10895,15 -10570,15 +10894,24 @@@ F:	drivers/block/virtio_blk.
  F:	include/linux/virtio_*.h
  F:	include/uapi/linux/virtio_*.h
 =20
+ VIRTIO DRIVERS FOR S390
+ M:	Christian Borntraeger <borntraeger@de.ibm.com>
+ M:	Cornelia Huck <cornelia.huck@de.ibm.com>
+ L:	linux-s390@vger.kernel.org
+ L:	virtualization@lists.linux-foundation.org
+ L:	kvm@vger.kernel.org
+ S:	Supported
+ F:	drivers/s390/virtio/
+=20
 +VIRTIO GPU DRIVER
 +M:	David Airlie <airlied@linux.ie>
 +M:	Gerd Hoffmann <kraxel@redhat.com>
 +L:	dri-devel@lists.freedesktop.org
 +L:	virtualization@lists.linux-foundation.org
 +S:	Maintained
 +F:	drivers/gpu/drm/virtio/
 +F:	include/uapi/linux/virtio_gpu.h
 +
  VIRTIO HOST (VHOST)
  M:	"Michael S. Tsirkin" <mst@redhat.com>
  L:	kvm@vger.kernel.org

--Sig_/S_jg4HMWNZxhOWmCrSEMall
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVnIAyAAoJEMDTa8Ir7ZwV18MP/2CF+yD0FVBqFz/pIgRO7/H9
ayzrhfoKtJR90Wep2zx1NCFHnsEKFYXAsNy4SEVh7hxgB8Y6tAZgbK7zETltYx3m
yv7Ut7qRWAqeFuJ1lZJshMZgM+v/NJeEDKPaXdzylUDD8q33KGfW40nDW3i1Wkh1
pDzBgxKNudPLCoQHmVlZ3qn4oZDfSRjIAO1cK/2wSH/PCHPppNS2g1bb+Oasktd+
emlEKvy5A9ximptpIx0uXyYTOJWFzJ8+ITnyes5xPSTJRreNO6UrQXvN8ItwJFCy
koMPKBxhgUd2K8r7OIs5NOdK5LbyMWsPkj8f9FlspedtWmmbtCT/jgCCWDReokrD
kcvUsp718VWDrf9qeryO4ScxSVDPkhGM0/Buv+6rSkrl48OaqBy9yxxIrhr/PANj
oZAhPu7+jzsPnIt7/bcHXJ4SF0YBhJH0WdMiOJmWja1w8ApfxV6cR9jA77jtv081
NcUMwff1dIeQgDcJAuv4K7xvdTLVTGv8oJC6/mkOKnLZ9OTqCW1MPaVpIINcaemW
Xjh33+SU77ycMkNj7Jmb6pMbgUG9+sPqs2Nv+t4IDemh0xOPDbQQETPdWKzEFtNO
kzzvVWK5PjNdISMDyIKxOwppkJrM/6BX9uyB5hf9YR1ab2+gsQ7xL7fOdWREh5VC
mMEfIUa2lzQqegrnWedk
=ulnD
-----END PGP SIGNATURE-----

--Sig_/S_jg4HMWNZxhOWmCrSEMall--
