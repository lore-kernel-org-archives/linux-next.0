From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the syscalls tree
Date: Wed, 14 Mar 2018 16:12:07 +1100
Message-ID: <20180314161207.3875243e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/oo1njhRaQ+nm5Uw28jQYZ8G"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/oo1njhRaQ+nm5Uw28jQYZ8G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dominik,

After merging the syscalls tree, today's linux-next build (powerpc
allnoconfig) failed like this:

arch/powerpc/kernel/syscalls.o: In function `ppc_fadvise64_64':
syscalls.c:(.text+0xb8): undefined reference to `ksys_fadvise64_64'

Caused by commit

  fabbf34a610d ("mm: add ksys_fadvise64_64() helper; remove in-kernel call =
to sys_fadvise64_64()")

CONFIG_ADVISE_SYSCALLS is not set in this build ...

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/oo1njhRaQ+nm5Uw28jQYZ8G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqorycACgkQAVBC80lX
0GzzOwf/azWEreJYtz8inG67sAk0PbxgEliozesunQhJQty58ADuLzdjvFfyJEBN
PRqWlZ92o/pf7JsUfx1+4ym+Wwxduc1LDWe94EQs6inFiD14k60gsLV0z+CbWkV2
F5OEY9ad1Ye8v+vGXYRWo1GEh3IVg3mEOFjWEGIHfxOS266cDNoOBiLQbqbq/ofV
rhxaRIXmomnKQSUrTVpXT3R2EbYjbJ6IyodaAv9JWzHq7z2E0v7VUbfNZh6UIeyB
RBNr8r/XFKJVsuz3PtVeHwau0m3aGGl9NKiPo6WxLqzxGtdVTuVoCYLxviqVGESV
Ijk9frLC0BfZ0puMZZBe8VMMIk/6JQ==
=8gQK
-----END PGP SIGNATURE-----

--Sig_/oo1njhRaQ+nm5Uw28jQYZ8G--
