From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the vfs tree
Date: Tue, 26 Mar 2019 10:05:20 +1100
Message-ID: <20190326100520.5306e2b7@canb.auug.org.au>
References: <20190204093334.0ccc42bb@canb.auug.org.au>
        <20190318110050.2bf8d87b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ABI=vFaqmdVjLm/7McWb+Rh"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190318110050.2bf8d87b@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ABI=vFaqmdVjLm/7McWb+Rh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 18 Mar 2019 11:00:50 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 4 Feb 2019 09:33:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the vfs tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> >=20
> > In file included from include/linux/printk.h:7,
> >                  from include/linux/kernel.h:14,
> >                  from include/linux/fs_context.h:15,
> >                  from fs/fs_parser.c:13:
> > fs/fs_parser.c: In function 'fs_validate_description':
> > include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=3D]
> >  #define KERN_SOH "\001"  /* ASCII Start Of Header */
> >                   ^~~~~~
> > include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SO=
H'
> >  #define KERN_ERR KERN_SOH "3" /* error conditions */
> >                   ^~~~~~~~
> > include/linux/printk.h:303:9: note: in expansion of macro 'KERN_ERR'
> >   printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
> >          ^~~~~~~~
> > fs/fs_parser.c:413:6: note: in expansion of macro 'pr_err'
> >       pr_err("VALIDATE %s: e[%lu] enum val for %s\n",
> >       ^~~~~~
> > fs/fs_parser.c:413:31: note: format string is defined here
> >       pr_err("VALIDATE %s: e[%lu] enum val for %s\n",
> >                              ~~^
> >                              %u
> >=20
> > Introduced by commit
> >=20
> >   f512b838c104 ("vfs: Add configuration parser helpers") =20
>=20
> We are now seeing that warning in Linus' tree :-(

I am still getting the above warning ...

--=20
Cheers,
Stephen Rothwell

--Sig_/ABI=vFaqmdVjLm/7McWb+Rh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyZXrAACgkQAVBC80lX
0GwgOQf/S4/jp7NdxfpkLPV9xLUXG7WsDxDYb9d/b54xrB9x8IE6W7OrwjG9i5+Y
1Mh3d+8L4PEzjG74Wy7V/lY2Op62+SSQkDgg3eDZ23aVayLjvRGsqDrgmz9gaETV
fDLy1//nLjmuVt4/x7qcyt7R1sEqmhg/risCakxA1BvngeKy7G3QVMZYYEHC48yH
nHvWwpb16UkLjGTMpb/q4maqb9EtKnhrlNXBTGoeJnBv/oXjTpeQ3XatjW8YIZk9
GAxG+2wkFlCG/LSytufePdxNoBtlX2wBJV/9yGqb/EP/eHWh/1zgzDHmSejwqrEQ
mIQPnlOykR02f7bYF7K/JKd01r+eSw==
=xZ4k
-----END PGP SIGNATURE-----

--Sig_/ABI=vFaqmdVjLm/7McWb+Rh--
