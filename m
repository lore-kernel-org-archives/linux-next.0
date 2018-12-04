From: Leon Romanovsky <leonro@mellanox.com>
Subject: Re: linux-next: build failure after merge of the rdma tree
Date: Tue, 4 Dec 2018 09:42:59 +0000
Message-ID: <20181204094256.GX6462@mtr-leonro.mtl.com>
References: <20181204114731.48b18bfc@canb.auug.org.au>
 <20181204015247.GR12288@mellanox.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sBcizk6cgRZY6rnJ"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181204015247.GR12288@mellanox.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@mellanox.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Doug Ledford <dledford@redhat.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Guy Levi(SW)" <guyle@mellanox.com>, Majd Dibbiny <majd@mellanox.com>
List-Id: linux-next.vger.kernel.org

--sBcizk6cgRZY6rnJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 04, 2018 at 01:52:54AM +0000, Jason Gunthorpe wrote:
> On Tue, Dec 04, 2018 at 11:47:31AM +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the rdma tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > ERROR: "mlx5_get_send_wqe" [drivers/infiniband/hw/mlx5/mlx5_ib.ko] undefined!
> >
> > Caused by commit
> >
> >   34f4c9554d8b ("IB/mlx5: Use fragmented QP's buffer for in-kernel users")
> >
> > mlx5_get_send_wqe() is still used in drivers/infiniband/hw/mlx5/cq.c
> > and declared in drivers/infiniband/hw/mlx5/mlx5_ib.h ...
> >
> > I have used the version of the rdma tree from next-20181203 for today.
>
> Huh. So apparently every compiler that tested this patch (0-day, mine,
> the submitters) optimized this call away because is_atomic_response()
> always returns 0: meaning mlx5_get_atomic_laddr is never callable and
> can be deleted entirely, including the call to mlx5_get_send_wqe.
>
> Not sure what compiler setup will hit this, but it is clearly wrong
> code..
>
> Guy/Leon, please send a fixup.. Maybe just delete all this
> handle_atomics stuff?

I deleted it and will wait for the results of regression prior to send the patch.

Thanks

>
> Thanks,
> Jason

--sBcizk6cgRZY6rnJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJcBkwgAAoJEORje4g2clinI8MP/1z+R6a1gfOMZEFjZHPp+P04
nM2hz+nbi4aZTdwaOayd7pjoRD+NeKC9zEy7dYG93EuUZmi7JShCr5xpl5iDcIgk
g+yiRjL8RvzXmc1qRhwi4Bs+hezoQOZJhrBVRYwiSBpE2RzawrbpRABSDOgMagzS
RZk2osl2t+duBXjN7ESxm1sRwpymPh174btocId5yIk7zJH5lFlxCy7jnQYLJwfE
Rgzu7Sb97PXOtrSGQHOmtnw9TSA3GsFveluHD5qPg/atbnUzR7in7q4/WMDK0ycS
u3qCSstWLRylBeL4rdaUo8Zn0Wm24PV3zZX8NqyP9GBPa+6LJq5Q+bLVIWkM/1J5
L/k1pgMLoRlvplw5/GHopE2Q3tg/CaWuVRgs4US1IslKu4lZTgtqzGt33xVsolmW
xCAaYEhV29Ck/45Fa/TAepIZnUsq+lQ/k14cUXneabuT+zytG1gEoHOxgkqHMj2D
q6fDGMys0o9MH0tGgwVLwQD4U7It8HVRAb1KllqRMb3ivNvJ7AVB5dcQlabdEoJc
O1rxwxo4VfEgpjZ77yf4WMiLNA53qKfUF7UI/0q64iOTwgzSjCalKThJwKqzQzgi
Scx/TfbjzVPsOStApQAZ6dXEpAF3W9psuNwFcBs0YVOB0X9zNCd2HhuoSYDnjIZX
RyfjrhBR5x9r/kboebJ4
=14GD
-----END PGP SIGNATURE-----

--sBcizk6cgRZY6rnJ--
