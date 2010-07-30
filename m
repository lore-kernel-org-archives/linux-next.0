From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the devicetree tree
Date: Fri, 30 Jul 2010 13:57:21 +1000
Message-ID: <20100730135721.5c1df39c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Fri__30_Jul_2010_13_57_21_+1000_pyrQeVGaywZSMN4y"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33559 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758361Ab0G3D51 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 Jul 2010 23:57:27 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Anatolij Gustschin <agust@denx.de>

--Signature=_Fri__30_Jul_2010_13_57_21_+1000_pyrQeVGaywZSMN4y
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Grant,

After merging the devicetree tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/spi/xilinx_spi.c: In function 'xilinx_spi_init':
drivers/spi/xilinx_spi.c:393: error: 'struct device' has no member named 'o=
f_node'
drivers/spi/xilinx_spi.c:393: error: 'struct device' has no member named 'o=
f_node'

Caused by commit 65b25b3c3080d96c42b31e0d97e7fcf4fabceeb4 ("of/spi: call
of_register_spi_devices() from spi core code").

I have used the devicetree tree from next-20100729 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Fri__30_Jul_2010_13_57_21_+1000_pyrQeVGaywZSMN4y
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMUk2hAAoJEDMEi1NhKgbsT1YH/RR3YZz7AJAW2M+BK51vKILt
Zh0f0PavoyDJfOWLyd3+TEGP+pp3WnaO5/Rq4mhS/gqxgs7+v4w0fgb/AJvyI22+
CZYL77PI6l2E5mqcnNPVO2khwJDAg/+XSM+bznhu5MF9NRMef3CV+gO9K7k/6LHA
kVtxE2y3kafgqZRYAix+rXhp7wwN+oj4uFcXYP+8f+FdB84PlEg8sEzFD4Lqa3gA
RDMZwfKEIMZBIxMo/MbOt3BR9jcj7drU4WH7i7Z5zdJ2AuXgqFC3r8Pay025CtUV
oAltk+UBVXId/1PdRpxNkpmVLye3djcHaMSH10z/X1QyTzH8VqmdCVo0MrPUTqA=
=sMlZ
-----END PGP SIGNATURE-----

--Signature=_Fri__30_Jul_2010_13_57_21_+1000_pyrQeVGaywZSMN4y--
