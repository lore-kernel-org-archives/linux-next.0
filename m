From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the timers tree
Date: Tue, 14 Oct 2008 16:59:24 +1100
Message-ID: <20081014165924.4e71241b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__14_Oct_2008_16_59_24_+1100_9bvOdQ/03rz0EaIZ"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46486 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754990AbYJNHFb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 03:05:31 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>, Alan Cox <alan@redhat.com>

--Signature=_Tue__14_Oct_2008_16_59_24_+1100_9bvOdQ/03rz0EaIZ
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the timers tree got a conflict in
drivers/serial/8250.c between commit
b70ac7718579b5cbf3bdd74fd01132d1c91596f4 ("serial: allow 8250 to be used
on sparc") from Linus' tree and commit
d1c115207ad93ecf1140c38c3cef249352433c28 ("serial, 8250: remove NR_IRQ
usage") from the timers tree.

Just overlapping changes. I fixed it up (see below).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/serial/8250.c
index ec39203,356c2a2..0000000
--- a/drivers/serial/8250.c
+++ b/drivers/serial/8250.c
@@@ -3003,15 -3027,11 +3049,15 @@@ static int __init serial8250_init(void
  		goto out;
 =20
  	platform_device_del(serial8250_isa_devs);
-  put_dev:
+ put_dev:
  	platform_device_put(serial8250_isa_devs);
-  unreg_uart_drv:
+ unreg_uart_drv:
 +#ifdef CONFIG_SPARC
 +	sunserial_unregister_minors(&serial8250_reg, UART_NR);
 +#else
  	uart_unregister_driver(&serial8250_reg);
 +#endif
-  out:
+ out:
  	return ret;
  }
 =20

--Signature=_Tue__14_Oct_2008_16_59_24_+1100_9bvOdQ/03rz0EaIZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj0NTwACgkQjjKRsyhoI8xVkwCgu+XoWNvYFdEkgrcWz0zGqW0L
HzcAoK49f5mdNKpDWrWIu0nlOSI3g9Ki
=2lvc
-----END PGP SIGNATURE-----

--Signature=_Tue__14_Oct_2008_16_59_24_+1100_9bvOdQ/03rz0EaIZ--
