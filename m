From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mips tree
Date: Tue, 27 Jul 2010 11:14:22 +1000
Message-ID: <20100727111422.673b4919.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__27_Jul_2010_11_14_22_+1000_m5YeOWhW+SyVqixs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__27_Jul_2010_11_14_22_+1000_m5YeOWhW+SyVqixs
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ralf,

After merging the xtensa tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/video/jz4740_fb.c:29:39: error: asm/mach-jz4740/jz4740_fb.h: No suc=
h file or directory
drivers/video/jz4740_fb.c:30:34: error: asm/mach-jz4740/gpio.h: No such fil=
e or directory
drivers/video/jz4740_fb.c:149: error: array type has incomplete element type
drivers/video/jz4740_fb.c:150: error: implicit declaration of function 'JZ_=
GPIO_BULK_PIN'
drivers/video/jz4740_fb.c:150: error: 'LCD_PCLK' undeclared here (not in a =
function)

... and on and on ...

Caused by commit e457478bc296ea3f2ae51ca7c165a59621c1655d ("FBDEV:
JZ4740: Add framebuffer driver").  Presumably this driver will only build
on MIPS?

I have used the mips tree from next-20100726 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__27_Jul_2010_11_14_22_+1000_m5YeOWhW+SyVqixs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMTjLuAAoJEDMEi1NhKgbs234H/08PF7lp1Q5WsQzaStcMwIVC
bgJCqAb/KtYcpzYYkPgsJkZcobXdqQgzqhiqCX3ZsH7VkWMpoT2HZY1ae4oWGH1Z
UMBo2hIbL4he0HQnZuSY50biXH43jE3C7Mou2aSfuIpUjTPLI54RcKvX42ISVhZN
ONr5WfjmxsVlxeZGig+Vh4BJ/PZTlnY7QRUT6x20oEi3omzJzXEvJpw6PglvegUl
pzahQI4iUjmCTmW0M1ZRlemAq3GJsvP6s4Azxz3Cl+eRKdSB8eaCzVC+PjwcS84I
fQQjesj4cBgZYcUfHN2V2+IDApX5Vc3/Wm5XXkC+maa1WclJXndbxFzP1xizL3g=
=Xqef
-----END PGP SIGNATURE-----

--Signature=_Tue__27_Jul_2010_11_14_22_+1000_m5YeOWhW+SyVqixs--
