From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: linux-next: "amba: Remove AMBA level regulator support" commit.
Date: Fri, 13 Apr 2012 09:37:01 +0100
Message-ID: <20120413083700.GB3168@opensource.wolfsonmicro.com>
References: <20120413012230.GA30438@windriver.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="K8nIJk4ghYZn606h"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:49463 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754645Ab2DMIhb (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Fri, 13 Apr 2012 04:37:31 -0400
Content-Disposition: inline
In-Reply-To: <20120413012230.GA30438@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linus.walleij@linaro.org, linux-next@vger.kernel.org, shawn.guo@linaro.org, rmk+kernel@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org


--K8nIJk4ghYZn606h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 12, 2012 at 09:22:31PM -0400, Paul Gortmaker wrote:

> is pointed at by git bisect for the u8500_defconfig build failure:

> If, like my earlier mail this week, this is something you've already
> fixed, then please provide me a link, and I'll gladly include that in
> the triage report, so you don't get needless extra mails about it.

Not me, but Linus W has a patch.  No idea about a link off the top of my
head, google should turn something up I guess.  It's exactly the same
sort of implicit header dependency issue that your cleanups keep
triggering.

--K8nIJk4ghYZn606h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPh+WQAAoJEBus8iNuMP3dfUAP/2Nfled86mZW1HgnXKchxWvG
lQcCP7NKxcFTOa3E+aXoP/9UGwVgg0drvwdO1/llqI7hNtFK8+wgR1baUgx5tkmW
THVtJdEZuc3dOVREIVkpfVn8/fumSkyEj95Rsy1kMoeuwIlnhu53LR5iXs7SB9ZH
h+x1FPBNx0izuBvRpVEAYF299bPE3uhr9i9Ni4iNr1iILag+1OgYuivgmYPtbKOO
iR+yjUcoJE5e17o/Vi/v4EUWLi6LRuYzDeZyfKgtkrsqbW7AgCPcJMiWH1mrnx3k
q+qX+4Anms5ApYDK4m5p2CGylDUJ1tiPIqcgRgUWJelSQTWzq2fdw/8kbPMpSMee
CitW+11Q0wdtFGb5zAh+b9/aGWXwZVknZyNmhtuBUE9oZQaZAAkpfWWNywlovGVE
qKUEWiSyScHnUNnjAxrVqb+DyRGX6sGhoLajOeO2hy9l+wL8j1ZbnZ4O7uJqnPrJ
fi+Yk+7PBYUNPLnAv0QUbpW7Zo6Pf8dlwC42NNcb82MAvAjN5rCHhJ8D0Uza5HGx
ZjL6RkcZXI98J4oor+QObdr0NDs1ib6CHKmbTD13cD9jCAlNOVYpFm6k6UYSaZkb
AjO6g/kPg+JqrTirysgY2zJmUksHteZetxDN+5hVvi6hHX+TCsssSpTsGUqMMg3N
mo9GfWF1233Cw/e8kjS9
=7Aos
-----END PGP SIGNATURE-----

--K8nIJk4ghYZn606h--
