From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the arm tree with the arm-current
 tree
Date: Mon, 18 Jan 2010 14:34:29 +1100
Message-ID: <20100118143429.7ef34dde.sfr@canb.auug.org.au>
References: <20100118103534.a5dc3c66.sfr@canb.auug.org.au>
	<20100118013307.GD10014@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__18_Jan_2010_14_34_29_+1100_UDMfx2BV6EmZgjJU"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60642 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751114Ab0ARDei (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 17 Jan 2010 22:34:38 -0500
In-Reply-To: <20100118013307.GD10014@trinity.fluff.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ben Dooks <ben-linux@fluff.org>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

--Signature=_Mon__18_Jan_2010_14_34_29_+1100_UDMfx2BV6EmZgjJU
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ben,

On Mon, 18 Jan 2010 01:33:07 +0000 Ben Dooks <ben-linux@fluff.org> wrote:
>
> Is that from the merge of next-samsung or from two parts of the ARM
> trees?

I merged the arm-current tree
(ssh://master.kernel.org/home/rmk/linux-2.6-arm.git#master) into
linux-next and then later the arm tree
(ssh://master.kernel.org/home/rmk/linux-2.6-arm.git#devel) and the second
merge produced this conflict.  However, Russell has merged the samsung
tree (git://git.fluff.org/bjdooks/linux.git#next-samsung) into the arm
tree, already.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__18_Jan_2010_14_34_29_+1100_UDMfx2BV6EmZgjJU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktT1sUACgkQjjKRsyhoI8xjswCeO9r2XL/ROv3zpdvm2FhwfKzL
f3MAnR4xL7azl0QuKVaZ5ZdrjqSGvFZ9
=XfxJ
-----END PGP SIGNATURE-----

--Signature=_Mon__18_Jan_2010_14_34_29_+1100_UDMfx2BV6EmZgjJU--
