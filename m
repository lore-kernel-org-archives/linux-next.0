Return-Path: <SRS0=bGaF=UH=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F4AC2BCA1
	for <linux-next@archiver.kernel.org>; Sat,  8 Jun 2019 01:09:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C42D212F5
	for <linux-next@archiver.kernel.org>; Sat,  8 Jun 2019 01:09:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="m2QJYGMf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729127AbfFHBJY (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 7 Jun 2019 21:09:24 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33301 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728441AbfFHBJY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 7 Jun 2019 21:09:24 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 45LLrw0phRz9s00;
        Sat,  8 Jun 2019 11:09:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1559956160;
        bh=U+kKWU7979iQFDRGedVOP7tC7v0+TEiHZvkL4ctnLHE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m2QJYGMfvLy4XOgvL6j7BPoox1IWPzxrmLp1elvaKO+CO2o5ZAYzRVT1P1MXaPmFj
         Pj0/pd9/WCUMpXwsqNtCfZ433ia2b8BQGTEC9Q/JL/gxyy02dbZ4XYC06/TuOaZvwi
         ZE8jEoPPzZ6JyfCxxLRVSfIguodQh7CLZ0nZ2hYI1oJVmJ2/b7Op6lcC03zbt0PpXc
         duWJa5TPYs+1eP2kyWFaizpL2OmDArhO2zVhhR7+1ixtVF5OWIJrM6cpO0WbnkOcW+
         iq2PWQdbbOmeYDZogbwhNoairQCi+YBV4RoDTe4kJKPpE6RKBX5z7JYPMV+vOmtvcd
         WpHaLd3OX3vjQ==
Date:   Sat, 8 Jun 2019 11:09:11 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>
Cc:     khilman@baylibre.com, bjorn.andersson@linaro.org,
        linux-next@vger.kernel.org
Subject: Re: Change of repo location for QCOM
Message-ID: <20190608110911.7e063621@canb.auug.org.au>
In-Reply-To: <20190607195203.GB4984@hector.attlocal.net>
References: <20190607195203.GB4984@hector.attlocal.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VmqTBPFny9Y.PyVfSWYcqdy"; protocol="application/pgp-signature"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/VmqTBPFny9Y.PyVfSWYcqdy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Fri, 7 Jun 2019 14:52:03 -0500 Andy Gross <agross@kernel.org> wrote:
>
> We've updated the location of our for-next and ci-next branches.  Can you
> update the repo from:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/agross/linux.git
>=20
> to:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git

Done.

--=20
Cheers,
Stephen Rothwell

--Sig_/VmqTBPFny9Y.PyVfSWYcqdy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlz7CrcACgkQAVBC80lX
0Gyxuwf8CruyBQxX9MGoBH0hyYWAVzxyfllf6q0JHuhMjM0KtZ6a9ZR38DTTuLzm
GyF2CSUySTEC8JJjTE+pe81Du298WbrcJS5wUt2iJFgszNGQ8TMFagxrMOl/pedh
PC4UsdydtyK/IiMsBjwvPUjZWUAnAy2j6Od1P/mYQvoJB7FtcYKDN9n4tQiAPdP1
ORPw+NlazD7hFYYCBo90Pcw0f/F96nC05Oi/qHDMlZ0mYxLCCjRP3Yef5Q7oHhQU
sOqZh+S++jqxY0zdgFK9K+R/Y7OgBmBP9bctShRbWbvxHw4aoUS5MG6ZTTfsuXBO
D2ubKZHZH/IcixEpegLJ2YEhX8Za3w==
=aWA2
-----END PGP SIGNATURE-----

--Sig_/VmqTBPFny9Y.PyVfSWYcqdy--
