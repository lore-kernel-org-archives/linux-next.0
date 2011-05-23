From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the suspend tree
Date: Mon, 23 May 2011 15:06:36 +1000
Message-ID: <20110523150636.ccd83777.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__23_May_2011_15_06_36_+1000_kxuSAlpJ1ioUnjhU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40245 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752339Ab1EWFGk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 23 May 2011 01:06:40 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, mark gross <markgross@thegnar.org>

--Signature=_Mon__23_May_2011_15_06_36_+1000_kxuSAlpJ1ioUnjhU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rafael,

After merging the suspend tree, today's linux-next build (i386 defconfig
among others) produced this warning:

kernel/pm_qos_params.c: In function 'pm_qos_power_write':
kernel/pm_qos_params.c:420: warning: passing argument 3 of 'kstrtol' from i=
ncompatible pointer type
include/linux/kernel.h:210: note: expected 'long int *' but argument is of =
type 's32 *'

Intreoduced by commit 365daa955e03 ("PM: Correct PM QOS's user mode
interface to work with ascii input per").

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__23_May_2011_15_06_36_+1000_kxuSAlpJ1ioUnjhU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN2etcAAoJEDMEi1NhKgbsEu8H/R1wg/xsnVPyfw0hHU3m9oGu
h1KkEdSlsUwO4Fwl1AemhsfIuSVjbsxDftFPMgK/6TLjrydTVT3zwvdZ/GAIJLGX
N/I9lzGRCN0mjAc5LHNcHD7vhN27YB6sb5dy2d3SEYPMgZ2+HiIk2f+mBA8akCqy
NaWpTVKrXtKAzfzI238nkxcSJJLXH6K9oc/eSSnNpWQ5xi/njZDj5U3ljs6kovA0
PpqXM2zeWZloEC37DakOUHmLG6DrZS9uHqmzduwSSi1mHpe5u8J7Sj6KxJe92r5p
UeSUf1ipXymzIo6voPFsBN5VWa3CvCxrLXNYl8ww+T5TPw19YKhk6fZEn9io6Lg=
=ha5Q
-----END PGP SIGNATURE-----

--Signature=_Mon__23_May_2011_15_06_36_+1000_kxuSAlpJ1ioUnjhU--
