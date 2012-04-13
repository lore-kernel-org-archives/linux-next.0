From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Fri, 13 Apr 2012 13:38:17 +1000
Message-ID: <20120413133817.f8bbf0f6d95ada9f86b93800@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Fri__13_Apr_2012_13_38_17_+1000_.Qf9olWIl5lG9kKp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Daniel Kurtz <djkurtz@chromium.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Fri__13_Apr_2012_13_38_17_+1000_.Qf9olWIl5lG9kKp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
drivers/gpu/drm/i915/intel_i2c.c between commit 6a562e3daee2 ("Revert
"drm/i915: reenable gmbus on gen3+ again"") from Linus' tree and commits
0fb3f969c868 ("drm/i915: enable gmbus on gen2") and 2ed06c93a1fc
("drm/i915/intel_i2c: gmbus disabled and reserved ports are invalid")
from the drm tree.

I just used the drm tree version.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Fri__13_Apr_2012_13_38_17_+1000_.Qf9olWIl5lG9kKp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJPh5+pAAoJEECxmPOUX5FEs2UQAIfOng81sp1HGdbxMYFcu+Ff
x3MHCwZtx411zoIHcdcTaPWMyWPqX3L+vIuwy15/vVtsMiDZMGRWeBmn73aFyKsw
ib3OnV8Q528vSal5mydSx+nLWLshgdAtUPeww1IGVOdpATkxSwfFEepw/CYB/gss
rWnMmm4Spn4XtASFx7WC7gsUs4bmVxjXDWCMHtlq0enwqcglkGLpqmFHzZZNdSpN
acbteBSwof69NOJwy0/5L+VMdtn1YplH4crmH7xEHwTVRUGk3diDbKMPgk/AeNdn
6BQT+9W2sbERYXc5liHjdz2Kp9fzIbjUwEyO3sNK6GVERDDPpRhgZXT6SObpH2Dd
9Shi/qm4ItT1l/5NDfAIEg14lyn4KnDvhGNlgDxBLFrkdLYLgFHyuuF6iuHr/mbx
K5jNoBQlEjfGswjN0ZjyYgEpe5FCGkwzQ10k6KlwiqC0Eqb8GX84MEfCM7kxAVcS
ZBkxnp7COLlADf1ae0oka1fK1mOecoqUlGqXPVwxSCI+vt1i9pLuwkxGtqCefiHk
SaC9X5O40WmcSwr2+VI+zJMnuruJ746RsnxDzdbampdqAnPPDTwbIsUSYR31ZtFG
1MLviR4ygVVugnRun9cAfDyld9M2o6n+BhCXg68Sv2KM5ZVIhrBBChQQNIqBiPul
3cbZlUJ4RiDPM06tfyHP
=Q3U8
-----END PGP SIGNATURE-----

--Signature=_Fri__13_Apr_2012_13_38_17_+1000_.Qf9olWIl5lG9kKp--
