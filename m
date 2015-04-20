From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vhost tree with the virtio tree
Date: Mon, 20 Apr 2015 14:54:18 +1000
Message-ID: <20150420145418.730f0520@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6adTYTJ1NO+B/o/C88xSkDv"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33766 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751058AbbDTEy0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Apr 2015 00:54:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/6adTYTJ1NO+B/o/C88xSkDv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Today's linux-next merge of the vhost tree got a conflict in
drivers/virtio/virtio_balloon.c between commit df81b29c7b81
("virtio_balloon: transitional interface") from the virtio tree and
commit 263f23c089f2 ("virtio_balloon: transitional interface") from the
vhost tree.

I fixed it up (by using the version of the files from the virtio tree)
and can carry the fix as necessary.  Please clean up this mess ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/6adTYTJ1NO+B/o/C88xSkDv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVNIZ+AAoJEMDTa8Ir7ZwVF6UP/jj7M0AzPNVSJegn625UeANb
dIgVujfyLwuiJr3Y5+ACFzGAnZdHeE28BCxX8+eE/WqdP7FzlK/Ui0B/j44OlSFm
rYFfwubPSb+L1UY0a086TZPZyjAALnOJRnmaxD1iYW4EHGV3aPPnudzruUKagV3W
Ufs0m7PJ662/4EfoMy0T7RhQaooWeEKIYpr7GFVZ/9oHhF2tZ0EW/G8ZokWj+siG
TD6h5eHmDe1LS6sxM2+dt/byqFJ0eTE98tJCEJlu7WoMdWn6irHY7z25qCdZXKD8
JkThtRL0/mPHx5Ixs5hxQKUR7QFH2lUFA5e25CmXKI0BDMNucDRBslvQo72r7Ocn
Heh4MmU+/zaD5Nqcj+8uiR6hqHqx9lHHxA8z2UDmAYyll7zdePK4ARUlIeci5BBl
XmZ6yK8NkAMr3W0ADA+mSNGifiJHMDAXPlZ+mm5qAEqUyKT0YetjZ0nGiQQVqHRY
BacYNgqvRFjxdnG/RBjj2nMrh7bb86f3j14pK9F/isx1F9R+7CdNpjzPaAjvNvVp
IcOph7fP8mA5hYkqifS6RJh4NpzuMlbNQjuB3vRQaaDnhCIQtaxEH66mSxCKCN3K
mU7Ru4W5DaQN4TFttvauYw6xoHqyy/zqqj3TvveoEM0cZvZuxuOKsgm8dT76HyOL
5BEJnJOXPVz1g42Qsymd
=tF1D
-----END PGP SIGNATURE-----

--Sig_/6adTYTJ1NO+B/o/C88xSkDv--
