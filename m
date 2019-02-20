From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 20 Feb 2019 17:44:07 +1100
Message-ID: <20190220174407.753d94e5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0534189928=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Andrew Morton <akpm@linux-foundation.org>, Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Souptick Joarder <jrdr.linux@gmail.com>, =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: linux-next.vger.kernel.org

--===============0534189928==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+dJg47_x3aIGx0KWjrEpAKc"; protocol="application/pgp-signature"

--Sig_/+dJg47_x3aIGx0KWjrEpAKc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/nouveau/nouveau_dmem.c:299:11: error: initialization of 'vm=
_fault_t (*)(struct hmm_devmem *, struct vm_area_struct *, long unsigned in=
t,  const struct page *, unsigned int,  pmd_t *)' {aka 'unsigned int (*)(st=
ruct hmm_devmem *, struct vm_area_struct *, long unsigned int,  const struc=
t page *, unsigned int,  struct <anonymous> *)'} from incompatible pointer =
type 'int (*)(struct hmm_devmem *, struct vm_area_struct *, long unsigned i=
nt,  const struct page *, unsigned int,  pmd_t *)' {aka 'int (*)(struct hmm=
_devmem *, struct vm_area_struct *, long unsigned int,  const struct page *=
, unsigned int,  struct <anonymous> *)'} [-Werror=3Dincompatible-pointer-ty=
pes]
  .fault =3D nouveau_dmem_fault,
           ^~~~~~~~~~~~~~~~~~
drivers/gpu/drm/nouveau/nouveau_dmem.c:299:11: note: (near initialization f=
or 'nouveau_dmem_devmem_ops.fault')

Caused by commit

  5be73b690875 ("drm/nouveau/dmem: device memory helpers for SVM")

from the drm tree interacting with commit

  ed814eb7f91d ("mm/hmm: convert to use vm_fault_t")

from the akpm-current tree.

I added this merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 20 Feb 2019 17:36:18 +1100
Subject: [PATCH] drm/nouveau/dmem: update for struct hmm_devmem_ops member
 change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouve=
au/nouveau_dmem.c
index 8be7a83ced9b..e2539f64de60 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -261,7 +261,7 @@ static const struct migrate_vma_ops nouveau_dmem_fault_=
migrate_ops =3D {
 	.finalize_and_map	=3D nouveau_dmem_fault_finalize_and_map,
 };
=20
-static int
+static vm_fault_t
 nouveau_dmem_fault(struct hmm_devmem *devmem,
 		   struct vm_area_struct *vma,
 		   unsigned long addr,
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/+dJg47_x3aIGx0KWjrEpAKc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxs9zcACgkQAVBC80lX
0Gwadgf/VIgna3rMoT847apJKSCz10Qh+o1R+XypRCrd1PK8532r38hClmC/KVv+
dqNVQp8m0D+IGs2nHQPeKO/E50a2l6Dn0BjwRAA3XrorCc1kYOgH9mSDt4pQoMJP
HaEpfMMipuUpSuK5aEkFugiQedH9hI0mguLYbQE8z5ayPEIkugryqV1XJZS1+3wY
MO+8JtNK3NsC3Jm8R79eyrdSDDWscVugyzJakkHRq46dVc1lysEJhdAfdDMSqVvP
A6ITfrGUY2mQZbOr3MwlXKBpVgvc9p0jgmGaGcOZUoP5oe7s0IBlv4badkarFTHm
lSs70odR+xMLZoWoBQLu3+sUSJRwlQ==
=chSB
-----END PGP SIGNATURE-----

--Sig_/+dJg47_x3aIGx0KWjrEpAKc--

--===============0534189928==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0534189928==--
