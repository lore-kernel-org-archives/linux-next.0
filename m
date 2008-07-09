From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  net/wireless tree build failure
Date: Wed, 9 Jul 2008 21:26:41 +1000
Message-ID: <20080709212641.7e7c81b3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__9_Jul_2008_21_26_41_+1000_.0.bMHAxfbtpzjy4"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51314 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753660AbYGIL05 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Jul 2008 07:26:57 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Michael Buesch <mb@bu3sch.de>, "John W. Linville" <linville@tuxdriver.com>

--Signature=_Wed__9_Jul_2008_21_26_41_+1000_.0.bMHAxfbtpzjy4
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave, John,

Today's linux-next build (sparc allmodconfig) failed like this:

In file included from drivers/net/wireless/b43/b43.h:8,
                 from drivers/net/wireless/b43/phy.c:33:
include/linux/ssb/ssb.h: In function `ssb_dma_mapping_error':
include/linux/ssb/ssb.h:431: error: implicit declaration of function `dma_m=
apping_error'
include/linux/ssb/ssb.h: At top level:
include/linux/ssb/ssb.h:439: warning: "enum dma_data_direction" declared in=
side parameter list
include/linux/ssb/ssb.h:439: warning: its scope is only this definition or =
declaration, which is probably not what you want
include/linux/ssb/ssb.h:440: error: parameter `dir' has incomplete type
include/linux/ssb/ssb.h: In function `ssb_dma_map_single':
include/linux/ssb/ssb.h:445: error: implicit declaration of function `dma_m=
ap_single'
include/linux/ssb/ssb.h: At top level:
include/linux/ssb/ssb.h:453: warning: "enum dma_data_direction" declared in=
side parameter list
include/linux/ssb/ssb.h:454: error: parameter `dir' has incomplete type
include/linux/ssb/ssb.h: In function `ssb_dma_unmap_single':
include/linux/ssb/ssb.h:460: error: implicit declaration of function `dma_u=
nmap_single'
include/linux/ssb/ssb.h: At top level:
include/linux/ssb/ssb.h:470: warning: "enum dma_data_direction" declared in=
side parameter list
include/linux/ssb/ssb.h:471: error: parameter `dir' has incomplete type
include/linux/ssb/ssb.h: In function `ssb_dma_sync_single_for_cpu':
include/linux/ssb/ssb.h:478: error: implicit declaration of function `dma_s=
ync_single_for_cpu'
include/linux/ssb/ssb.h: At top level:
include/linux/ssb/ssb.h:488: warning: "enum dma_data_direction" declared in=
side parameter list
include/linux/ssb/ssb.h:489: error: parameter `dir' has incomplete type
include/linux/ssb/ssb.h: In function `ssb_dma_sync_single_for_device':
include/linux/ssb/ssb.h:496: error: implicit declaration of function `dma_s=
ync_single_for_device'
include/linux/ssb/ssb.h: At top level:
include/linux/ssb/ssb.h:507: warning: "enum dma_data_direction" declared in=
side parameter list
include/linux/ssb/ssb.h:508: error: parameter `dir' has incomplete type
include/linux/ssb/ssb.h: In function `ssb_dma_sync_single_range_for_cpu':
include/linux/ssb/ssb.h:516: error: implicit declaration of function `dma_s=
ync_single_range_for_cpu'
include/linux/ssb/ssb.h: At top level:
include/linux/ssb/ssb.h:528: warning: "enum dma_data_direction" declared in=
side parameter list
include/linux/ssb/ssb.h:529: error: parameter `dir' has incomplete type
include/linux/ssb/ssb.h: In function `ssb_dma_sync_single_range_for_device':
include/linux/ssb/ssb.h:537: error: implicit declaration of function `dma_s=
ync_single_range_for_device'

Probably caused by commit f225763a7d6c92c4932dbd528437997078496fcc
("ssb, b43, b43legacy, b44: Rewrite SSB DMA API"). ssb/ssb.h should
include linux/dma-mapping.h.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__9_Jul_2008_21_26_41_+1000_.0.bMHAxfbtpzjy4
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkh0oHEACgkQjjKRsyhoI8z9fgCff5POJefwwaaKsCZnebx/B3/I
4zAAoI9vkKqxeLfRPZF3LpHidxwZgRs3
=939C
-----END PGP SIGNATURE-----

--Signature=_Wed__9_Jul_2008_21_26_41_+1000_.0.bMHAxfbtpzjy4--
