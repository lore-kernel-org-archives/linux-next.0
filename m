From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: usb tree build warnings
Date: Mon, 10 Aug 2009 19:36:53 +1000
Message-ID: <20090810193653.f228cf06.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__10_Aug_2009_19_36_53_+1000_du9byIkd6g6Q=Ro7"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753299AbZHJJhH@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lothar Wassmann <LW@KARO-electronics.de>, Michael Hennerich <michael.hennerich@analog.com>, Bryan Wu <cooloney@kernel.org>, Mike Frysinger <vapier@gentoo.org>
List-Id: linux-next.vger.kernel.org

--Signature=_Mon__10_Aug_2009_19_36_53_+1000_du9byIkd6g6Q=Ro7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) produced these warnings:

In file included from drivers/usb/host/isp1362-hcd.c:100:
drivers/usb/host/isp1362.h: In function 'ALIGNSTAT':
drivers/usb/host/isp1362.h:583: warning: cast from pointer to integer of di=
fferent size
drivers/usb/host/isp1362.h: In function 'isp1362_write_fifo':
drivers/usb/host/isp1362.h:773: warning: cast from pointer to integer of di=
fferent size
drivers/usb/host/isp1362.h: In function 'isp1362_read_buffer':
drivers/usb/host/isp1362.h:965: warning: cast from pointer to integer of di=
fferent size
drivers/usb/host/isp1362.h: In function 'isp1362_write_buffer':
drivers/usb/host/isp1362.h:985: warning: cast from pointer to integer of di=
fferent size
drivers/usb/host/isp1362-hcd.c: In function 'isp1362_irq':
drivers/usb/host/isp1362-hcd.c:1079: warning: suggest parentheses around op=
erand of '!' or change '&' to '&&' or '!' to '~'
drivers/usb/host/isp1362-hcd.c:1091: warning: suggest parentheses around op=
erand of '!' or change '&' to '&&' or '!' to '~'
drivers/usb/host/isp1362-hcd.c: In function 'isp1362_mem_config':
drivers/usb/host/isp1362-hcd.c:2283: warning: format '%3u' expects type 'un=
signed int', but argument 5 has type 'long unsigned int'
drivers/usb/host/isp1362-hcd.c:2286: warning: format '%3u' expects type 'un=
signed int', but argument 5 has type 'long unsigned int'
drivers/usb/host/isp1362-hcd.c: In function 'isp1362_remove':
drivers/usb/host/isp1362-hcd.c:2676: warning: cast from pointer to integer =
of different size
drivers/usb/host/isp1362-hcd.c:2680: warning: cast from pointer to integer =
of different size
drivers/usb/host/isp1362-hcd.c: In function 'isp1362_probe':
drivers/usb/host/isp1362-hcd.c:2809: warning: cast from pointer to integer =
of different size
drivers/usb/host/isp1362-hcd.c:2812: warning: cast from pointer to integer =
of different size
drivers/usb/host/isp1362-hcd.c:2818: warning: cast from pointer to integer =
of different size

Introduced by commit 994857f5ead1a4f1d9152c5bbd6e63c2ec2d2b55 ("USB: NXP
ISP1362 USB host driver").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__10_Aug_2009_19_36_53_+1000_du9byIkd6g6Q=Ro7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkp/6jUACgkQjjKRsyhoI8xSJACfb5HQAVSpfCaPVryy9sIImAnO
vskAn2JJ+Permdwh1Y9Q2mWAB5a/epGs
=fvug
-----END PGP SIGNATURE-----

--Signature=_Mon__10_Aug_2009_19_36_53_+1000_du9byIkd6g6Q=Ro7--
