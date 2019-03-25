From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the btrfs-kdave tree
Date: Tue, 26 Mar 2019 07:09:24 +1100
Message-ID: <20190326070924.1857a3fd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/5up7MfN.NOQ/szYoxHKbsXk"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Sterba <dsterba@suse.cz>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Qu Wenruo <wqu@suse.com>
List-Id: linux-next.vger.kernel.org

--Sig_/5up7MfN.NOQ/szYoxHKbsXk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  167ab7e5ebbf ("btrfs: reloc: Fix NULL pointer dereference due to expanded=
 reloc_root lifespan")

Fixes tag

  Fixes: d2311e698578 ("btrfs: relocation: Delay reloc tree deletion after =
merge_reloc_roots()")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format=3D'Fixes: %h (%s)'

--=20
Cheers,
Stephen Rothwell

--Sig_/5up7MfN.NOQ/szYoxHKbsXk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyZNXQACgkQAVBC80lX
0GwUtwgAnqMT9YluZIAXae3fjaTGSoP4BSu4YAJf3gmsY1ddUCuaojxQL4LT24yi
EZMcQwp9F0taJgTG6I3418vLi3LiMqJSRJp+WI7Nd3kbn2WOJR+198LAiIry1BIr
jTZk5oV/JEcfBBcurBTkqYodRDekEWe+h6ndHcryVPouLBBfqTAi+82El9chr7mi
Oco9rsoGlXEvxX05xCFY4li+VkQrSZ5ZTJX2v4WQu5Xt0wM8Ws1KTos3V4iYg8y4
TtQwq3OAwf7GEnYc7FsyDVl2n7gueGLELebEf0pD9I1swUxZSgDQLxJv2Bz5kzgb
pgNeBqRoWDc7NISbh0n7g2ET9oVV/w==
=2zbs
-----END PGP SIGNATURE-----

--Sig_/5up7MfN.NOQ/szYoxHKbsXk--
