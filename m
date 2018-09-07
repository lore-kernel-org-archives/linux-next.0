From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Fri, 7 Sep 2018 10:20:55 +1000
Message-ID: <20180907102055.001777b8@canb.auug.org.au>
References: <20180903094702.3e32d8f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/o00y6DcKOPhLZD+oNbDYlQD"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903094702.3e32d8f5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Andrew Bowers <andrewx.bowers@intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/o00y6DcKOPhLZD+oNbDYlQD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 3 Sep 2018 09:47:02 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the net-next tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> In file included from drivers/net/ethernet/intel/i40e/i40e_ethtool.c:9:
> drivers/net/ethernet/intel/i40e/i40e_ethtool.c: In function '__i40e_add_s=
tat_strings':
> drivers/net/ethernet/intel/i40e/i40e_ethtool_stats.h:193:20: error: funct=
ion '__i40e_add_stat_strings' can never be inlined because it uses variable=
 argument lists
>  static inline void __i40e_add_stat_strings(u8 **p, const struct i40e_sta=
ts stats[],
>                     ^~~~~~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   8fd75c58a09a ("i40e: move ethtool stats boiler plate code to i40e_ethto=
ol_stats.h")
>=20
> It is not clear this patch has any value anyway as the moved functions
> are only used in the file they were moved from.
>=20
> I reverted that commit for today.
>=20
> The same problem would exist in drivers/net/ethernet/intel/i40evf (where
> a lot of code is duplicated from drivers/net/ethernet/intel/i40e) except
> that this function is not declared inline there.
> Luckily, i40e_ethtool_stats.h is only included my one file
> drivers/net/ethernet/intel/i40evf/i40evf_ethtool.c, otherwise there
> would be multiple copies of __i40e_add_stat_strings().
>=20
> Surely there is some scope for factoring out some common code between
> these two drivers?

Ping?

--=20
Cheers,
Stephen Rothwell

--Sig_/o00y6DcKOPhLZD+oNbDYlQD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAluRxGcACgkQAVBC80lX
0GyM5wf+PcEcOyz/jpNRyt5uTMeWLF8jfjH8roVMR1qLwg2/7nna+QGu4GX37qKx
LO6KqzAczCLiYqckpLv6t4szEFhZtMGEiY5dSBiGp46DgBt/Z61kJ1lcxSD+64lt
MmpCJ65z8LDuM/WdvhjOg7LhydcDLX8ialOl6migO/OC6ucYTowkJpmZcid6ywqu
f5ZkwzHGPVRjFYromfRIONjm4mY/eJmN0HNfDRdWe0mXB9h56qO7opJJgR+MhMwC
gdzFsF12E2QMoPUn0mI3ML/mbcdG2+9m5T/Smx5oV5326/Q+Nzbgb6QH7js7Q06e
GUmMHLPsDxi3SGnI+knh5Ei84HXmcQ==
=1tsM
-----END PGP SIGNATURE-----

--Sig_/o00y6DcKOPhLZD+oNbDYlQD--
