From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the usb-gadget tree
Date: Thu, 10 Oct 2013 22:20:30 +0100
Message-ID: <20131010212030.GV21581@sirena.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n6e+1ms4ENB7zzLn"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:35116 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751919Ab3JJVVA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Oct 2013 17:21:00 -0400
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk+kernel@arm.linux.org.uk>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Felipe Balbi <balbi@ti.com>
Cc: linux-usb@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>


--n6e+1ms4ENB7zzLn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Today's linux-next merge of the usb-gadget tree got conflicts in
drivers/usb/musb/davinci.c caused by an add in ea78201e2 (usb: musb:
davinci: fix resources passed to MUSB driver for DM6467) adjacent to
the modification of the device registration in 4c9ad1059 (DMA-API: usb:
musb: use platform_device_register_full() to avoid directly messing with
dma masks) from the ARM tree.

I've fixed trivially and can carry as required.

--n6e+1ms4ENB7zzLn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSVxobAAoJELSic+t+oim9/qgP/RNbnGpcK/IYci+ayu7askU1
cj+2+zBxmAC8Ygi0goYvk5IqBrMiLo5LzCV3MjEj47M1fDxQOnlOL/wuWnZipTxE
SLStZfyw102uipvkaq7Howf02e/gUQ9mbJNqfFsdKf0ABQJDMhghrm06lQhpCN7C
IWLtOC5g0IANijm1pFYIT9WOs4ss40FHEmWA3FpisrUiinN4SHVvnH33A9LU+6rK
6pRMUN6ciia1TPbkFWDSBeGrgbXtjVyBEnbF0ROeCjtAQ+GbZpHfu8eGZdvl444R
QAblRvHn0JfKaEfM8leyOXXVfpAObsUmGPDGgFVozbTBrOFAIF3VSbvLKXgeys8c
/4cWDr2lQfYv77J/aVSTF0mxSe5Kk1u7+GLcdewYrmrljwCzB+SK+KeejWkcCr5C
JFzT3QL3P3QPsrCP2NWJp+FQW9zZt6gvBFRLR2tNs8sI1ooJceNxMW47RM+y0IdQ
r3kQzuY+nL4HlUuI9AIJD4GOY6vwANLJ4OGDf+qR40cqVpiviDnmDZ1jhdA59+tA
ZVTht4T8CWcfoEpuhTUbSz0iIroTU3D02tPExQojjUYHUvRyM2h+ovQmIbrwAE0U
MYfsu6GUsuwhfrTZiAjWpGeBbLAjCmjtqWlisVzqzefQn4UfrylVcsG9vxVb8AUj
4QdJHp3pqtsKY5g89vAL
=ckCF
-----END PGP SIGNATURE-----

--n6e+1ms4ENB7zzLn--
