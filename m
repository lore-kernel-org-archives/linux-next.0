From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the
 driver-core.current tree
Date: Tue, 10 Jul 2012 17:28:38 +1000
Message-ID: <20120710172838.06f3fff7ab03d91898d18f51@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Tue__10_Jul_2012_17_28_38_+1000_XVWjoOvhq+4SIHHD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Kay Sievers <kay@vrfy.org>, Greg KH <greg@kroah.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Tue__10_Jul_2012_17_28_38_+1000_XVWjoOvhq+4SIHHD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm tree got a conflict in
kernel/printk.c between commit 5becfb1df5ac ("kmsg: merge continuation
records while printing") from the driver-core.current tree and commit
"printk: only look for prefix levels in kernel messages" from the akpm
tree.

I fixed it up (see below) and can carry the fix as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/printk.c
index 104a4ee,04983fc..0000000
--- a/kernel/printk.c
+++ b/kernel/printk.c
@@@ -1496,24 -1453,27 +1495,27 @@@ asmlinkage int vprintk_emit(int facilit
  	/* mark and strip a trailing newline */
  	if (text_len && text[text_len-1] =3D=3D '\n') {
  		text_len--;
 -		newline =3D true;
 +		lflags |=3D LOG_NEWLINE;
  	}
 =20
- 	/* strip syslog prefix and extract log level or control flags */
- 	kern_level =3D printk_get_level(text);
- 	if (kern_level) {
- 		const char *end_of_header =3D printk_skip_level(text);
- 		switch (kern_level) {
- 		case '0' ... '7':
- 			if (level =3D=3D -1)
- 				level =3D kern_level - '0';
- 		case 'd':	/* KERN_DEFAULT */
- 			lflags |=3D LOG_PREFIX;
- 		case 'c':	/* KERN_CONT */
- 			break;
+ 	/* strip kernel syslog prefix and extract log level or control flags */
+ 	if (facility =3D=3D 0) {
+ 		int kern_level =3D printk_get_level(text);
+=20
+ 		if (kern_level) {
+ 			const char *end_of_header =3D printk_skip_level(text);
+ 			switch (kern_level) {
+ 			case '0' ... '7':
+ 				if (level =3D=3D -1)
+ 					level =3D kern_level - '0';
+ 			case 'd':	/* KERN_DEFAULT */
 -				prefix =3D true;
++				lflags |=3D LOG_PREFIX;
+ 			case 'c':	/* KERN_CONT */
+ 				break;
+ 			}
+ 			text_len -=3D end_of_header - text;
+ 			text =3D (char *)end_of_header;
  		}
- 		text_len -=3D end_of_header - text;
- 		text =3D (char *)end_of_header;
  	}
 =20
  	if (level =3D=3D -1)

--Signature=_Tue__10_Jul_2012_17_28_38_+1000_XVWjoOvhq+4SIHHD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJP+9mmAAoJEECxmPOUX5FE0qEP/3In57sbk6UQm4LntPGUvasV
UfNuxw5z7GkwYGEtKMyhm4z7weHzFx0iBtN2GrF3SNyFObym/AUkDXn487PcyCk8
YgZ1ys+KjYBZ9ul5Q9yFYwMkWx4wIUrYDWwj1nwlXPc8ThUZHczeVpJivw/YKdC3
HFI66NSxFD5BdnEkX4gMVZtAcqO8tv8U2O2KYxE38bowmR8CYKjq8WkbnRq7ZvxX
VglHX5fVTiW1lJ+Uk5BIkUShSWXUwXAuSSKlLjRk0zrkne/xL/l5WuMQESEvyt2A
MlR749A7o4dyfgEUc4T5q0V7UIMO8hS44wyXfYI0jWWoEGtNVpUbDupjdk1NyG1x
Eq7uK7B2xVk7LT1xPf7/n7cAGhwnp7fxYt4vCMEi8s6lW/XtDVQbI2Zicx/mFzqZ
D5vJ125u5I94EICRgA/5Uj3gEDjRukj4tKof80zVhgeFgNlFxpE8Ds2W/ZqSIo6T
EpQ6uTXlG7AOE3l5zoNzAsyqYWslDZFo7B/6DyAa02BPPRAwsqiEle771buCp/jI
BK4hCAariVsyY8xWqvIM1PeG1Bp9Mkd8wZIhHeY3WAVZDUBwK4YfbiwrqWeoMMDT
GI59GmT0B8NzN4AEdSIS8gNCXciLLTbV19zZ3ZkZHbnSf0+FxZKrK0cSxqFmYl8D
P6ormvlTayu2cLcXkWt2
=5T0Z
-----END PGP SIGNATURE-----

--Signature=_Tue__10_Jul_2012_17_28_38_+1000_XVWjoOvhq+4SIHHD--
