From: Doug Ledford <dledford@redhat.com>
Subject: Re: linux-next: build warning after merge of the rdma tree
Date: Wed, 13 Feb 2019 19:21:02 -0500
Message-ID: <86f77ecfe862e224149ada80dd5b5650280c74ec.camel@redhat.com>
References: <20190214111839.6300f9b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-91qp7NQurQMwZNMgw2nV"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214111839.6300f9b7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kaike Wan <kaike.wan@intel.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kees Cook <keescook@chromium.org>
List-Id: linux-next.vger.kernel.org


--=-91qp7NQurQMwZNMgw2nV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-02-14 at 11:18 +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the rdma tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> drivers/infiniband/hw/hfi1/qp.c: In function 'hfi1_setup_wqe':
> drivers/infiniband/hw/hfi1/qp.c:328:3: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
>    hfi1_setup_tid_rdma_wqe(qp, wqe);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/infiniband/hw/hfi1/qp.c:329:2: note: here
>   case IB_QPT_UC:
>   ^~~~
>=20
> Introduced by commit
>=20
>   f1ab4efa6d32 ("IB/hfi1: Enable TID RDMA READ protocol")
>=20
> I get this warning because I am building with -Wimplicit-fallthrough
> in attempt to catch new additions early.  The gcc warning can be turned
> off by adding a /* fall through */ comment at the point the fall through
> happens (assuming that the fall through is intentional).
>=20

Thanks Stephen, we'll sort it and make an appropriate fixup patch.

Kaike?

--=20
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD

--=-91qp7NQurQMwZNMgw2nV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEErmsb2hIrI7QmWxJ0uCajMw5XL90FAlxktG4ACgkQuCajMw5X
L92ifxAAm+TkvZLilzayUpkEsTwmeMFbyqDhQlHEvOddnN6TGQFwdSLVMxnPqw98
WPGcqjB4SUPUGgrhgoHiU2pZtlmLPPYfr58elLjWLdXU14MbPOEBUuOeINwQBrBb
FdVI1hmJ1VjIDohhRaQDyxriR4IbsooiJaOv1MINmXjQT+l+YJzhNYffAqqQrESP
nnuObO9geNXMiBPnVVsX8kOXZTlW65xQL7lSk1kZjwGOLlJzTjG/LiS9UwPTR9Px
a76psalnUJWvXwtlFrG4RfV1gSTNoqwj143R/+alo4QZX0cuiG6GWIgkH/HCnunO
JU6nLAuO3jwXkxtwjEy4P+nEKpWtjP7bMsSO6hnI0k2pW+/IOc6c80uYC3nivbHK
fZ/MhIPtVyzC9RmpJFcHlAZkgvE5ObpP5+UuWl/ccfTMfcWRF7e4XJejuqab2Pco
K1lHc6GU+lI5zdOjxpIBp6JGF5ne0C47R8IJOfgQBbkSyaPuCoKcp4MYcWLsPjm0
9bxD9ARxWUjBTs/wb0rEXjT3i0ST6ts9glnO75CPy+1EGaIgGzLx7cPqqSRQQTzc
gbPenuYTt1kCedMwPXs/8x5Alv1pyqO924mjR6eP1UZWIMCJVLde1WTMVcNgTjRS
HBDHoJvC22PmzhbYYrPrjK9k17yoiBjEQwbHxJH5IXau23faajQ=
=4IuW
-----END PGP SIGNATURE-----

--=-91qp7NQurQMwZNMgw2nV--
