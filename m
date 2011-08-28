From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: iommu-tree for linux-next
Date: Mon, 29 Aug 2011 02:06:50 +1000
Message-ID: <20110829020650.777c7a4269b75a665fa9a69f@canb.auug.org.au>
References: <20110826114937.GE8978@8bytes.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__29_Aug_2011_02_06_50_+1000_iNAGp1h=Ybc4ycgq"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60527 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751291Ab1H1QHF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Aug 2011 12:07:05 -0400
In-Reply-To: <20110826114937.GE8978@8bytes.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org

--Signature=_Mon__29_Aug_2011_02_06_50_+1000_iNAGp1h=Ybc4ycgq
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Joerg,

On Fri, 26 Aug 2011 13:49:37 +0200 Joerg Roedel <joro@8bytes.org> wrote:
>
> I would like to ask if you can include the iommu-tree into linux-next
> for broader testing? The tree can be pulled from
>=20
> 	git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
>=20
> The tree currently contains iommu changes for dma-debug and omap-iommu.
> It will also contain changes to x86 iommu code in the near future.

I will add this from Monday unless there are objections.

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

--Signature=_Mon__29_Aug_2011_02_06_50_+1000_iNAGp1h=Ybc4ycgq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJOWmeaAAoJEDMEi1NhKgbsYU0IAI0DvYPta9ytvmlKCByWOiwt
uetDO0JTNY56ZBvWC2+vZ4m8FJiUkChUoCQHzBM3yj6HEIZSpcp7KYFtjeytxhLf
xCsdBVXJdkvoN3tRYC8NH+3K3Tc674+b+ZXfsypP9Omq+xcnntWKn7sre0Kd2YoC
gfqyg2pSyfnOu8/rz4k9qw+CVqwoe8P+hIMG5TwHd3faRB+HofqZaYGESpnd+Y7h
8UgLuuGEVGCuw6Zr2oEw2q5+4+rqYRsePpV4B3FXMj1c+QncV3+RGmNyuVvUHQoK
exE1SuTBZocIDTXvgK10eN4pLy+zfWofF//nhc4iDBvif+DW5PG7rrTc1Dv/JWc=
=PIPv
-----END PGP SIGNATURE-----

--Signature=_Mon__29_Aug_2011_02_06_50_+1000_iNAGp1h=Ybc4ycgq--
