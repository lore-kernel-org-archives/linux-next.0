From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: staging tree build failure
Date: Wed, 9 Dec 2009 16:56:46 +1100
Message-ID: <20091209165646.41b9ce8a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__9_Dec_2009_16_56_46_+1100_5QP5zI3ZS5/QwUvd"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38341 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751317AbZLIF4p (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Dec 2009 00:56:45 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>

--Signature=_Wed__9_Dec_2009_16_56_46_+1100_5QP5zI3ZS5/QwUvd
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/net/usb/kaweth.c: In function 'kaweth_open':
drivers/net/usb/kaweth.c:719: error: implicit declaration of function 'usb_=
autopm_enable'

Caused by commit b3f937e6ddf3e60ed9b4c26349b7b171dffdd010 ("USB: prepare
for changover to Runtime PM framework").

I have reverted that commit for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__9_Dec_2009_16_56_46_+1100_5QP5zI3ZS5/QwUvd
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksfPB4ACgkQjjKRsyhoI8zBHQCgj4mBPNx8aH5MRFmZDonLlmqa
OOEAmwQOVrU42FHRlIFLylCnJ8hffygC
=1QoI
-----END PGP SIGNATURE-----

--Signature=_Wed__9_Dec_2009_16_56_46_+1100_5QP5zI3ZS5/QwUvd--
