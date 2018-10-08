From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the irqchip tree
Date: Mon, 8 Oct 2018 14:06:21 +1100
Message-ID: <20181008140621.3c5e5c93@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/w2NLYbw_8geH6UWII=jnrYi"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>
List-Id: linux-next.vger.kernel.org

--Sig_/w2NLYbw_8geH6UWII=jnrYi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marc,

After merging the irqchip tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/irqchip/irq-madera.c:21:
include/linux/irqchip/irq-madera.h: In function 'madera_get_irq_mapping':
include/linux/irqchip/irq-madera.h:99:37: error: 'struct madera' has no mem=
ber named 'irq_data'; did you mean 'irq_dev'?
  return regmap_irq_get_virq(madera->irq_data, irq);
                                     ^~~~~~~~
                                     irq_dev
drivers/irqchip/irq-madera.c: In function 'madera_irq_probe':
drivers/irqchip/irq-madera.c:217:34: error: 'struct madera' has no member n=
amed 'irq_data'; did you mean 'irq_dev'?
       &madera_irq_chip, &madera->irq_data);
                                  ^~~~~~~~
                                  irq_dev
drivers/irqchip/irq-madera.c: In function 'madera_irq_remove':
drivers/irqchip/irq-madera.c:238:43: error: 'struct madera' has no member n=
amed 'irq_data'; did you mean 'irq_dev'?
  regmap_del_irq_chip(madera->irq, madera->irq_data);
                                           ^~~~~~~~
                                           irq_dev

Caused by commit

  b817ff5c9509 ("irqchip: Add driver for Cirrus Logic Madera codecs")

I have used the irqchip tree from next-20181005 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/w2NLYbw_8geH6UWII=jnrYi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu6ya0ACgkQAVBC80lX
0GwXMAgAloRbbdGQEVhzl7uEaRPp75ftvZV9P56kNUMbdDPf/BgCc8wyoqmv9BwD
m5RRVJJ9Nc2uCccHG0JLpCMQ9DJgg9EKkhapdc6by16SivG3o9ZJRBUoRAYAWiNb
xxe0zz7zIPwaYVPy3UAgZnECiT0UjRQqUjT0GdDKi0yQXIMqEEr2yOEa0BHxh90p
5GgibkUNLnci5ZRLTePUgwjaXQcSkeRFK1bl/g+SsO2pmmAXnA5rbVEk07NfRFUJ
SBHYDYM2VvvEOOYXE/Z9Y8V7kJyQAnc0/eEvWlA9OeoDBTGkO9YzS54aQBookTk9
B2Fs/McQf7yEmNjFZXlU/Lnj+miurQ==
=CtKm
-----END PGP SIGNATURE-----

--Sig_/w2NLYbw_8geH6UWII=jnrYi--
