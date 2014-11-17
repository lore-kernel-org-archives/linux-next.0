From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the ipmi tree
Date: Mon, 17 Nov 2014 19:20:09 +1100
Message-ID: <20141117192009.735e8b6b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2Z9n+JDLqFo4BaivWt4h042"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35072 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751090AbaKQIUR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Nov 2014 03:20:17 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Corey Minyard <cminyard@mvista.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/2Z9n+JDLqFo4BaivWt4h042
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Corey,

After merging the ipmi tree, today's linux-next build (powerpc
allyesconfig) failed like this:


drivers/char/ipmi/ipmi_ssif.c: In function 'ssif_probe':
drivers/char/ipmi/ipmi_ssif.c:1377:23: error: 'union ipmi_smi_info_union' h=
as no member named 'acpi_info'
   ssif_info->addr_info.acpi_info.acpi_handle =3D acpi_handle;
                       ^

Caused by commit 66a4d9633da8 ("ipmi: Add SMBus interface driver (SSIF)").

I have reverted that commit (and the following 1c99788eebd9 "ipmi:
Handle I2C parms in the SSIF driver") for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/2Z9n+JDLqFo4BaivWt4h042
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUaa+/AAoJEMDTa8Ir7ZwVzksP/3NQjLaQ00MjBhs6CvDhkc3q
vCdsccsXNdscTC7benrj13gK7I6Hm6RGubchysZqIOKmwEO5fgcUQq8+mCWR/9XO
G6GpwtMd1QEcrv5kuAA29TKoLSoU3IlodBA8HP84+n/MaU4sjdw6I3pP20EHxC1y
ABFz2NjTF8QEsT+UxmEjmxpz69vPR0ZrmTAfinDVztSl+wD/VGhiATsjfOYSODVN
/8MHPSPtEl+L//QaTWmBKximfu7IdmTecHC9S7ZGHawX/N1FhbYXt7z6PJVG+bij
P9Aj6pgHTmMz+OjdT8+ZtR+IoQCi0yjjI5X9031aMmGS5jnUl+j9YPSlP1A8gmOe
odR+3YRHcg4/EgbRUGYEezJlEhX3gU+nMX/L4K6dzbh3N67kl4+kxPDn3KQ2Qxpk
G7YqBpqZR72BVtLOQs5NbbxhzF+x88qwpnupxdNd9+aqOM96BwTvdO2VJSyyJidR
5yiOGRAAQsjlLVYe23A7PQ3gbKlsOhyXI95cBO1epYnPGefAyiwyztScThEux3N3
gfB3C/0CCi2QWCCFz9aHgGqnJSkpw9HXA+su3kD3wgK3IFJDb2x4sBOjCzUTG942
oyGM8nQHFrG4G658eWrzI19eRJPuGe3DgPuA5bZ96gCaoWTSRWqi11zoZ/5YJPaf
b5Z7uKCPXCfLIAKNO7xB
=C1KJ
-----END PGP SIGNATURE-----

--Sig_/2Z9n+JDLqFo4BaivWt4h042--
