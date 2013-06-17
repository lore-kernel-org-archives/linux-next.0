From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Request inclusion of ARM MPIDR linearization patches into
 linux-next
Date: Mon, 17 Jun 2013 10:07:56 +1000
Message-ID: <20130617100756.37c25388ab9f232b23321ce8@canb.auug.org.au>
References: <20130611174629.GA14453@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Mon__17_Jun_2013_10_07_56_+1000_DFFbLg3V03DmOyNl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from haggis.pcug.org.au ([203.10.76.10]:59051 "EHLO
	members.tip.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755557Ab3FQAIA (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 16 Jun 2013 20:08:00 -0400
In-Reply-To: <20130611174629.GA14453@e102568-lin.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, nicolas.pitre@linaro.org, Russell King <rmk@arm.linux.org.uk>

--Signature=_Mon__17_Jun_2013_10_07_56_+1000_DFFbLg3V03DmOyNl
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lorenzo,

On Tue, 11 Jun 2013 18:46:29 +0100 Lorenzo Pieralisi <lorenzo.pieralisi@arm=
.com> wrote:
>
> can I ask you please to include the following branch into linux-next:
>=20
> git://linux-arm.org/linux-2.6-lp.git for-next
>=20
> It contains significant changes in ARM PM core code and would like to giv=
e it
> wide coverage before requesting a pull. It has been already publicly post=
ed,
> reviewed and tested.

Added from today with you as contact and called arm-mpidr.  I assume that
this will be merged via Russell's arm tree.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgment of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
	Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

Legal Stuff:
By participating in linux-next, your subsystem tree contributions are
public and will be included in the linux-next trees.  You may be sent
e-mail messages indicating errors or other issues when the
patches/commits from your subsystem tree are merged and tested in
linux-next.  These messages may also be cross-posted to the linux-next
mailing list, the linux-kernel mailing list, etc.  The linux-next tree
project and IBM (my employer) make no warranties regarding the linux-next
project, the testing procedures, the results, the e-mails, etc.  If you
don't agree to these ground rules, let me know and I'll remove your tree
from participation in linux-next.

--Signature=_Mon__17_Jun_2013_10_07_56_+1000_DFFbLg3V03DmOyNl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJRvlNcAAoJEECxmPOUX5FEU+0P/jeMNXIBtltzxlxhlcMJZtSQ
axSgBJJCGQzIR7srl1TnHnuo05UfUmyPZ5AtMdCWnZNuRmluNgBGMuOF6h2mHlJT
3aRhIuh1Ny9/D0965aR9zF0Uhnv8yECusEbToxuhXdsY1C6/H/fQzNMNo3vcKpTq
cVGvGnmZuBB5KVwBS99deT6LNZ3L+ojEud1MSDHu8i5QovOCsX2M3wZcrvDbKqR1
ZJp3qmANUeOXLHxzAn6QjixHTL+/NVpuq3FbbJyT7El9GC0epE07Wu6EzQqwgarc
VsmCbbvefIUs73sVi1BbwRNFXybv+yLqrPrXw9ntnrbfYLb1niRyB8X3YxpvITN9
pCSU4INmEFSmYWygiGawmRrJcLKP49LCzGOeTMTfzLJro4tma2ftQwiysPfA1Sj/
45oaE+hmM2HCDGr+IxW31JW0/U5XM7dnCZSnrip27C6y7dgz2dtWdrg63Yp+9O+J
3oBRzotdW6k3PpJiul3uB4i5CCqRAZzVtVX91Nr8tD/9tip590BA4L89bhzT7vlx
JPBY9evFQrR20K9AaxAyLQ4QfYz3uT9n68umUkYKZ02+N/6BI5V/ElEFkC+wNVcm
u0b/OHsyfUlMHj2w4nVckqASnFwitOSJodcmN5Ur1uY4UamNw0NILyO5+wC7X4Wo
1WfTQFMU0/IVtuRpsuuV
=iTci
-----END PGP SIGNATURE-----

--Signature=_Mon__17_Jun_2013_10_07_56_+1000_DFFbLg3V03DmOyNl--
