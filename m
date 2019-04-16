From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Date: Tue, 16 Apr 2019 16:52:56 +1000
Message-ID: <20190416165256.1fbf2445@canb.auug.org.au>
References: <20190329133914.45a4a255@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/XYLkmfGc2/zB5gjO9VQDMAM"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190329133914.45a4a255@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, George Spelvin <lkml@sdf.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/XYLkmfGc2/zB5gjO9VQDMAM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 29 Mar 2019 13:39:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> lib/list_sort.c:17:36: warning: 'pure' attribute ignored [-Wattributes]
>    struct list_head const *, struct list_head const *);
>                                     ^~~~~~~~~
>=20
> Introduced by commit
>=20
>   820c81be5237 ("lib/list_sort: simplify and remove MAX_LIST_LENGTH_BITS")

I am still getting that warning :-(

--=20
Cheers,
Stephen Rothwell

--Sig_/XYLkmfGc2/zB5gjO9VQDMAM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly1e8gACgkQAVBC80lX
0Gyr2Af8CgFxfluH1FgLdb+1E9LjxKmQbweuEQV2/GXQ6ipMQ/P5h3gzQcwA0mXs
USAXvqcjF8bNVNEX7azE/yFJIvbmXZCWzArrl2hGrVhg88nx45dljHHQ5mhgymPk
V538RoJXEGRWkvtJ+mMCJokwq529anFfco8I+82yxFGexf+wC988TLkvyLqyxTv+
cNRYT8u/QaLbQqmp8SB7bKk7SfMGDpZqrlCaRiIHtdF3aP1Zs38mDYEDZ6AP/RoD
NG6na2yT2tJUz2BVXvy1ixHKV+/evpnkKxA4PX2dmgCkoBteu+oeHlieoDlf1ydB
KFDTt34JomAYSadnL1yHHvJelq5KqA==
=blY6
-----END PGP SIGNATURE-----

--Sig_/XYLkmfGc2/zB5gjO9VQDMAM--
