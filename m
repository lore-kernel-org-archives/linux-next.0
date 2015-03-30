From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2] dma: vdma: Fix compilation warnings
Date: Tue, 31 Mar 2015 07:35:43 +1100
Message-ID: <20150331073543.0d885c65@canb.auug.org.au>
References: <32a1f768-901f-4728-b11e-6d5dc9a622ab@BN1BFFO11FD025.protection.gbl>
	<20150330171846.GG7192@intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/V1oKTriiS2swaJUHUfh+NMY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150330171846.GG7192@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Kedareswara rao Appana <appana.durga.rao@xilinx.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, anirudh@xilinx.com, Kedareswara rao Appana <appanad@xilinx.com>
List-Id: linux-next.vger.kernel.org

--Sig_/V1oKTriiS2swaJUHUfh+NMY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

On Mon, 30 Mar 2015 22:48:46 +0530 Vinod Koul <vinod.koul@intel.com> wrote:
>
> On Mon, Mar 30, 2015 at 06:48:29PM +0530, Kedareswara rao Appana wrote:
> > This patch fixes the following compilation warnings.
> > In file included from drivers/dma/xilinx/xilinx_vdma.c:26:0:
> > include/linux/dmapool.h:18:4: warning: 'struct device' declared inside =
parameter list
> >     size_t size, size_t align, size_t allocation);
> >     ^
> > include/linux/dmapool.h:18:4: warning: its scope is only this definitio=
n or declaration, which is probably not what you want
> > include/linux/dmapool.h:31:7: warning: 'struct device' declared inside =
parameter list
> >        size_t size, size_t align, size_t allocation);
> >        ^
> > drivers/dma/xilinx/xilinx_vdma.c: In function 'xilinx_vdma_alloc_chan_r=
esources':
> > drivers/dma/xilinx/xilinx_vdma.c:501:20: warning: passing argument 2 of=
 'dma_pool_create' from incompatible pointer type
> >   chan->desc_pool =3D dma_pool_create("xilinx_vdma_desc_pool",
> >                     ^
> > In file included from drivers/dma/xilinx/xilinx_vdma.c:26:0:
> > include/linux/dmapool.h:17:18: note: expected 'struct device *' but arg=
ument is of type 'struct device *'
> >  struct dma_pool *dma_pool_create(const char *name, struct device *dev,=
 .
> >=20
> Well this does fix this error but this can also be fixed by rearranging t=
he
> driver header files order.  Since I am not inclined to update a patch for
> dmapool.h I would go for rearranging drivers header
>=20
> --><8---------------><8--------------
>=20
> diff --git a/drivers/dma/xilinx/xilinx_vdma.c
> b/drivers/dma/xilinx/xilinx_vdma.c
> index d8434d465885..356ca4bc0ea5 100644
> --- a/drivers/dma/xilinx/xilinx_vdma.c
> +++ b/drivers/dma/xilinx/xilinx_vdma.c
> @@ -23,12 +23,12 @@
>   */
>=20
>  #include <linux/bitops.h>
> -#include <linux/dmapool.h>
>  #include <linux/dma/xilinx_dma.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/dmapool.h>
>  #include <linux/of_address.h>
>  #include <linux/of_dma.h>
>  #include <linux/of_platform.h>
>=20
> Any objections?

Yes.  The error is in dmapool.h so it should be fixed once and for
all.  The supplied patch is very unintrusive and means that the problem
won't reappear when someone does some rearrangement of includes in the
future.  The file in question really has no particular maintainer.
Even after your suggested patch, dmapool.h still depend on an implicit
include of device.h.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/V1oKTriiS2swaJUHUfh+NMY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGbOkAAoJEMDTa8Ir7ZwVSqgP/2ntljb2pegWmuduXxjLX348
MuvGz+73yXJipxSJrgzJlCSERKjcs0qS1XT97dqml97hgIC7MsmjA5jiHP0QCnU+
aBnEGn6Ga8TmearHO9i4uW6GCo6fc4/w4YeSLTw1JRzQTHQ3sys50+deo5KAI5bs
NtPhRBklfHgA+WgaMvom2/KuqJ11nB98fy/DtSBvac2lMraSUZ96EGFzAZqUvdHA
vkzVAD+iqAHqCqvJZLa1h/mRdrgGmkVgGt11A/FhN1gB8ahXFnVvkliH189f22E2
kznYzmElMag1tuf1vM5xxaSfXDsOwRXup8Dix51Y/KqDsoN12T/fyId2Mb8HX+my
w3B8uwfyg3ZF4LhnNdpSTvlOElGzp7ABTiail4LOOKBpQm+X6q1Gd4l+g8wxLJ6g
TUsFZVHNwfe3NsM6mtD/YkZ94tKCTq0ai3XG40ySjl4eYtCL3tbygpAsM9oJQngj
EIDIfR1MryRZwLwd8lWK8ojx/h+p70qYEbiCS8nGlW/eyHvssTvro4cobTXk2JUw
s9sgjRtQMtcnLBZCvlpG0LRdA66PfUFkwpq5Vzq7rBrRmV5YgZeimrsT9ryKzPpQ
awt+Y1Bc51kWP4ksayFPodC0eR7H6jLBJBgjjZu8pg5212A7f+kamBBLOzCD/6Tx
zGBjACrJaJ18JED+o2G3
=w9z4
-----END PGP SIGNATURE-----

--Sig_/V1oKTriiS2swaJUHUfh+NMY--
