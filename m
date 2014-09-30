From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the tty tree
Date: Tue, 30 Sep 2014 17:39:00 +1000
Message-ID: <20140930173900.51839e76@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SgY1gAK9ldqL5_SSxtpdnE4"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51785 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750988AbaI3HjN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 30 Sep 2014 03:39:13 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>

--Sig_/SgY1gAK9ldqL5_SSxtpdnE4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the tty tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:


drivers/built-in.o: In function `.serial8250_stop_tx':
8250_core.c:(.text+0xda1f4): undefined reference to `.__xchg_called_with_ba=
d_pointer'
drivers/built-in.o: In function `.serial8250_tx_chars':
(.text+0xda42c): undefined reference to `.__xchg_called_with_bad_pointer'
drivers/built-in.o: In function `.serial8250_start_tx':
8250_core.c:(.text+0xda630): undefined reference to `.__xchg_called_with_ba=
d_pointer'

Caused by commit d74d5d1b7288 ("tty: serial: 8250_core: add run time
pm").  xchg is called with &p->rpm_tx_active and that is an unsigned
char.  PowerPC (at least) only allows xchg with objects 4 (or 8 on 64
bit) bytes long.

I have used the version of the tty tree from next-20140926 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/SgY1gAK9ldqL5_SSxtpdnE4
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUKl4eAAoJEMDTa8Ir7ZwVTUwP/R6EUqxJt4M0t9I1Ldjl0gAx
FLoqJpXkoSqCVfTD/omKt/DylA+kSx7LWU1MqkpXfwt60ne2ZZgNrkik5yrrTS3Y
wFGc/+UIXGD6LyMeJz9v7euwmuJQ15eLhySPOCYCjciS2IVVBaA3jREleykDQmTy
kGXWo9LZPwaC+em4y5tPIy7VHWl+KJiIVLlrS5UhNC92YDMVFeCx3dgGkQ/MgQed
agkz0YPYNAUJCR9aagV7US6Z6Y5Tje0q63vmy+5jtqxfMDIVIraEcHhCwh/Kgc7m
Sc7KxrOE0DA/EkaCV12DZoY1NOoCDWr2uWkoT7zeQw/Cv0w29tkUX5WLqXHWo2S+
c5RCUaPKecWQgXrYLkuv14sfk9KGRwDHlvgmbEtQFxLn5Z4GNZvDSIM227EJ29f/
/hteSEQuQgNm9o78r9OA1IgBYcyKAxruJggFVdMkdrKVUvy+lw1gxBa+MR8/zvYZ
LelKifAmFXWMqc0DEc0F2bXGgkHPV5gw93ZNv5tV2y54qePwxQBAuqZmn6YDySbC
mGgP7TiMpU1QNTmzVHc2EgtMMC7tycWdXa7PA5VvIa55Um0fJHlaPM1a85tvz3vN
4Vuuraof1T6tH/YADFAwZHJtzZu1U0mTC1cGdsEF5nx9Z+yyB47/eKBddCUEmATZ
ikiVcMtGijQQ5M3kPxAz
=fAjG
-----END PGP SIGNATURE-----

--Sig_/SgY1gAK9ldqL5_SSxtpdnE4--
