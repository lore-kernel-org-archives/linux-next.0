From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the drm tree
Date: Wed, 20 May 2015 16:54:08 +1000
Message-ID: <20150520165408.79369e40@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/erj2uxdbV_57USI/u2XmGlT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/erj2uxdbV_57USI/u2XmGlT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

After merging the drm tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpu/drm/drm_crtc.c:4324:13: warning: 'drm_property_unreference_blob=
_locked' defined but not used [-Wunused-function]
 static void drm_property_unreference_blob_locked(struct drm_property_blob =
*blob)
             ^

Introduced by commit 6bcacf51d050 ("drm: Add reference counting to blob
properties").

This has been happening for a while.  I assumed a user for this new API
would come along, but it hasn't ...

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/erj2uxdbV_57USI/u2XmGlT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVXC+VAAoJEMDTa8Ir7ZwVNv0P/1M5KlopYtrSXnAB8Pg16fVq
HiK43eFZsPgHLZmDPFP1HrBPvRAf8CWuPKgsZKlH5I+0bdWzYarLnI9ZA2rdB+gn
d3W/elz+oy/U2eUqI4losTF5dNlNt3X63NkwUwzVXYlcId5KRERfg8VS/oLA8ujQ
L5qBrH+rUfnbLpIBtgbFjZNdj9PKtnlwdQCablhO98Gi9ClouDWGY+AQYakC1TqR
pyq0TU39ZDNzZiADXs4UYEGobZWM6rQSn+c4vsloGd10C1L1AtRhn4tRx6C+LcCE
U8jQJXuVvlP5r69GoL8r13v+Co/KtnhudoDndZjrlyodL4Un8uOHXS60Cr2otLBA
VZlrTKEZrpAbAwiTAIah59qMwA6OEVPwYECq0zxXSwcGLLHyh5CmHKl5RAOfJdsd
z5p7/so28cRvgWtXpafv+SKt7goFAqtOtpkd8k/+G2spo/KKMuCHmtfgASXwo+1/
cg7gl9YIdyC/YmiRgeHhv8B7Icwj6SLxojblAgJU57/1MUpAz40KlzVL83HICJ4Q
XYgM3vAyApfIMdbBYf7GvbtZhqftqPef1n6G4jhD9E7S6L+FMWxLMlHqDAxVVaW5
Xj0B8ysKLrphUjKt+gHox+4OywwdpEN+JL5HHk7afHBFatyt7vljKYxyfKiRfJUG
LpBnnYNKNWVYB7SUTJN4
=THoM
-----END PGP SIGNATURE-----

--Sig_/erj2uxdbV_57USI/u2XmGlT--
