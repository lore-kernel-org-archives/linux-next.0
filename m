From: Mark Brown <broonie@kernel.org>
Subject: Re: Widespread boot failures on ARM due to "mm/page_alloc.c:
 calculate zone_start_pfn at zone_spanned_pages_in_node()"
Date: Tue, 5 Jan 2016 11:45:49 +0000
Message-ID: <20160105114549.GX16023@sirena.org.uk>
References: <20160104224233.GU16023@sirena.org.uk>
 <20160104150946.373ed02b8e8b81221340b7c8@linux-foundation.org>
 <20160104235512.GW16023@sirena.org.uk>
 <20160104163528.be56a4b1.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MikxO53xlyBvwArL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:36587 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752170AbcAELq0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Jan 2016 06:46:26 -0500
Content-Disposition: inline
In-Reply-To: <20160104163528.be56a4b1.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Taku Izumi <izumi.taku@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>, Mel Gorman <mel@csn.ul.ie>, Xishi Qiu <qiuxishi@huawei.com>, Dave Hansen <dave.hansen@intel.com>, Matt Fleming <matt@codeblueprint.co.uk>, Kamezawa Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, Kevin.Hilman@linaro.org, Tyler.Baker@linaro.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Stephen Rothwell <sfr@canb.auug.org.au>


--MikxO53xlyBvwArL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 04, 2016 at 04:35:28PM -0800, Andrew Morton wrote:
> On Mon, 4 Jan 2016 23:55:12 +0000 Mark Brown <broonie@kernel.org> wrote:
> > On Mon, Jan 04, 2016 at 03:09:46PM -0800, Andrew Morton wrote:

> > > Thanks.  That patch has rather a blooper if
> > > CONFIG_HAVE_MEMBLOCK_NODE_MAP=n.  Is that the case in your testing?

> > Seems to be what's making a difference from a quick run through, yes.

> OK, thanks.

Seems like I was mistaken here somehow or there's some other problem -
I've kicked off another bisect for today's -next:

   https://ci.linaro.org/view/people/job/tbaker-boot-bisect-bot/137/console

and will follow up with any results.

--MikxO53xlyBvwArL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWi6zsAAoJECTWi3JdVIfQrzMH/05q7M8dZRq3TD+Ks6Xj8zQb
Lyu6by5xqxZYXQnrwlemK87iOoD8RjmhNOI5jPev7vd6RWiP3XEK/QXxzKBwcgYe
gt3tCA7PmkjBt4MSaAbUW06EvkP3pzUnqZd1V7+Q/HVmyZznrmXbQCoOBuNLiRk3
xObf0iKqGl96VngnOUNuftHepS04gCgh8cDmhjJM55zldX0i+cAhxbVS1xnU71GO
/rATdzFXWDlIIIJ0iOor8rcnU+oNyPEBlp75VBSQebvK+0zS73GfYH9kdhmV5EMT
zOcktkfCFn6qSwMpWAZCc2++kI1XvG0UvBqA6HlDVhn7hLeYw2RFsASGfjOcv1M=
=SuMs
-----END PGP SIGNATURE-----

--MikxO53xlyBvwArL--
