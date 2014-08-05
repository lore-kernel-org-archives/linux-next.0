From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the
 slave-dma tree
Date: Tue, 5 Aug 2014 21:46:41 +0530
Message-ID: <20140805161641.GV8181@intel.com>
References: <20140805162843.054e1383@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h22Fi9ANawrtbNPX"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140805162843.054e1383@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Siva Yerramreddy <yshivakrishna@gmail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: linux-next.vger.kernel.org


--h22Fi9ANawrtbNPX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 05, 2014 at 04:28:43PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Today's linux-next merge of the char-misc tree got a conflict in
> drivers/dma/Makefile between commit b45b262cefd5 ("dmaengine: add a
> driver for AMBA AXI NBPF DMAC IP cores") from the slave-dma tree and
> commit 95b4ecbf759a ("dma: MIC X100 DMA Driver") from the char-misc
> tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
>=20
> --=20
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
>=20
> diff --cc drivers/dma/Makefile
> index f2b831a994cf,bd9e7fa928bd..000000000000
> --- a/drivers/dma/Makefile
> +++ b/drivers/dma/Makefile
> @@@ -47,5 -47,4 +47,6 @@@ obj-$(CONFIG_MOXART_DMA) +=3D moxart-dma.
>   obj-$(CONFIG_FSL_EDMA) +=3D fsl-edma.o
>   obj-$(CONFIG_QCOM_BAM_DMA) +=3D qcom_bam_dma.o
>   obj-y +=3D xilinx/
>  +obj-$(CONFIG_NBPFAXI_DMA) +=3D nbpfaxi.o
>  +obj-$(CONFIG_DMA_SUN6I) +=3D sun6i-dma.o
> + obj-$(CONFIG_INTEL_MIC_X100_DMA) +=3D mic_x100_dma.o

Looks fine here

--=20
~Vinod

--h22Fi9ANawrtbNPX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJT4QNpAAoJEHwUBw8lI4NHNcgP+gPugxaaUU1fKwn9ODojXod2
uoCuN5hA5uZxuggsOKS8XO7BIpkhQkMOxN71pmDpGT/+hr/hWDTV0dQESuk3Xl4P
0xXFnifURSRCdsWr2c5q8PEAyodVsVlGL3jt0iZOGLE5b/z+mSnn+81hmv8DmQcv
druVc36MmdzBuauQq41dc5eggmAfI0vz7QQBsHMD91NBftkv+Pmq52sBAA4FPCKm
KzKprzHqwWdxgPNGlF5Vep61QwvTTsWACFzM2Yi+pt8krCnIAPTdz0q5jSeHgPrz
KnVRUKybG5bWFZOWbim1S943PYFomfbnyVUGI9CilX9gcsS/HZ2OC6hY79ULbl+e
9hzZ22nXhbsmNnipqcPxreIL862tP3FzOt0dwPglraBY74qYA34zrE2a0/IkZl3K
4WmIr4TfN37hCIq9SaDKfH2WpKG2/mNfdbSiFluA9pjmFMSLyx5GEy/5bSSNWQlO
WXQRVryOTSj08RRi7GJWZGaRx+FRrrKyxdbLeBv9a4Q7QcvvlX7/6Nk+mQbpU8OH
JwFJ5GSHT2O6YMSLAfJQoO9A9AuBujbQIgu+99HgonfGJ11Vbz+pygqrll/B/rxK
I+57ReBBp6vZ435SyV38hG7pZ/fWXiMBfOCnfBlBtF52U2z4W/s5B+cIBlkx42WV
pXIwYsLo2iQlXDsFqKP6
=mFgv
-----END PGP SIGNATURE-----

--h22Fi9ANawrtbNPX--
