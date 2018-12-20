From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Thu, 20 Dec 2018 13:28:24 +1100
Message-ID: <20181220132824.341c10e9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/cwsMIF4xqo86oD7MLEsVxTl"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Petr Machata <petrm@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/cwsMIF4xqo86oD7MLEsVxTl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/net/vxlan.c: In function 'vxlan_changelink':
drivers/net/vxlan.c:3763:10: error: too few arguments to function 'vxlan_fd=
b_update'
    err =3D vxlan_fdb_update(vxlan, all_zeros_mac,
          ^~~~~~~~~~~~~~~~
drivers/net/vxlan.c:830:12: note: declared here
 static int vxlan_fdb_update(struct vxlan_dev *vxlan,
            ^~~~~~~~~~~~~~~~

Caused by commit

  ce5e098f7a10 ("vxlan: changelink: Fix handling of default remotes")

from the net tree interacting with commit

  0e6160f3f5a9 ("vxlan: vxlan_fdb_notify(): Make switchdev notification con=
figurable")

from the net-next tree.

I added the following merge fix patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 20 Dec 2018 13:24:05 +1100
Subject: [PATCH] vxlan: fix for vxlan_fdb_update() API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/vxlan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/vxlan.c b/drivers/net/vxlan.c
index efd709a5e3a8..5209ee9aac47 100644
--- a/drivers/net/vxlan.c
+++ b/drivers/net/vxlan.c
@@ -3768,7 +3768,7 @@ static int vxlan_changelink(struct net_device *dev, s=
truct nlattr *tb[],
 					       dst->remote_vni,
 					       dst->remote_vni,
 					       dst->remote_ifindex,
-					       NTF_SELF);
+					       NTF_SELF, true);
 			if (err) {
 				spin_unlock_bh(&vxlan->hash_lock);
 				return err;
--=20
2.19.1

--=20
Cheers,
Stephen Rothwell

--Sig_/cwsMIF4xqo86oD7MLEsVxTl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwa/kgACgkQAVBC80lX
0GwBOwf/Tgik72mNw76kDMNQdtdYVqGCQ9bBVGXIQAvsoqkQcr0TfwmTJNPzLISx
5P2O9wT0N9ruOTW1atmEZQEU1RYRPHaZdBB7wKUvq94ovRc3DxfjPR2+9KOi9voK
ZVkiVkNUjTvTOf03IbhRqYiIsPHClPh9SUVvQT7/97fLsQci6YhM7Ahxtix1ueQU
07wDj1ROEQrKgmFyfeS7jrndCa/xOWp1bszbbFxzEoDYVxa/8duijTSywmIOeVv9
HXVrnYRId2R02JMa5SY2i1mBS1yz6TzJGXlMaUWThB0UcNQloy5CBM3mDh7s2f5o
Oh5nDZ6eNMDVZ+aZD3jhiY6zEZzCmA==
=NjDq
-----END PGP SIGNATURE-----

--Sig_/cwsMIF4xqo86oD7MLEsVxTl--
