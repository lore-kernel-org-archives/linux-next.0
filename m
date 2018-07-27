From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the kspp tree
Date: Fri, 27 Jul 2018 19:06:47 +1000
Message-ID: <20180727190647.3525f5f7@canb.auug.org.au>
References: <20180727190207.7ce1c9b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/wdFTLvqeutYeitww.T9kxwp"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180727190207.7ce1c9b0@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@google.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Popov <alex.popov@linux.com>
List-Id: linux-next.vger.kernel.org

--Sig_/wdFTLvqeutYeitww.T9kxwp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 27 Jul 2018 19:02:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the kspp tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> cc1: error: plugin stackleak_plugin should be specified before -fplugin-a=
rg-stackleak_plugin-disable in the command line
>=20
> Maybe caused by commit
>=20
>   a8b9eaddb9c0 ("gcc-plugins: Add STACKLEAK plugin for tracking the kerne=
l stack")
>=20
> I have used the kspp tree from next-20180726 for today.

Well, that obviously didn't work since the tree hasn't changed for a
few days.

I can't see what has interacted to make this happen, so I have dropped
the kspp tree for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/wdFTLvqeutYeitww.T9kxwp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlta4KcACgkQAVBC80lX
0Gzr3QgAkqCIZaHJGSaKsPNx8+PQOnrGT1M5B4QL6QPbBWeWMZXbBWV62hXQ4V+l
FiGNTxJa/49dOZaC7uZDusL9Xn67wi8M/v5jGQ9c36p+sJiVn+xk2XyY6kIHpWwy
AgBE20pn6ByBnkqTiQMtfpPVvRs+Thdr5Kx/lgOYFJ+feOq/SuRjlR2/oZLEd5jy
eRhLaVkYPXz9ptir/4i4hj+/kCJ62mHHQfUPe9I+AZaSZ5qRlv8YxHHsNes/uWtI
2xgaom7FuCK4Vfmc2sSLBtZ/3EaaSKlu+L51rrGb6JTTcwX74hyZ3bCvdbr8T/vi
99OSV7Dtlj1TYo0MNLWABoAAQQUqwQ==
=kCEe
-----END PGP SIGNATURE-----

--Sig_/wdFTLvqeutYeitww.T9kxwp--
