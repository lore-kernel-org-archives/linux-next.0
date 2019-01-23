From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: linux-next: Fixes tags need some work in the dma-mapping-fixes
 tree
Date: Wed, 23 Jan 2019 11:50:47 +0100
Message-ID: <20190123105047.GA18410@ulmo>
References: <20190123074747.7cd44f12@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190123074747.7cd44f12@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>
List-Id: linux-next.vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 23, 2019 at 07:47:47AM +1100, Stephen Rothwell wrote:
> Hi Christoph,
>=20
> In commit
>=20
>   702e8ed37bed ("arm64/xen: fix xen-swiotlb cache flushing")

Hi Christoph,

I'm not subscribed to any of the mailing list that the above patch was
reviewed on, so I'm replying here because it is the only reference that
I have.

The above commit breaks the build on 64-bit ARM, like so:

	  CC      drivers/xen/swiotlb-xen.o
	In file included from drivers/xen/swiotlb-xen.c:47:
	arch/arm64/include/asm/xen/page-coherent.h: In function 'xen_dma_map_page':
	arch/arm64/include/asm/xen/page-coherent.h:53:16: error: 'pfn' undeclared =
(first use in this function)
	  if (pfn_valid(pfn))
			^~~
	arch/arm64/include/asm/xen/page-coherent.h:53:16: note: each undeclared id=
entifier is reported only once for each function it appears in
	arch/arm64/include/asm/xen/page-coherent.h:50:7: warning: unused variable =
'local' [-Wunused-variable]
	  bool local =3D (page_pfn <=3D dev_pfn) &&
	       ^~~~~

Given that the "local" variable is unused, it seems like maybe a chunk
is missing from the commit and it may have been meant to look like this:

diff --git a/arch/arm64/include/asm/xen/page-coherent.h b/arch/arm64/includ=
e/asm/xen/page-coherent.h
index 77e36decc50c..d88e56b90b93 100644
--- a/arch/arm64/include/asm/xen/page-coherent.h
+++ b/arch/arm64/include/asm/xen/page-coherent.h
@@ -50,7 +50,7 @@ static inline void xen_dma_map_page(struct device *hwdev,=
 struct page *page,
  bool local =3D (page_pfn <=3D dev_pfn) &&
   (dev_pfn - page_pfn < compound_pages);

- if (pfn_valid(pfn))
+ if (local)
   dma_direct_map_page(hwdev, page, offset, size, dir, attrs);
  else
   __xen_dma_map_page(hwdev, page, dev_addr, offset, size, dir, attrs);

Thierry

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxIRwQACgkQ3SOs138+
s6GhZhAAuRKSdCg40WcUgwLZBlCRKVwAoaRgNYvZpKjWX0ucxuN1SNCf684+qE4w
HwUldlcbLD6CTXIR9tX4jC/j1WWsM5N5OcsXTj/eo//njO5SZC0C8yuneuljeuPb
avwcnPSSYOC76LvTnXZxaiAMF3T7yT4RznJkee7g+cJZiAG3s+ww2wS3V+pEZzeh
DVJelRFdVSJNhPrI1pyp4Flfho2qu89o3fIp5fBOn3MBKwHe2hpYQs7lbC9fMFM0
Hj/TTY70YLIAzLf7+PatOh+pXZpBIfvySn1SxJg2WsTz/OOgEMvaHq0eCG5e5f3I
q0HlC6s5YKb68t6HZf8B5lhWB3PnHoOlW/1sxIVSMLrUEidNmV5QztbygX9sBuvI
0d6TKxtQ+C3NclrFho3Gux3QZ+cqcykDI+XDxyhBrrphB0pc+LF2SEQhoW/83ook
x2+wyRAZfWzKEC2VH/LGEA1jDQI6HoDzCDtQUb1RsQjVLu9/uKVoE2Rfd2ROsZDi
JzwrC619LDLdbHNCJD8VEnlp4gd6735sbttbD1yAM+dj4FBt5vzFTPseXaPnXqQ2
wibVUij6nC0fIFTENyeEQW49yEBb4gACR1BGWfyLkzMRl2ZqXJ6IQSt1HyOyiu+U
4lhzrUPLWiyVksW6VCYxq2OQRQQUvtaYRlsbY9Cyc1asZiBn/sc=
=gH1L
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
