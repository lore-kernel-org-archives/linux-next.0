From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr/driver-core merge conflicts
Date: Thu, 29 May 2008 15:58:18 +1000
Message-ID: <20080529155818.6e298a47.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__29_May_2008_15_58_18_+1000_K6lUwm+NKvqE9+m5"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:35210 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750857AbYE2F60 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 29 May 2008 01:58:26 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>, Greg KH <greg@kroah.com>
Cc: Kay Sievers <kay.sievers@vrfy.org>, linux-next@vger.kernel.org

--Signature=_Thu__29_May_2008_15_58_18_+1000_K6lUwm+NKvqE9+m5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
drivers/virtio/virtio_pci.c between commit
6ddd7ce42a7bb3382a8bfb10caa6a5cce321b533 ("driver core: convert to new
device API to allow names longer than 20 chars") from the driver-core
tree and commit c77b394544154fdd2fb2211a2106fcc793aaa547
("virtio:pci-should-not-set-bus_id") from the rr tree.  The latter
removes code that the former changed to use dev_set_name().

The second conflict was in drivers/virtio/virtio.c between the same
driver-core commit and commit a48130de9ad5da45f6d3035030e1fc975559e0e7
("virtio:bus_id-should-contain-virtio-name") from the rr tree.  The
former did the dev_set_name() change while the latter added "virtio" to
the name.  I did the obvious.

Greg, is there some way we could add a version of dev_set_name() to
current mainline now so that the conversions can be farmed out (or at
least be done in other trees destined for linux-next)?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__29_May_2008_15_58_18_+1000_K6lUwm+NKvqE9+m5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFIPkYATgG2atn1QN8RAnKGAJwO9Atj1iAIYsBDva9unvevgcFTlACeKzxh
X0aH+aW4e+QL+10n8i6EQnA=
=zftu
-----END PGP SIGNATURE-----

--Signature=_Thu__29_May_2008_15_58_18_+1000_K6lUwm+NKvqE9+m5--
