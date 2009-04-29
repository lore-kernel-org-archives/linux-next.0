From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb tree build warnings
Date: Wed, 29 Apr 2009 16:39:49 +1000
Message-ID: <20090429163949.636a17c5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__29_Apr_2009_16_39_49_+1000_/aUGa=MwAfRiIkBW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51999 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751620AbZD2Gjz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Apr 2009 02:39:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Sarah Sharp <sarah.a.sharp@linux.intel.com>

--Signature=_Wed__29_Apr_2009_16_39_49_+1000_/aUGa=MwAfRiIkBW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) produced these warnings:

In file included from drivers/usb/host/xhci-mem.c:27:
drivers/usb/host/xhci.h: In function 'xhci_writel':
drivers/usb/host/xhci.h:1083: warning: passing argument 1 of 'xhci_to_hcd' =
discards qualifiers from pointer target type
drivers/usb/host/xhci.h:1083: warning: passing argument 1 of 'xhci_to_hcd' =
discards qualifiers from pointer target type
drivers/usb/host/xhci.h:1083: warning: cast from pointer to integer of diff=
erent size
drivers/usb/host/xhci-mem.c: In function 'xhci_segment_alloc':
drivers/usb/host/xhci-mem.c:43: warning: cast from pointer to integer of di=
fferent size
drivers/usb/host/xhci-mem.c:51: warning: cast from pointer to integer of di=
fferent size
drivers/usb/host/xhci-mem.c: In function 'xhci_segment_free':
drivers/usb/host/xhci-mem.c:66: warning: cast from pointer to integer of di=
fferent size
drivers/usb/host/xhci-mem.c:72: warning: cast from pointer to integer of di=
fferent size
drivers/usb/host/xhci-mem.c: In function 'xhci_link_segments':
drivers/usb/host/xhci-mem.c:101: warning: format '%x' expects type 'unsigne=
d int', but argument 4 has type 'dma_addr_t'
drivers/usb/host/xhci-mem.c:101: warning: format '%x' expects type 'unsigne=
d int', but argument 5 has type 'dma_addr_t'
drivers/usb/host/xhci-mem.c: In function 'xhci_ring_free':
drivers/usb/host/xhci-mem.c:115: warning: cast from pointer to integer of d=
ifferent size
drivers/usb/host/xhci-mem.c: In function 'xhci_ring_alloc':
drivers/usb/host/xhci-mem.c:140: warning: cast from pointer to integer of d=
ifferent size
drivers/usb/host/xhci-mem.c:171: warning: cast from pointer to integer of d=
ifferent size
drivers/usb/host/xhci-mem.c: In function 'xhci_alloc_virt_device':
drivers/usb/host/xhci-mem.c:245: warning: format '%x' expects type 'unsigne=
d int', but argument 5 has type 'dma_addr_t'
drivers/usb/host/xhci-mem.c:253: warning: format '%x' expects type 'unsigne=
d int', but argument 5 has type 'dma_addr_t'
drivers/usb/host/xhci-mem.c:269: warning: cast from pointer to integer of d=
ifferent size
drivers/usb/host/xhci-mem.c:269: warning: format '%x' expects type 'unsigne=
d int', but argument 6 has type 'dma_addr_t'
drivers/usb/host/xhci-mem.c: In function 'xhci_setup_addressable_virt_dev':
drivers/usb/host/xhci-mem.c:342: warning: cast from pointer to integer of d=
ifferent size
drivers/usb/host/xhci-mem.c: In function 'xhci_mem_init':
drivers/usb/host/xhci-mem.c:646: warning: cast from pointer to integer of d=
ifferent size
drivers/usb/host/xhci-mem.c:646: warning: format '%x' expects type 'unsigne=
d int', but argument 4 has type 'dma_addr_t'
drivers/usb/host/xhci-mem.c:671: warning: cast from pointer to integer of d=
ifferent size
drivers/usb/host/xhci-mem.c:708: warning: format '%x' expects type 'unsigne=
d int', but argument 4 has type 'dma_addr_t'
drivers/usb/host/xhci-mem.c:713: warning: cast from pointer to integer of d=
ifferent size
drivers/usb/host/xhci-mem.c:713: warning: format '%x' expects type 'unsigne=
d int', but argument 6 has type 'dma_addr_t'
drivers/usb/host/xhci-mem.c:738: warning: format '%x' expects type 'unsigne=
d int', but argument 4 has type 'dma_addr_t'

There were quite a few more in the xhci code as well.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__29_Apr_2009_16_39_49_+1000_/aUGa=MwAfRiIkBW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkn39jUACgkQjjKRsyhoI8xb2QCfT4a3wM6/c49Opd/O3ezbRIic
VaEAni8wU0SAdPA5AMUSKN5Qdw+34Kbt
=0ahm
-----END PGP SIGNATURE-----

--Signature=_Wed__29_Apr_2009_16_39_49_+1000_/aUGa=MwAfRiIkBW--
