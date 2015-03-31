From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH v2] dma: vdma: Fix compilation warnings
Date: Tue, 31 Mar 2015 10:27:59 +0530
Message-ID: <20150331045759.GP7192@intel.com>
References: <32a1f768-901f-4728-b11e-6d5dc9a622ab@BN1BFFO11FD025.protection.gbl>
 <20150330171846.GG7192@intel.com>
 <20150331073543.0d885c65@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:33391 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750962AbbCaFCT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 31 Mar 2015 01:02:19 -0400
Content-Disposition: inline
In-Reply-To: <20150331073543.0d885c65@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kedareswara rao Appana <appana.durga.rao@xilinx.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, anirudh@xilinx.com, Kedareswara rao Appana <appanad@xilinx.com>


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2015 at 07:35:43AM +1100, Stephen Rothwell wrote:
Hi Stephen,
>
> On Mon, 30 Mar 2015 22:48:46 +0530 Vinod Koul <vinod.koul@intel.com> wrot=
e:
> >
> > On Mon, Mar 30, 2015 at 06:48:29PM +0530, Kedareswara rao Appana wrote:
> > > This patch fixes the following compilation warnings.
> > > In file included from drivers/dma/xilinx/xilinx_vdma.c:26:0:
> > > include/linux/dmapool.h:18:4: warning: 'struct device' declared insid=
e parameter list
> > >     size_t size, size_t align, size_t allocation);
> > >     ^
> > > include/linux/dmapool.h:18:4: warning: its scope is only this definit=
ion or declaration, which is probably not what you want
> > > include/linux/dmapool.h:31:7: warning: 'struct device' declared insid=
e parameter list
> > >        size_t size, size_t align, size_t allocation);
> > >        ^
> > > drivers/dma/xilinx/xilinx_vdma.c: In function 'xilinx_vdma_alloc_chan=
_resources':
> > > drivers/dma/xilinx/xilinx_vdma.c:501:20: warning: passing argument 2 =
of 'dma_pool_create' from incompatible pointer type
> > >   chan->desc_pool =3D dma_pool_create("xilinx_vdma_desc_pool",
> > >                     ^
> > > In file included from drivers/dma/xilinx/xilinx_vdma.c:26:0:
> > > include/linux/dmapool.h:17:18: note: expected 'struct device *' but a=
rgument is of type 'struct device *'
> > >  struct dma_pool *dma_pool_create(const char *name, struct device *de=
v, .
> > >=20
> > Well this does fix this error but this can also be fixed by rearranging=
 the
> > driver header files order.  Since I am not inclined to update a patch f=
or
> > dmapool.h I would go for rearranging drivers header
> >=20
> > --><8---------------><8--------------
> >=20
> > diff --git a/drivers/dma/xilinx/xilinx_vdma.c
> > b/drivers/dma/xilinx/xilinx_vdma.c
> > index d8434d465885..356ca4bc0ea5 100644
> > --- a/drivers/dma/xilinx/xilinx_vdma.c
> > +++ b/drivers/dma/xilinx/xilinx_vdma.c
> > @@ -23,12 +23,12 @@
> >   */
> >=20
> >  #include <linux/bitops.h>
> > -#include <linux/dmapool.h>
> >  #include <linux/dma/xilinx_dma.h>
> >  #include <linux/init.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> > +#include <linux/dmapool.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_dma.h>
> >  #include <linux/of_platform.h>
> >=20
> > Any objections?
>=20
> Yes.  The error is in dmapool.h so it should be fixed once and for
> all.  The supplied patch is very unintrusive and means that the problem
> won't reappear when someone does some rearrangement of includes in the
> future.  The file in question really has no particular maintainer.
> Even after your suggested patch, dmapool.h still depend on an implicit
> include of device.h.
I agree with your points, but isnt the order of headers also a thumb rule.
Typicaly a driver file will include core includes followed by subsystem
specfic includes.

Should a header have no dependency for its include ? I do come across
multiple examples of this in kernel

Yes fixing it in dmapool is also correct, so should we move to having
headers agnostic to the order of inclusion eventually ?

Thanks
--=20
~Vinod

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJVGilXAAoJEHwUBw8lI4NHb6QP/3VEn0AorkmHnBOVooQrSGkN
WjnuM4WFwHrHKSO4yYTmMpNPOSB4QoQlBLH+s8zXsEwk5sEW+/KQxpvDj6Yqv361
mhYUDPu1GzURSb/j7G1U3jMWEWWetXAZI2a6TCvMDaIUacCsmAu/7/Z5Zh9XYtMK
jxyPQk8pSevUNXeTHHUwzgueCnMdG4jQjgyv70mceQqq3fckb1udnBvpxqIauhAj
qMmuvOySYqarwVUOub2HGs53zyIgC6icfy55AW7LzMnWPCiC6u/LU/p3E7Li0yAy
HjJEm7Sx/TvD6QM+HaYTbiCJz/H3gitSYB6c9Z5z9tGwADWdXFcFOJBw5GZ0u5Wm
2pgml+wQ9x4NEIWQzQeCF754KzZudpyrSNMhzQIdQwq6GYMb7fdmNHB6mREzurZX
6zVfJpHESD5gVGR6ZSIBCJFtiSiiiozA00nQKvxW7CkRnL3tf+lI5gFQkr+eUj2S
bW0m2oYcbcenhYgH/AxfnSwaTfQzFJt/vBrB5uGHVFNByZRgA+z+391qIEmXpXht
zktIuIRDN+SS/SnnRKSWPaa2jlQkVwceTz/1507W/99BCYwmey5/vo1j9wGPbokr
2kI9XzCuT3f48IBln9+KmZDSMxgLVN74Pixbbf80nKK/4EaDFwaipEcPt+3nuxCu
Imho0OgZSk7cBFSq4Wbt
=+kTb
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
