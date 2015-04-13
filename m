From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the irqchip tree
Date: Mon, 13 Apr 2015 17:05:39 +1000
Message-ID: <20150413170539.2f20e0a8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/PCeNL9Hhfy31NYx6bJtU9JP"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:47294 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753297AbbDMHFr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 03:05:47 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>

--Sig_/PCeNL9Hhfy31NYx6bJtU9JP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

After merging the irqchip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

kernel/irq/generic-chip.c: In function 'irq_map_generic_chip':
kernel/irq/generic-chip.c:408:2: error: implicit declaration of function 'i=
rq_domain_set_info' [-Werror=3Dimplicit-function-declaration]
  irq_domain_set_info(d, virq, hw_irq, chip, gc, ct->handler, NULL, NULL);
  ^

Caused by commit 3f6b2c298240 ("genirq: Generic chip: Support hierarchy
domain").  The only declaration of irq_domain_set_info() depends on
CONFIG_IRQ_DOMAIN_HIERARCHY.

I have used the irqchip tree from next-20150410 fot today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/PCeNL9Hhfy31NYx6bJtU9JP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVK2rHAAoJEMDTa8Ir7ZwVgKoP/A/GWRw6MsNOuZ4E1sgjBx6d
fyFzIPGwZv+RkjZElxgoLhhbcIFiF5rzNoeIYMSut8jsdK6QwGBWOmTqh3G89VKa
OU/mnT5PpbIEshtmOabvxvlOddaxzceu8Nm3UyvT9hATjNALdHKvxnnz/pX9VN72
J1qTRNsAeziCiJA6Iwrhv+MKMVE3vGEL1ZsVR2f2IbcG7ZYNacwBvaTdb6rrqyVV
SxVgqQGhGfXq0BbWQqJm6N7yUFCUrB/c5jfW7hriWTzekysvcxicE+xdXL+qNPRA
oVK9CAbgO6d1MLYmVXz+hIVpoMe7c7WX2RteAoAjMoc5zRTYPjyWDk5LwyMpXUIP
Bvp54CqfFWw3MQmehBEy20glS2GTCtslzpmRQp1qXb2dkFqxXNwJqWfwjJ/ZanaA
GM/zJSJexxYuma/zEFC8ryCpTJyHMJrwLF3S3rmTbLmOdATRS/9KcXcKChhAhXS0
EU8FMSuDH3eeTtrSiKhabglp3A+BL9emJ7FGSHhlnE7Kzw3HEEAss6dSCndxkH4y
s4BeO/2/hx85KiV+GpnWS33aIONpAYu76At/doLt8O6LEIPknMOillMYOxvAKTVu
Cf0Eph/yowQt5UwbZ1JTJzJIT4sXVz08zpCxEm2f8GY8v8ox7+HawIhiqlBv3qUN
QQhDcTIGWydhwW4vbjJE
=gKFq
-----END PGP SIGNATURE-----

--Sig_/PCeNL9Hhfy31NYx6bJtU9JP--
