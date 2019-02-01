From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm tree
Date: Fri, 1 Feb 2019 11:53:51 +1100
Message-ID: <20190201115351.70a23b79@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tHjXEVvVgo3Asx/RuDMdgHF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Josip Pavic <Josip.Pavic@amd.com>, Alex Deucher <alexander.deucher@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/tHjXEVvVgo3Asx/RuDMdgHF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/gpu/drm/amd/amdgpu/../display/modules/power/power_helpers.c:160:9: =
warning: #pragma pack (pop) encountered without matching #pragma pack (push=
) [-Wpragmas]
 #pragma pack(pop)
         ^~~~

Introduced by commit

  1411fd85416f ("Merge remote-tracking branch 'drm/drm-next'")

Commits

  099139bef026 ("drm/amd/display: Pack DMCU iRAM alignment")

from Linus' tree and

  c591d8429df2 ("drm/amd/display: Pack DMCU iRAM alignment")

from the drm tree are identical, but then commit

  bf75572a2536 ("drm/amd/display: Create switching mechanism for ABM 2.2")

added more code before the "#pragma(pop)" and so git's automatic merge
resolution ended up adding the "#pragma(pop)" line twice.

I will fix up the merge resolution for tomorrow.  This will need to be
reported to Linus when the drm tree is merged (or a back merge of
Linus' tree will need to be done - and well commented :-)).

--=20
Cheers,
Stephen Rothwell

--Sig_/tHjXEVvVgo3Asx/RuDMdgHF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxTmJ8ACgkQAVBC80lX
0GxdFwf/TyEr3KPjLAcTYrxVWaaQWHeOf8v0ZRcvhJYb16GpQe7F9CprXURlYutW
OumdQVX0lO8p+q6pJRbJWIgY1lTQsXcPvs5KATjTqsiOIZLwONcYNUIW+G/VqBX1
b206NJHB/yhSbY0DQbOsjB47JAjoUJ0FW7pNxIzSY6tWEn6oUpZi2cp/4kmJH5mL
ASDUOJusWeM6gIkyhh+HFU7p0Z/EkmrMKcqtRQ3pDJ8WTNmnMxCie0nqotR1Azi0
kHlM3bIrErXWxU24yQszbPTq9TF5d6joG34+PCXpvA811+0LYlme5eD+9Qaf0JCp
BwR+SxAJ+JxVZrA18jJ3QoxEMU87+A==
=gOZf
-----END PGP SIGNATURE-----

--Sig_/tHjXEVvVgo3Asx/RuDMdgHF--
