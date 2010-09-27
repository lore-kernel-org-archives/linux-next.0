From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the final tree (tty tree
 related)
Date: Mon, 27 Sep 2010 15:31:51 +1000
Message-ID: <20100927153151.9bf66022.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__27_Sep_2010_15_31_51_+1000_1arbMHFGOPHt4g8Q"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41859 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752906Ab0I0FcB (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 27 Sep 2010 01:32:01 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Cox <alan@linux.intel.com>

--Signature=_Mon__27_Sep_2010_15_31_51_+1000_1arbMHFGOPHt4g8Q
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the final tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/char/nozomi.c: In function 'ntty_ioctl':
drivers/char/nozomi.c:1831: warning: unused variable 'argp'

Introduced by commit dd612b1a8edb7fb3a117c388bfb520476e04ed18 ("tty:
icount changeover for other main devices").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__27_Sep_2010_15_31_51_+1000_1arbMHFGOPHt4g8Q
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQEcBAEBAgAGBQJMoCxHAAoJEDMEi1NhKgbsEYgH/0L1xYXNY+Q5FSOT/0ig1D/y
hvPj1TMb7ZLPdN1peVIBawjRx2rYurGxGwD4zsL5YULqGQAAlFPuj2QA895nOYUg
rKIW7WIQdIUpE5O5PEC05ih5SzBNXvZsg9FVsaybJiwYZZ/IkWMG+lfQn+Tx0K0R
OSf0XGoyjTHYpp2eo2LMH73L65DeBzzdyTbtZS2mMXGrAwmPnh3KicdVMIjunews
grgSFR7DbSddbqQPDtso3df5l1L/CdD1UXwNZQimXapWEHG5XKf8Z4sJYGMvR4af
WAqbi2CDKKywbyFI12EYJlUuK4vTizHq24bhU3G16JjjpXk1LiovMYtvfEfygjg=
=SPey
-----END PGP SIGNATURE-----

--Signature=_Mon__27_Sep_2010_15_31_51_+1000_1arbMHFGOPHt4g8Q--
