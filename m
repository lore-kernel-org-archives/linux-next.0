From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: unable to fetch the drm-intel-fixes tree
Date: Mon, 3 Jun 2019 08:20:51 +1000
Message-ID: <20190603082051.273a014c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0362050316=="
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============0362050316==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/1_9rLO0/J=YT2o1Opl+PJ50"; protocol="application/pgp-signature"

--Sig_/1_9rLO0/J=YT2o1Opl+PJ50
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Trying to fetch the drm-intel-fixes tree today gives me this error:

-----------------------------------------------------------------
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
-----------------------------------------------------------------

The same for drm-misc-fixes, drm-intel and drm-misc.  These are all
hosted on git://anongit.freedesktop.org/ .

--=20
Cheers,
Stephen Rothwell

--Sig_/1_9rLO0/J=YT2o1Opl+PJ50
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz0S8MACgkQAVBC80lX
0Gz3UQf9E0cKzaW8f5StW3DTvDdZiWjw1QyXRHKf8WQoEXoPZwtJ+0sJ64rdgg5N
5ohpavRBGdD3FScFgbbCQw5O1Sq2yUVp328M+Er7LgqYrjr0CVrdRWnETC/Opujq
7/Vpq33iyAqSsNH00H0cdU9Rj0CaTcQE1K2OlYmZucqXPldsT2UWTli3+SufoiUL
ygs4VwVjBfld47TKB+xJF/ucl6b5egXv+Wnk5QR42FwkKSdFyLXxeVLnyZ60LerE
583IymIdHjMOlg4j8iZ3vZw6mpbGKveoGo1FNh5O9ziNgqXXP2H69EyfAWyirvU3
5rXk2jci4jM9RCzU6bxf4JtV9gFYbQ==
=leUS
-----END PGP SIGNATURE-----

--Sig_/1_9rLO0/J=YT2o1Opl+PJ50--

--===============0362050316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0362050316==--
