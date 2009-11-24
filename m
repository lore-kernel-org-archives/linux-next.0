From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: alacrity tree build failure
Date: Tue, 24 Nov 2009 18:58:43 +1100
Message-ID: <20091124185843.d2cab90c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__24_Nov_2009_18_58_43_+1100_/qYMZDtrdJOxZk=M"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:57495 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932151AbZKXH6n (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Nov 2009 02:58:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Gregory Haskins <gregory.haskins@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeremy Fitzhardinge <jeremy@xensource.com>, xen-devel@lists.xensource.com, Mark McLoughlin <markmc@redhat.com>

--Signature=_Tue__24_Nov_2009_18_58_43_+1100_/qYMZDtrdJOxZk=M
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gregory,

Today's linux-next build (x86_6 _allmodconfig) failed like this:

drivers/vbus/built-in.o:(.data+0x0): multiple definition of `dev_attr_modal=
ias'
drivers/xen/built-in.o:(.data+0x46d0): first defined here

Caused by commit 59aa8f441d27c8470764a513dafa46a77f33e953 ("vbus: add
autoprobe capability to guest").  The DEVICE_ATTR(modalias ...) should
probably be static.  I should probably be static in
drivers/xen/xenbus/xenbus_probe.c as well.

I have used the version of the alacrity tree from next-20091123 for today.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__24_Nov_2009_18_58_43_+1100_/qYMZDtrdJOxZk=M
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksLkjMACgkQjjKRsyhoI8xdggCghmFC4DHrTZW/9QyDMftzfJ9M
d6AAoIKUXSdMo61pFLMqBVytODhlIUGU
=Q9Ck
-----END PGP SIGNATURE-----

--Signature=_Tue__24_Nov_2009_18_58_43_+1100_/qYMZDtrdJOxZk=M--
