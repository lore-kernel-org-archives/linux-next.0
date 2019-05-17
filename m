From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for May 17
Date: Fri, 17 May 2019 19:53:40 +1000
Message-ID: <20190517195340.269ba527@canb.auug.org.au>
References: <20190517142152.588edb6e@canb.auug.org.au>
        <a119ca58-6771-cc36-fe5a-187ba500010a@virtuozzo.com>
        <07e1a10a-5348-2d2e-fb6a-c9ef837185fe@virtuozzo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/x30sYicc=Trq=q+7RRhjQSu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <07e1a10a-5348-2d2e-fb6a-c9ef837185fe@virtuozzo.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kirill Tkhai <ktkhai@virtuozzo.com>
Cc: atish.patra@wdc.com, palmer@sifive.com, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/x30sYicc=Trq=q+7RRhjQSu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 17 May 2019 12:43:08 +0300 Kirill Tkhai <ktkhai@virtuozzo.com> wrot=
e:
>
> On 17.05.2019 12:41, Kirill Tkhai wrote:
> > On 17.05.2019 07:21, Stephen Rothwell wrote: =20
> >> Hi all,
> >>
> >> Please do not add any v5.3 material to your linux-next included
> >> trees/branches until after v5.2-rc1 has been released.
> >>
> >> Changes since 20190516:
> >>
> >> The kvm tree gained conflicts against Linus' tree.
> >>
> >> Non-merge commits (relative to Linus' tree): 1023
> >>  1119 files changed, 27058 insertions(+), 7629 deletions(-) =20
> >=20
> > Binary file was added:
> >=20
> > ~/linux-next$ git log --oneline ./modules.builtin.modinfo
> > 4cbb0d07b4d1 RISC-V: Support nr_cpus command line option. =20
>=20
> CC Palmer.

It's been fixed in the risc-v tree since it was included in linux-next
today.

--=20
Cheers,
Stephen Rothwell

--Sig_/x30sYicc=Trq=q+7RRhjQSu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzehKQACgkQAVBC80lX
0Gw1WggAjoBLD0Ea9Npr3UG0H/u07ONi1zuf4U7kYTpaNgETz9eizPAw2P7c8hXb
fp8hLZkJ7169QSei02HiIHL80hwxfsxY8rz9ZRVwGV47oZHhuO+XRwkvFC28S3e7
k7c3RkU/1rKQdEKoY6H1fMS5VF7J2Uls96sddQq5nQAdxs7fr+aBpIEHxapk9qjl
F2Cl8mj5nfDMeeR8iNeapVEQlrUGv2t+zncBrT/WJN0AnubD9ufQO4Eyv21GayWA
9u2urrEWRW5qsRLvMZDEzKLoaGzMCKSZxZibTnVXoo4wWNwTkXLcugq2Ybaam3Fj
zyB5nnPoSOIf5UvgeUBr52v2Pi6Bkw==
=lRvW
-----END PGP SIGNATURE-----

--Sig_/x30sYicc=Trq=q+7RRhjQSu--
