From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Date: Thu, 22 Mar 2018 17:37:22 +1100
Message-ID: <20180322173722.78d012c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0081964174=="
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
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============0081964174==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Z9KNElp.WKMlbYCpqfQ=Q8u"; protocol="application/pgp-signature"

--Sig_/Z9KNElp.WKMlbYCpqfQ=Q8u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got conflicts in several amdgpu
files because there are a set of (mostly identical) patches that appear
Linus' tree and the drm tree.  In each case I just used the version fo
the file from the drm tree.

You should do a test merge between your tree and Linus' tree and see what
you want to do about the resolution (either do the back merge (I think
with v4.16-rc6), or provide Linus with branch that has the merge done).
Its a bit of a mess :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/Z9KNElp.WKMlbYCpqfQ=Q8u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqzTyIACgkQAVBC80lX
0GwVgggApZvAvAblCkES91oKgvH7ZydJaoAG8ice8wQdAPJD2lbtzwUwVp1geMGd
jwds66ii74Znr3LbUhxZ+tipoDGsAk8HgabMm4OuRjXmwWjFvGutZt2q9/vCpHbq
tS4RJx2XLmzxEzfVEMnQ3GMEVlwwjCyluhL2Of8VGY6f1e7WJesKl2/B8DyhnITw
vd8dj7cRYRydlyLHB/KV3ahjYpV75hLNAjZ0u366rslJ04pQADLCdIAiJY/hr0bv
PhGmoo5+SHVlXDXKbrfwR6+ApGe1vyBATAP3weanagOubEgVW9RoUG33HAcaNt9e
gCOOJhDQxFrdFDYWbHUClRSESqXeYA==
=isrG
-----END PGP SIGNATURE-----

--Sig_/Z9KNElp.WKMlbYCpqfQ=Q8u--

--===============0081964174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0081964174==--
