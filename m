Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C23C63777
	for <linux-next@archiver.kernel.org>; Mon, 30 Nov 2020 18:00:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D526206E3
	for <linux-next@archiver.kernel.org>; Mon, 30 Nov 2020 18:00:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnHbG1Z0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729353AbgK3SAr (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 30 Nov 2020 13:00:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:51248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728724AbgK3SAq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 13:00:46 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6E8F206E3;
        Mon, 30 Nov 2020 18:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606759206;
        bh=J0AvqkAMAAVDLj/yz/VGpmBN4b8ppf8eyoYZVFmOL1g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QnHbG1Z0laDt7GYEWQy6kll++E+FMto2i6z/qpuO0vg3al59s3wZy2jR3j869Icy5
         i2iRBedAm12rjFAYJSkRkyp9fjlyIeSki0cMULWMF2e2JDdSAoMUwk9CKv/SIXhfKb
         x9hqN1SsEzVftV8S01iBuUs3AspxsaRn4UbUnAZs=
Date:   Mon, 30 Nov 2020 17:59:37 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jack Yu <jack.yu@realtek.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the regmap tree
Message-ID: <20201130175937.GA37431@sirena.org.uk>
References: <20201127182411.07c15471@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
In-Reply-To: <20201127182411.07c15471@canb.auug.org.au>
X-Cookie: Danger: do not shake.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2020 at 06:24:11PM +1100, Stephen Rothwell wrote:
> Caused by commit
>=20
>   6f4a038b9967 ("ASoC/SoundWire: rt715-sdca: First version of rt715 sdw s=
dca codec driver")
>=20
> I have reverted that commit for today.

I'll drop this, hopefully it can be re-added in future.

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/FMwgACgkQJNaLcl1U
h9APCwf+IHRatuJiMO7Wp0izrrQJQ5tO00M9etGev3ONEIJBf5d9MpAoWM6diG4p
NSYXEZUIVe3eI3BaQmtTLYdQFKYZoni73QB0BvZwTGCchDpMtvVJpDndZq8TNv2h
XZuyUIaPkEvTWYHgvFckoTCK/5kyPA5svNBhmRWMic57LIDZS0J4gtDMUe6osbw3
UbdU67W+8rxx7F1219locflUk8fiWeKbUNLQimrcDv1hCaRtXSfgTut6j2gF0EvH
02Ac1+8wtM9WMVtR8DCjnzTICYJ3EBt7MaLtBozZaITFJiDYaCJ4/dVzzKWp14lD
SOQCP1tUpXJCr/tXCmcL0VulgCSnLg==
=jOtQ
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
