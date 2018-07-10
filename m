From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the random tree
Date: Tue, 10 Jul 2018 17:26:19 +1000
Message-ID: <20180710172619.45e290a2@canb.auug.org.au>
References: <20180608133748.58a272d5@canb.auug.org.au>
        <20180618133523.30db3ba0@canb.auug.org.au>
        <20180618052900.GA4579@eros>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/H55fNMiWsX4Atmo=EKYh.Lq"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180618052900.GA4579@eros>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: "Tobin C. Harding" <me@tobin.cc>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/H55fNMiWsX4Atmo=EKYh.Lq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Jun 2018 15:29:00 +1000 "Tobin C. Harding" <me@tobin.cc> wrote:
>
> On Mon, Jun 18, 2018 at 01:35:23PM +1000, Stephen Rothwell wrote:
> >=20
> > On Fri, 8 Jun 2018 13:37:48 +1000 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote: =20
> > >
> > > After merging the random tree, today's linux-next build (arm
> > > multi_v7_defconfig) produced this warning:
> > >=20
> > > lib/vsprintf.c:1668:13: warning: 'have_filled_random_ptr_key' defined=
 but not used [-Wunused-variable]
> > >  static bool have_filled_random_ptr_key __read_mostly;
> > >              ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > >=20
> > > Introduced by commit
> > >=20
> > >   bfe80ed3d7c7 ("vsprintf: add command line option debug_boot_weak_ha=
sh") =20
> >=20
> > I am still getting this ... =20
>=20
> This is fixed in:
>=20
> 	[PATCH v7 0/4] enable early printing of hashed pointers
>=20
>=20
> FYI v8 to come with unrelated change removing EXPORT_SYMBOL() (as suggest=
ed
> on LKML in response to v7)

Still getting this warning ...

--=20
Cheers,
Stephen Rothwell

--Sig_/H55fNMiWsX4Atmo=EKYh.Lq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltEX5sACgkQAVBC80lX
0Gyqmgf/RHgGjnLbREECJ1WUC0Vi1jsbkSm3sPMHcKFSJntJ2AAnE2qOGKTdXQFO
kVQpVgTiklTnzayjVCYHrWlHBA/4wgxYgsDRv+mLDszCcPyTg4AsHSNSDUHwAffY
uIxWJTWfCtqmGZKjP44l6eQRUrrPDPB41tdG0d4swFCYTFfx888LAQ9lB6Z5hbRu
HBDUdpuMZ6pq3VYBNd21JuwaXagOCEMDRfUYeY3Vi6M25GMaYvn52x1Z6/lTsgWw
caOpl9CTBHBBXxGsWFNSCAl1zti947G9LRG4VBe4G7aN7FrnzNKd1U4njuMRkC0n
bNUlAxArrbRMzxbgp7LMTKN+bwcAGQ==
=Ke9K
-----END PGP SIGNATURE-----

--Sig_/H55fNMiWsX4Atmo=EKYh.Lq--
