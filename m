From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm tree
Date: Mon, 19 Feb 2018 10:18:17 +1100
Message-ID: <20180219101817.5f4fd5c2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1597240955=="
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
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@amd.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Monk Liu <monk.liu@amd.com>
List-Id: linux-next.vger.kernel.org

--===============1597240955==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/TQ.MrOhN1mFXBEKYYkSOsxv"; protocol="application/pgp-signature"

--Sig_/TQ.MrOhN1mFXBEKYYkSOsxv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from include/linux/list.h:9:0,
                 from include/linux/wait.h:7,
                 from include/linux/wait_bit.h:8,
                 from include/linux/fs.h:6,
                 from include/linux/highmem.h:5,
                 from drivers/gpu/drm/drm_memory.c:36:
drivers/gpu/drm/drm_memory.c: In function 'drm_get_max_iomem':
include/linux/kernel.h:808:16: warning: comparison of distinct pointer type=
s lacks a cast
  (void) (&max1 =3D=3D &max2);   \
                ^
include/linux/kernel.h:817:2: note: in expansion of macro '__max'
  __max(typeof(x), typeof(y),   \
  ^~~~~
drivers/gpu/drm/drm_memory.c:159:15: note: in expansion of macro 'max'
   max_iomem =3D max(max_iomem,  tmp->end);
               ^~~

Introduced by commit

  82626363a217 ("drm: add func to get max iomem address v2")

tmp->end is a resource_size_t ...

--=20
Cheers,
Stephen Rothwell

--Sig_/TQ.MrOhN1mFXBEKYYkSOsxv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqKCbkACgkQAVBC80lX
0GximQf/cB9eMuc/HqdqCGeB8ahFZqleh8kuLyj1RSwTF7DsLN+QCYxqB3PsMASo
YN0E9WWYio79gfQe4erh5sujRcPAfWAhlkAtatoNKox+5u/syNdU6f9gipKFwYjq
7Jja9gUa2eoXm+ZoRZyaU6e9lUdmxJWghogAv54C+GGi2M7UrDExKrhpMtUSUqFP
9sPmdwTs0bhigRCoYVFH2SxLCabWzTfF4WIGbzOVK/cW149Vp5gINx0a6OwB85Vx
00+vyshH8VkcCCFxxD4+/9IuY63mD7OICbpVRr/SsPBePu/dghMGSPjuWvzrznrr
nTHYDOQx6HlXzHZMmLr5fkbimrRnMg==
=ubf7
-----END PGP SIGNATURE-----

--Sig_/TQ.MrOhN1mFXBEKYYkSOsxv--

--===============1597240955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1597240955==--
