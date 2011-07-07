From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the final tree (staging
 tree related)
Date: Thu, 7 Jul 2011 16:25:54 +1000
Message-ID: <20110707162554.c069e5c60e103804a99d27b1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__7_Jul_2011_16_25_54_+1000_EREYEaZXySEYjudq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42434 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752916Ab1GGG0J (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Jul 2011 02:26:09 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ondrej Zary <linux@rainbow-software.org>

--Signature=_Thu__7_Jul_2011_16_25_54_+1000_EREYEaZXySEYjudq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the final tree, today's linux-next build (powerpc
allyesconfig) failed like this:

In file included from drivers/staging/ft1000/ft1000-pcmcia/ft1000_proc.c:26=
:0:
drivers/staging/ft1000/ft1000-pcmcia/ft1000.h: In function 'ft1000_read_reg=
':
drivers/staging/ft1000/ft1000-pcmcia/ft1000.h:80:2: error: implicit declara=
tion of function 'inw'
drivers/staging/ft1000/ft1000-pcmcia/ft1000.h: In function 'ft1000_write_re=
g':
drivers/staging/ft1000/ft1000-pcmcia/ft1000.h:86:2: error: implicit declara=
tion of function 'outw'

Caused by commit 8ac299853b70 ("staging: ft1000-pcmcia: get rid of
ft1000_dev.h") which I can;t revert (it is too deeply buried).  I have
just left the breakage for today - hopefully it will be fixed before I
have to worry about it again. :-)
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__7_Jul_2011_16_25_54_+1000_EREYEaZXySEYjudq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOFVFyAAoJEDMEi1NhKgbsg14IAKJmoZr3CPikV4kTzI/XEf04
SSv/uvFMhhQFxWAXR3woMScOyGBiPAoxS86VeOMADLuuAT533bVePT+ay44RvXMh
OBwYnYnFtDVTKgeKn7ayuI8Slvb9T2XrWGNhDYqDHPAADlLuRe90fgk77LgHAiHo
hKe5cP0QyHHSWQ3eeO8NVWshXAmw5J8umEoGeVicf9w4tmAHtl53OLxUsL1eCMU7
MexbMpR86+Goz/0XuCVpNB/MJp6O//r9gDc8E9g3BcLW4CU3MuyWtAEXs/PDoCGk
OsSVXQEAm41CeoDmdc+WeDJCXknsCCl02gL8wPblxqWl/vpbF/uKJTk37a5Wt0k=
=hYJ6
-----END PGP SIGNATURE-----

--Signature=_Thu__7_Jul_2011_16_25_54_+1000_EREYEaZXySEYjudq--
