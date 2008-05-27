From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb/sparc build failure
Date: Tue, 27 May 2008 20:26:30 +1000
Message-ID: <20080527202630.6352736d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__27_May_2008_20_26_30_+1000_ENgYTQzHdiNWQEl9"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57956 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756095AbYE0K0z (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 May 2008 06:26:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, David Vrabel <david.vrabel@csr.com>, "David S. Miller" <davem@davemloft.net>

--Signature=_Tue__27_May_2008_20_26_30_+1000_ENgYTQzHdiNWQEl9
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's (though it is not new) linux-next build (spac allmodconfig) fails
like this:

drivers/uwb/whci.c:166: error: `DMA_64BIT_MASK' undeclared (first use in th=
is function)
drivers/uwb/whci.c:166: error: (Each undeclared identifier is reported only=
 once
drivers/uwb/whci.c:166: error: for each function it appears in.)
drivers/uwb/whci.c:168: error: `DMA_32BIT_MASK' undeclared (first use in th=
is function)
drivers/uwb/whc-rc.c:268: error: implicit declaration of function `dma_allo=
c_coherent'
drivers/uwb/whc-rc.c:286: error: implicit declaration of function `dma_free=
_coherent'
drivers/usb/host/whci/pzl.c:372: error: implicit declaration of function `d=
ma_alloc_coherent'
drivers/usb/host/whci/pzl.c:395: error: implicit declaration of function `d=
ma_free_coherent'
drivers/usb/host/whci/init.c:132: error: implicit declaration of function `=
dma_alloc_coherent'
drivers/usb/host/whci/init.c:162: error: implicit declaration of function `=
dma_free_coherent'
drivers/usb/host/whci/hw.c:48: error: implicit declaration of function `dma=
_map_single'
drivers/usb/host/whci/hw.c:48: error: `DMA_TO_DEVICE' undeclared (first use=
 in this function)
drivers/usb/host/whci/hw.c:48: error: (Each undeclared identifier is report=
ed only once
drivers/usb/host/whci/hw.c:48: error: for each function it appears in.)
drivers/usb/host/whci/hw.c:78: error: implicit declaration of function `dma=
_unmap_single'
drivers/usb/host/whci/qset.c:274: error: implicit declaration of function `=
dma_unmap_single'
drivers/usb/host/whci/qset.c:276: error: `DMA_TO_DEVICE' undeclared (first =
use in this function)
drivers/usb/host/whci/qset.c:276: error: (Each undeclared identifier is rep=
orted only once
drivers/usb/host/whci/qset.c:276: error: for each function it appears in.)
drivers/usb/host/whci/qset.c:326: error: implicit declaration of function `=
dma_map_single'
drivers/usb/host/whci/qset.c:326: error: `DMA_TO_DEVICE' undeclared (first =
use in this function)

I suspect that these files should include linux/dma-mapping.h directly
since it uses things from there.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__27_May_2008_20_26_30_+1000_ENgYTQzHdiNWQEl9
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIO+HbTgG2atn1QN8RAoheAJ9vcm5oR1SxTi9MQlw99b3NMBO5uQCdG7MD
UKPfxVazjAgP0KZmHgpnarE=
=JGlU
-----END PGP SIGNATURE-----

--Signature=_Tue__27_May_2008_20_26_30_+1000_ENgYTQzHdiNWQEl9--
