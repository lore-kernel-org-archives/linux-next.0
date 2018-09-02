From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the net-next tree
Date: Mon, 3 Sep 2018 09:47:02 +1000
Message-ID: <20180903094702.3e32d8f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZNNK2TVTwXRyyUCbaVN90rD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Andrew Bowers <andrewx.bowers@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ZNNK2TVTwXRyyUCbaVN90rD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from drivers/net/ethernet/intel/i40e/i40e_ethtool.c:9:
drivers/net/ethernet/intel/i40e/i40e_ethtool.c: In function '__i40e_add_sta=
t_strings':
drivers/net/ethernet/intel/i40e/i40e_ethtool_stats.h:193:20: error: functio=
n '__i40e_add_stat_strings' can never be inlined because it uses variable a=
rgument lists
 static inline void __i40e_add_stat_strings(u8 **p, const struct i40e_stats=
 stats[],
                    ^~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  8fd75c58a09a ("i40e: move ethtool stats boiler plate code to i40e_ethtool=
_stats.h")

It is not clear this patch has any value anyway as the moved functions
are only used in the file they were moved from.

I reverted that commit for today.

The same problem would exist in drivers/net/ethernet/intel/i40evf (where
a lot of code is duplicated from drivers/net/ethernet/intel/i40e) except
that this function is not declared inline there.
Luckily, i40e_ethtool_stats.h is only included my one file
drivers/net/ethernet/intel/i40evf/i40evf_ethtool.c, otherwise there
would be multiple copies of __i40e_add_stat_strings().

Surely there is some scope for factoring out some common code between
these two drivers?
--=20
Cheers,
Stephen Rothwell

--Sig_/ZNNK2TVTwXRyyUCbaVN90rD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluMdnYACgkQAVBC80lX
0Gwb4Qf+MOMSL1ycz0LwsoSipwGk2jGgeSx71ZWrO2jhOxYqHLUR/naoHD+NSvDN
Gxyyf2RTHXp2liEFCBPjw4s5QTrrwvtbxjvy9Q/70/39XoCsnQ1/c/4VmRU+PcRN
iMXEcr2FqZbdi+m1aD562Z5UPfnnYrxzWD1QHidugrG7NnRqh5o4mKcbT8A858od
0yPRUMp1Y+/bhTd+LZOqqb1HjLaf6AXdXqw1F/C2zdiInHdaGjqEjY9GV/vFjbUb
nSWAuPqyA7HaZ/vgkQgW0HxDAdU2TRnJvXHsAyyij1STYJ6eK/Md5Rcu8HI1NI4C
wR1ps8IxXcKLGpbUGB8Nv/UR2r/TYw==
=sU4X
-----END PGP SIGNATURE-----

--Sig_/ZNNK2TVTwXRyyUCbaVN90rD--
