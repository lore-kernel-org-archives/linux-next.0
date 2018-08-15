From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 net-next tree
Date: Thu, 16 Aug 2018 09:42:54 +1000
Message-ID: <20180816094254.6e0bd68c@canb.auug.org.au>
References: <20180723151224.69a73892@canb.auug.org.au>
        <20180723062046.GA2577@kroah.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bh9Se7w29RaC.i6IXyvTQXF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180723062046.GA2577@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rajat Jain <rajatja@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/bh9Se7w29RaC.i6IXyvTQXF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 23 Jul 2018 08:20:46 +0200 Greg KH <greg@kroah.com> wrote:
>
> On Mon, Jul 23, 2018 at 03:12:24PM +1000, Stephen Rothwell wrote:
> >=20
> > Today's linux-next merge of the driver-core tree got a conflict in:
> >=20
> >   fs/sysfs/group.c
> >=20
> > between commit:
> >=20
> >   5f81880d5204 ("sysfs, kobject: allow creating kobject belonging to ar=
bitrary users")
> >=20
> > from the net-next tree and commit:
> >=20
> >   c855cf2759d2 ("sysfs: Fix internal_create_group() for named group upd=
ates")
> >=20
> > from the driver-core tree.
> >=20
> > I fixed it up (I think - see below) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
> >=20
> > --=20
> > Cheers,
> > Stephen Rothwell
> >=20
> > diff --cc fs/sysfs/group.c
> > index c7a716c4acc9,38240410f831..000000000000
> > --- a/fs/sysfs/group.c
> > +++ b/fs/sysfs/group.c
> > @@@ -122,15 -118,23 +122,24 @@@ static int internal_create_group(struc
> >   			kobj->name, grp->name ?: "");
> >   		return -EINVAL;
> >   	}
> >  +	kobject_get_ownership(kobj, &uid, &gid);
> >   	if (grp->name) {
> > - 		kn =3D kernfs_create_dir_ns(kobj->sd, grp->name,
> > - 					  S_IRWXU | S_IRUGO | S_IXUGO,
> > - 					  uid, gid, kobj, NULL);
> > - 		if (IS_ERR(kn)) {
> > - 			if (PTR_ERR(kn) =3D=3D -EEXIST)
> > - 				sysfs_warn_dup(kobj->sd, grp->name);
> > - 			return PTR_ERR(kn);
> > + 		if (update) {
> > + 			kn =3D kernfs_find_and_get(kobj->sd, grp->name);
> > + 			if (!kn) {
> > + 				pr_warn("Can't update unknown attr grp name: %s/%s\n",
> > + 					kobj->name, grp->name);
> > + 				return -EINVAL;
> > + 			}
> > + 		} else {
> >  -			kn =3D kernfs_create_dir(kobj->sd, grp->name,
> >  -					       S_IRWXU | S_IRUGO | S_IXUGO,
> >  -					       kobj);
> > ++			kn =3D kernfs_create_dir_ns(kobj->sd, grp->name,
> > ++						  S_IRWXU | S_IRUGO | S_IXUGO,
> > ++						  uid, gid, kobj, NULL);
> > + 			if (IS_ERR(kn)) {
> > + 				if (PTR_ERR(kn) =3D=3D -EEXIST)
> > + 					sysfs_warn_dup(kobj->sd, grp->name);
> > + 				return PTR_ERR(kn);
> > + 			}
> >   		}
> >   	} else
> >   		kn =3D kobj->sd; =20
>=20
>=20
> I think this is correct.  Rajat, can you verify it please?

This is now a conflict between Linus' tree and the driver-core tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/bh9Se7w29RaC.i6IXyvTQXF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlt0un4ACgkQAVBC80lX
0GyHMgf/a2VZOQWc1+FZ6tJHxodPJcLTFq3WaG66u4m+NUQScbi70y6AcxiGfFs2
2PWaVGWrnAbkNv8eX/ZVygPJG7OwKKj6aZuf9EkM7poW1Kod3PHt+ouju2CbSUbA
bjvQu0+J7nSppnOF/qcp48Ywnhywy6/Y0IFss9PuOdP2l+TfE28+FzYaputLY9UL
0IPREiCY7dUrL5tfWpCI40M0n51oTM0/6JmWWSo4uEOFoBJZLV1hEzV29DpQPi+0
IMPBehBI3CLwWYyQ90b/7KLFA3e7Z0nxusmVne+tIm009VwtK1btBPRpjhjO5evY
yL/jFPoDFQnxP3DhDRSATeyK8muRKg==
=sRWr
-----END PGP SIGNATURE-----

--Sig_/bh9Se7w29RaC.i6IXyvTQXF--
