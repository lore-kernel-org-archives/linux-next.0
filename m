From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Date: Fri, 31 May 2019 08:02:12 +1000
Message-ID: <20190531080212.234f5149@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xwFiduZFtHNxIq6+IWrFOX8"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Zhu Yingjiang <yingjiang.zhu@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/xwFiduZFtHNxIq6+IWrFOX8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  970c43d17835 ("ASoC: SOF: Intel: hda: use the defined ppcap functions")

Fixes tag

  Fixes: 8a300c8fb17 ("ASoC: SOF: Intel: Add HDA controller for Intel DSP")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/xwFiduZFtHNxIq6+IWrFOX8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzwUuQACgkQAVBC80lX
0GzVRwgAmyt/mf9wP3UCFmKzhD6E1U3i67ofU3ZBR/QMjdZhjrbwy7cA5uaiSIjZ
u4eQj0C0uzwYfHk7wBhksk4u1Z5Lr4Gvg9lWxd1Q7KR4GUJd5aQoZEeID9lLQ6vI
Xv20PUr7KhpiCfT5oWfdxx/zQfGUPBcXjJv93ZCq/UifX3TNuK0ALXcT9HwsXr1N
bRYz85g03PTDtT9hfUQXzQW6To8lZavwvhO3lLPlcYkVereeVEYz40VU6ojlV7zo
Mp6zs6p/EmTWtNQv0mspARQwY6Td0ehZgam1lxJOOhM4YAqqb25vb3ovcI/deK2O
fiQKx9Y+snzykRoGCUAzvzxVkfMhFw==
=hKvK
-----END PGP SIGNATURE-----

--Sig_/xwFiduZFtHNxIq6+IWrFOX8--
