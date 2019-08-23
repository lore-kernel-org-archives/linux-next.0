Return-Path: <SRS0=xYS8=WT=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4696BC3A5A2
	for <linux-next@archiver.kernel.org>; Fri, 23 Aug 2019 07:17:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A888233A0
	for <linux-next@archiver.kernel.org>; Fri, 23 Aug 2019 07:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566544633;
	bh=d596sk0Jpk6mfr0akeIpwu6Rx3hWKgtjzF+sLkJoOvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Hc8Q3fXZX5/Wd9QtxFvutcSwXdjfwLdMV29I2sv48PT4LVPibn7bi8DqrAhB1tsyJ
	 v8Khn407OI0DXj0S0BQ/kX1MMsi31cceyQuOMsictlHD3dw1yI1sFc97vC1buZKYNV
	 JJdHOMOF3M0i26xvYfwKgdUtHcO/xG4En/pNRWYY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbfHWHRM (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 23 Aug 2019 03:17:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:56608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730411AbfHWHRM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 23 Aug 2019 03:17:12 -0400
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3264721019;
        Fri, 23 Aug 2019 07:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566544631;
        bh=d596sk0Jpk6mfr0akeIpwu6Rx3hWKgtjzF+sLkJoOvI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GFbETB0eezRIZmVInbxn3khOOBCLEQ6bplBSqWmPAcCgJtaxeajqo2nW577UAmBmn
         gT2S2syGWp4+6w1nL2GXwiGGCLITbEtYCntEmkdvMQBiM/fRkgauNvRctp58tgc+Ho
         ozZXUuuixPmRfjtCPLgLvYP/FNMXCc7ZcfqX3QUY=
Date:   Fri, 23 Aug 2019 09:17:09 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Chen-Yu Tsai <wens@csie.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the sunxi tree
Message-ID: <20190823071709.j55td5ovdslfjdwn@flea>
References: <20190823073545.647ec7d1@canb.auug.org.au>
 <CAGb2v65oj=o_0O=BZMUcADycrunKuSpvSmA1=Ey2UZWPV7H=uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5dhd2bxvu7ppvqax"
Content-Disposition: inline
In-Reply-To: <CAGb2v65oj=o_0O=BZMUcADycrunKuSpvSmA1=Ey2UZWPV7H=uQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--5dhd2bxvu7ppvqax
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

65;5603;1c
On Fri, Aug 23, 2019 at 10:54:44AM +0800, Chen-Yu Tsai wrote:
> On Fri, Aug 23, 2019 at 5:36 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Commit
> >
> >   c60e09f77c83 ("ARM: dts: sun8i: a83t: Enable HDMI output on Cubietruck Plus")
> >
> > is missing a Signed-off-by from its committer.
>
> Looks like Maxime rebased something and missed adding his SoB.

INdeed, I've fixed it. Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--5dhd2bxvu7ppvqax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV+S9QAKCRDj7w1vZxhR
xfQ1AQD4273PO0/h2SVJDc9bgLmqxKjfKJCUcKtbbp8Up+RI2QEA2qlXi4a+1fTm
LIiAZRWJqMGxe2/dT746U1Ig/Y8upAU=
=4c28
-----END PGP SIGNATURE-----

--5dhd2bxvu7ppvqax--
