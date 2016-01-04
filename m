From: Mark Brown <broonie@kernel.org>
Subject: Re: Widespread boot failures on ARM due to "mm/page_alloc.c:
 calculate zone_start_pfn at zone_spanned_pages_in_node()"
Date: Mon, 4 Jan 2016 23:55:12 +0000
Message-ID: <20160104235512.GW16023@sirena.org.uk>
References: <20160104224233.GU16023@sirena.org.uk>
 <20160104150946.373ed02b8e8b81221340b7c8@linux-foundation.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ddJi1IsAv4W/kcDl"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:36043 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753922AbcADXze (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2016 18:55:34 -0500
Content-Disposition: inline
In-Reply-To: <20160104150946.373ed02b8e8b81221340b7c8@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Taku Izumi <izumi.taku@jp.fujitsu.com>, Tony Luck <tony.luck@intel.com>, Mel Gorman <mel@csn.ul.ie>, Xishi Qiu <qiuxishi@huawei.com>, Dave Hansen <dave.hansen@intel.com>, Matt Fleming <matt@codeblueprint.co.uk>, Kamezawa Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>, kernel-build-reports@lists.linaro.org, linux-next@vger.kernel.org, Kevin.Hilman@linaro.org, Tyler.Baker@linaro.org, linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>


--ddJi1IsAv4W/kcDl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 04, 2016 at 03:09:46PM -0800, Andrew Morton wrote:
> On Mon, 4 Jan 2016 22:42:33 +0000 Mark Brown <broonie@kernel.org> wrote:

> > platforms in the kernelci.org boot tests[1].  Doing bisections with
> > Arndale and BeagleBone Black identifies 904769ac82ebf (mm/page_alloc.c:
> > calculate zone_start_pfn at zone_spanned_pages_in_node()) from the akpm
> > tree as the first broken commit[2,3].  An example bootlog from the
> > failure is:

> Thanks.  That patch has rather a blooper if
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=n.  Is that the case in your testing?

Seems to be what's making a difference from a quick run through, yes.

--ddJi1IsAv4W/kcDl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWiwZgAAoJECTWi3JdVIfQcPMH/1ZbrklFsjhfNFu9Mgxow+29
mAK3Oht5efnf4Qoz5nVWeMs8xbdEeAF7rVtxV6I6W9BrcpRDTHKOJ5rduQimdoxk
+P/JUw4OAFqBMsB95OXaj6UzXQcdIET7bmIX29plVdNwJLAnRMAdCSGWKiZ9Kam2
SZ7SXsjVHJEKxv8DHNnDSNKejYpXT8A+cXmYKT7WTCcB/TLGbvjBAL9fChOXXx1G
YgwdXpnWTsP3Df9Mt/hM2fDXxNWNjpj+y5Uuf1KVAgs0M5Swfdt1tsA3EuhDbIMt
mW/Dt7BPOeoQjRri1Luneu7WaYhmfU4G1A40w9XMZ3hjgAOfMuq3NxreA/h/d4M=
=OPdi
-----END PGP SIGNATURE-----

--ddJi1IsAv4W/kcDl--
