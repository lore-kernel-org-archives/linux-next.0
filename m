From: Mark Brown <broonie@kernel.org>
Subject: Re: Widespread boot failures on ARM due to "mm/page_alloc.c:
 calculate zone_start_pfn at zone_spanned_pages_in_node()"
Date: Tue, 5 Jan 2016 19:24:04 +0000
Message-ID: <20160105192404.GS6588@sirena.org.uk>
References: <20160104224233.GU16023@sirena.org.uk>
 <20160104150946.373ed02b8e8b81221340b7c8@linux-foundation.org>
 <20160104235512.GW16023@sirena.org.uk>
 <20160104163528.be56a4b1.akpm@linux-foundation.org>
 <20160105114549.GX16023@sirena.org.uk>
 <568BB55F.2020709@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xe2geHXJg22At20M"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:37226 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751704AbcAETYi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Jan 2016 14:24:38 -0500
Content-Disposition: inline
In-Reply-To: <568BB55F.2020709@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>, Tony Luck <tony.luck@intel.com>, Russell King <linux@arm.linux.org.uk>, kernel-build-reports@lists.linaro.org, Mel Gorman <mel@csn.ul.ie>, Tyler.Baker@linaro.org, Dave Hansen <dave.hansen@intel.com>, Kevin.Hilman@linaro.org, linux-next@vger.kernel.org, Kamezawa Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, Xishi Qiu <qiuxishi@huawei.com>, Taku Izumi <izumi.taku@jp.fujitsu.com>, Matt Fleming <matt@codeblueprint.co.uk>


--xe2geHXJg22At20M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 05, 2016 at 12:21:51PM +0000, Sudeep Holla wrote:
> On 05/01/16 11:45, Mark Brown wrote:
> >On Mon, Jan 04, 2016 at 04:35:28PM -0800, Andrew Morton wrote:
> >>On Mon, 4 Jan 2016 23:55:12 +0000 Mark Brown <broonie@kernel.org> wrote:
> >>>On Mon, Jan 04, 2016 at 03:09:46PM -0800, Andrew Morton wrote:

> >>>>Thanks.  That patch has rather a blooper if
> >>>>CONFIG_HAVE_MEMBLOCK_NODE_MAP=n.  Is that the case in your testing?

> >>>Seems to be what's making a difference from a quick run through, yes.

> >>OK, thanks.

> >Seems like I was mistaken here somehow or there's some other problem -
> >I've kicked off another bisect for today's -next:

> >    https://ci.linaro.org/view/people/job/tbaker-boot-bisect-bot/137/console

> >and will follow up with any results.

> With both patches applied(one already in today's -next), I am able to
> boot on ARM64 platform but I get huge load(for each pfn) of below warning:

Bisect on today's -next with Arndale (an ARM platform) flags the same
patch:

  https://ci.linaro.org/view/people/job/tbaker-boot-bisect-bot/137/console

as does Juno which is an arm64 platform:

  https://ci.linaro.org/view/people/job/tbaker-boot-bisect-bot/138/console

(it does get to a console but with lots of the backtraces Sudeep
indicated).

--xe2geHXJg22At20M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWjBhTAAoJECTWi3JdVIfQDAcH/2/sZH/w6NYKjQKHRNJIY0c4
3PBxKd/gDgRz53Su+F5eKrYoQtCR5xaLvBkmaZMLAfBPqXMl71mnHwwfNqgPjD18
zr/Q7NWOWdwbZQp2yF4FgtdpUXaeX2gA1qw+R4x6SxvfktHqN2/KI+Ze6+rK1Rlq
TB4DgeBB5CHDeUgLFcnGEJRInxyJaxu70CY8CH1d+wT+15ZGCnlzxyDp4DA8ohOz
xQdMQcQZ//JNmsJfsqPU4kqMGhliakpaBXuuT3lzdI+jLyrSqbm+sX3hElne9rzu
n4LQ5dTYsi2f5J8n7IEzmBFrDpEThUvIHYgvyvcAA38zku4Ji+oMvSDqNt5o6+w=
=LKUN
-----END PGP SIGNATURE-----

--xe2geHXJg22At20M--
