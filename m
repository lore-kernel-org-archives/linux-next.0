From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the slave-dma tree
Date: Mon, 30 Mar 2015 17:20:53 +1100
Message-ID: <20150330172053.63896266@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZOTTLBmhglF5tx48SasSfvF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kedareswara rao Appana <appana.durga.rao@xilinx.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ZOTTLBmhglF5tx48SasSfvF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Vinod,

After merging the slave-dma tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

In file included from drivers/dma/xilinx/xilinx_vdma.c:26:0:
include/linux/dmapool.h:18:4: warning: 'struct device' declared inside para=
meter list
    size_t size, size_t align, size_t allocation);
    ^
include/linux/dmapool.h:18:4: warning: its scope is only this definition or=
 declaration, which is probably not what you want
include/linux/dmapool.h:31:7: warning: 'struct device' declared inside para=
meter list
       size_t size, size_t align, size_t allocation);
       ^
drivers/dma/xilinx/xilinx_vdma.c: In function 'xilinx_vdma_alloc_chan_resou=
rces':
drivers/dma/xilinx/xilinx_vdma.c:501:20: warning: passing argument 2 of 'dm=
a_pool_create' from incompatible pointer type
  chan->desc_pool =3D dma_pool_create("xilinx_vdma_desc_pool",
                    ^
In file included from drivers/dma/xilinx/xilinx_vdma.c:26:0:
include/linux/dmapool.h:17:18: note: expected 'struct device *' but argumen=
t is of type 'struct device *'
 struct dma_pool *dma_pool_create(const char *name, struct device *dev,=20
                  ^

Presumable caused by the include order change in commit 937abe88aea3
("dmaengine: xilinx-dma: move header file to common location").

I guess that dmapool.h needs a "struct device;" line near the top.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/ZOTTLBmhglF5tx48SasSfvF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGOtLAAoJEMDTa8Ir7ZwVbg8P/03d9ml1f3IA5q469ms2PmqW
vodovexSpGU1jADeNdj5x+ah3ThhsQoLl5c/WLTAfgGgdJD9VeUznJyo0iH+jmm0
/RyeCHli1vRtmUnGP2YF0ibXgT/cUF/Vj8H1Qgb8hgSP93/Zy3oSlAGCtgMipo4h
Ta8Hao3RZ5gIrs+MZ2cbKmmYBYFKYsirwtlL0f0iZDs+fZ8478Rm+n9SCkVN5JZW
fFnJhmpHFzeDz7sX0RbYiVSZhkCCPnkcYtWQONJwGXOfD1HSFc08gBqHx4q3HiNg
GexvKrA1eYz+yFj62SG3olrDET1cF0DAgmEzYTEroYO231VYw4AL11Sjo+iBp+QK
lUG/oOkc+KcZyvGNYKGNuHlbzPFu9HH7ipd9iGdrJ1ubrZVBkd0Z0vLOESGpMpQ2
p9YhmzlHX5MAJI55RJqxf+tlpmg04lb+v3X1y28yiCQmE3YwPom+dE9kMGn8RZ1X
XCFc6qvdVXQzKrx1cEzTOspWyV3ergpo1bZJ9Tp3I04fyNDS2gTePlxJIgnsQJRN
aIZNF8IlblYIZ5f/3mZ7FH4wBZn+wSmR1c7QQyxUv5OC3O5aC5uyi0OeADTc1p4U
kLRZzbPxqkCxOhFhzq+Dl/46GBWzhwxWW/9ex4RiB4npOSFuYzeD0y76vqgIG9bz
hIaVDO4or5zlh6YB7MTu
=Fu9a
-----END PGP SIGNATURE-----

--Sig_/ZOTTLBmhglF5tx48SasSfvF--
