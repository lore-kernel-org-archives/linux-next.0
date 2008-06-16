From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of driver-core tree
Date: Mon, 16 Jun 2008 10:39:06 +1000
Message-ID: <20080616103906.35926c45.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__16_Jun_2008_10_39_06_+1000_Tv.xeWX7vwixBO5a"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56074 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750851AbYFPAjT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 15 Jun 2008 20:39:19 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, James Bottomley <James.Bottomley@HansenPartnership.com>, Mike Christie <michaelc@cs.wisc.edu>, Kay Sievers <kay.sievers@vrfy.org>

--Signature=_Mon__16_Jun_2008_10_39_06_+1000_Tv.xeWX7vwixBO5a
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next merge of the driver-core tree got a context conflict
in drivers/scsi/hosts.c between commit
3ed7897242b7efe977f3a8d06d4e5a4ebe28b10e ("[SCSI] scsi_host regression:
fix scsi host leak") from the scsi-rc-fixes (presumably soon to be
Linus') tree and commit d2523cff4094586032a5b0820ca86fbae6424dc0 ("Driver
Core: add ability for class_find_device to start in middle of list") from
the driver-core tree.

It is trivial and I fixed it up.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__16_Jun_2008_10_39_06_+1000_Tv.xeWX7vwixBO5a
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhVtioACgkQTgG2atn1QN+BRQCcCE6ht01i1mvYr7j9netj9+k8
SNgAnAjTvRbKusQJVPYhNIsLW9eDG3hI
=gVKc
-----END PGP SIGNATURE-----

--Signature=_Mon__16_Jun_2008_10_39_06_+1000_Tv.xeWX7vwixBO5a--
