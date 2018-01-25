From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Thu, 25 Jan 2018 11:08:05 -0500
Message-ID: <1516896485.27592.127.camel@redhat.com>
References: <20180125182259.047e0c52@canb.auug.org.au>
         <20180125085015.GN1393@mtr-leonro.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-aGnVo3ojLmAq+w+W9k1r"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180125085015.GN1393@mtr-leonro.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Leon Romanovsky <leon@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jason Gunthorpe <jgg@mellanox.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>
List-Id: linux-next.vger.kernel.org


--=-aGnVo3ojLmAq+w+W9k1r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-01-25 at 10:50 +0200, Leon Romanovsky wrote:
> On Thu, Jan 25, 2018 at 06:22:59PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the rdma tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > ERROR: "init_rcu_head" [drivers/infiniband/ulp/srpt/ib_srpt.ko] undefin=
ed!
> >=20
> > Caused by commit
> >=20
> >   a11253142e6d ("IB/srpt: Rework multi-channel support")
> >=20
> > I have used the rdma tree from next-20180119 for today.
>=20
> Hi Stephen,
>=20
> Please see this patch: https://patchwork.kernel.org/patch/10181845/

This has been pulled into the rdma-next area, you shouldn't have a
problem with this after today.

--=20
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD
--=-aGnVo3ojLmAq+w+W9k1r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAlpqAOUACgkQuCajMw5X
L93joQ/+Nkqa3yQl2Z6xpvFzVEVpc+Jk+9j5olpFY+I9S+Wdx+COT86NZm/t/5IC
H+1LP2PZ2RrkexeSX2OYDTwJqwor/EBJrCPJ+SMZD4dL6dx7Mrk86159fZTqjFbq
PLEM4i1HZrMJ/KiwPi/5r0sxuQEmpus/pKHOas7EeQgLuZs3j0T0qtziaJ1XiinP
y3LW7F3tD5IKq5HCw+bVod+tQQ3t+cbL5RHCVQjx9Pp6I5/YEN/F2w2/OXIrXHNJ
B1EJcrJyPPTLLFw5JUwuAKB43zB3dueE+/v86vVJpw81FzBm1sXM4cVnjUbQpk4Y
COvwt4fZGOZ0QsL/ZMLRlYbvk1Epu2U4fnX33f1yNv9qdNGwstF8wMLHG+Blusrh
J8G/aH8z12dBGKS/xfFwgkVOTRFuoRPZOfdjTD8bigcBWFCc9YhL4+sfGCAlG/Jx
FM51PlZz9mOSoUS6GJpZDZhLWKCly1Gbo4K/Sd5pJmN68gIfR1GFXaWL4/deY0xe
yUJIjP2K2KNzMvnra/PCPcIK4zk1ROc9IPiCM9pjdAs9jkPB+Yg5s2Vycokm8QZx
rXT87tGk8wN3boO2uQOXD+HnU0dijJFyr0h5weGpRMdNiEifLH7SvA07S+S5T5eC
3MV+AmpdOC0+B5CBQHj3Cx3ZOUTCe7P7ARhwe9wQHhOnHePzMOQ=
=1GD7
-----END PGP SIGNATURE-----

--=-aGnVo3ojLmAq+w+W9k1r--
