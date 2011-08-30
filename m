From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rr tree
Date: Tue, 30 Aug 2011 14:03:25 +1000
Message-ID: <20110830140325.7af8d5d4e88d907aed45780e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__30_Aug_2011_14_03_25_+1000_aOl3g027QewwUeZ7"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wang Sheng-Hui <shhuiw@gmail.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__30_Aug_2011_14_03_25_+1000_aOl3g027QewwUeZ7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

After merging the rr tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

In file included from include/linux/vhost.h:17:0,
                 from drivers/vhost/vhost.c:15:
include/linux/virtio_ring.h: In function 'vring_init':
include/linux/virtio_ring.h:138:69: error: '__16' undeclared (first use in =
this function)
In file included from include/linux/vhost.h:17:0,
                 from drivers/vhost/net.c:11:
include/linux/virtio_ring.h: In function 'vring_init':
include/linux/virtio_ring.h:138:69: error: '__16' undeclared (first use in =
this function)
In file included from drivers/virtio/virtio_ring.c:20:0:
include/linux/virtio_ring.h: In function 'vring_init':
include/linux/virtio_ring.h:138:69: error: '__16' undeclared (first use in =
this function)
In file included from drivers/virtio/virtio_pci.c:24:0:
include/linux/virtio_ring.h: In function 'vring_init':
include/linux/virtio_ring.h:138:69: error: '__16' undeclared (first use in =
this function)

Caused by commit 217391e3dedb ("virtio: modify vring_init and vring_size
to take account of the layout containing *_event_idx").

I have used the rr tree from next-20110829 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__30_Aug_2011_14_03_25_+1000_aOl3g027QewwUeZ7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOXGENAAoJEDMEi1NhKgbsPK0IAJ2SSJWEDk42eV7o6hefB/Xq
fSQ8xe/ffF7itw3MkGLmp4lDvPIjVJ1Qc2M4bEpM/xNyxs8KNSlxlJIv+/rbtRRi
Gl9Sgczy5H6HRpPxK5qDlJoR4qEtHwxnbEYYjz7sr+YDoZ9+AoPBE+cXIwEdzSmt
kgerxWAqoU+0/BgQVbgwB0cVoNpUyx9MCmOS9g+XkWGnzjSd6hV+bWM+8B1feVkx
mMB5Bodni0TTPiY59LDblNINHfOHlug5GADxUNICoUDI7dn5C0dbIiMOrKhLPrQH
eVXF4eOuGj1chLxSgr0xB7cJHa2RySYzDt7XfhJnuFDZ62oCB9jD7wQ1vFxoL2w=
=IFX3
-----END PGP SIGNATURE-----

--Signature=_Tue__30_Aug_2011_14_03_25_+1000_aOl3g027QewwUeZ7--
