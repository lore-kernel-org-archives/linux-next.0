From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commit in the akpm-current
 tree
Date: Thu, 31 Jan 2019 11:10:46 +1100
Message-ID: <20190131111046.36de09c3@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UiKbF2mukKUwH.FHPvoP2VG"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, zhong jiang <zhongjiang@huawei.com>, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, Yang Shi <yang.shi@linux.alibaba.com>, Uladzislau Rezki <urezki@gmail.com>, Shuriyc Chu <sureeju@gmail.com>, Joe Perches <joe@perches.com>
List-Id: linux-next.vger.kernel.org

--Sig_/UiKbF2mukKUwH.FHPvoP2VG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  7a738192604a ("mm/page_owner: align with pageblock_nr_pages")
  ed2205fd9fc0 ("filemap-drop-the-mmap_sem-for-all-blocking-operations-fix")
  d5b0dce6cd86 ("mm-swap-check-if-swap-backing-device-is-congested-or-not-f=
ix-2")
  bce20e289b36 ("vmalloc-add-test-driver-to-analyse-vmalloc-allocator-fix")
  e59a90e1c227 ("fs/file.c: initialize init_files.resize_wait")
  8a97a2585bb6 ("checkpatch: don't interpret stack dumps as commit IDs")

are missing a Signed-off-by from their authors.

I understand that some of these will be merged into other patches ...
--=20
Cheers,
Stephen Rothwell

--Sig_/UiKbF2mukKUwH.FHPvoP2VG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxSPQYACgkQAVBC80lX
0Gzy/QgAmyOT4EG1pnrhxl52fSgpDTiCCV7meYYuaVG+HHGYrIE97Z80qDTL9RgG
jlzBVPSzRyZ+6YfVM+PPx7zpt0h2gVixHAnaE08tp7kUv/ZqFPnblQDqtalPLaKY
+6KFNiZJ1FA4/SskLuvmj+yIcZDUfRhb9wdmb4ckTdxFlD4F86Ya6zBCENjqgV40
zIkElxmG8b5aCg/sUyWejqSaFq5POwxJPPuxYtpx71LDgA/GHydBKbX+xbrTguga
kkc9353XkehSSLJ/LE4nqH+wloqCOhd/nlk9D/0FyLaV5RZpxkTXn3okIJ0WwHA9
Pod+UzjBFktMCfxLvjgFv0bARJL3Sg==
=OiLt
-----END PGP SIGNATURE-----

--Sig_/UiKbF2mukKUwH.FHPvoP2VG--
