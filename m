Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285ECC433B4
	for <linux-next@archiver.kernel.org>; Fri, 16 Apr 2021 04:08:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4F856121E
	for <linux-next@archiver.kernel.org>; Fri, 16 Apr 2021 04:08:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhDPEJR (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Fri, 16 Apr 2021 00:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbhDPEJR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Apr 2021 00:09:17 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE716C061574;
        Thu, 15 Apr 2021 21:08:52 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FM2l51dMQz9sVv;
        Fri, 16 Apr 2021 14:08:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618546129;
        bh=LzX6QQLQc8CQHgRYWvVv11qjsr5ClNvJpZxmq+uydjo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gfYYuOZvQk4GDQFMvzyXIEYVKm5yWq88lFyRyKqym/Ki90zQdDANOFuUN3Jeq6VZ5
         3IHibWyCbzVAaLtG4wFYzhpp6ykTK1ampNGljUSBXpJ+XiWsxRl4ZmBhbCeXonqb+i
         rimrl7rL+zSKMtMliH4VjH52ywYdvb1Pi+oWkiv+f8a9AvX+vS1dMF+g9zUVaHG3TQ
         B/0iGWrz4pCSZ3FWCzspOWxONr40MEdlJrb2hu4UPgXoCtk5OR/afr/eWyCxboVtvG
         n2p7xyICqeYd9qIwUdTSa6A6bZUVs0SGcpvT1Lhajvx7m0Tmzie2/c6kQX/984mtnZ
         bpc/8dRSRLsgQ==
Date:   Fri, 16 Apr 2021 14:08:48 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Liang, Prike" <Prike.Liang@amd.com>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210416140848.6f458345@canb.auug.org.au>
In-Reply-To: <BYAPR12MB323890BEC6212E401D10545EFB4C9@BYAPR12MB3238.namprd12.prod.outlook.com>
References: <20210416124044.53d4beee@canb.auug.org.au>
        <BYAPR12MB323890BEC6212E401D10545EFB4C9@BYAPR12MB3238.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S6PIT6/iCI7c5JePTqua5jZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/S6PIT6/iCI7c5JePTqua5jZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 16 Apr 2021 03:12:12 +0000 "Liang, Prike" <Prike.Liang@amd.com> wro=
te:
>=20
> Hi, Rothwell

(Stephen, actually :-))

> This fix solution hasn't locked down and still being discussed and roll-u=
pdated in the NVMe mail group.
> Will update the patch once it refined done.

In which case, this patch should not be in linux-next (or any branch
that is included by linux-next).

--=20
Cheers,
Stephen Rothwell

--Sig_/S6PIT6/iCI7c5JePTqua5jZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB5DdAACgkQAVBC80lX
0GzhHQgAiagyfwLl5VT/1Mw64G3vzUoRqG/zBS27GO99VFasxRHUg4+FothEp8gp
SV04kQz6eWlKTkqWbfBxLzNugVFj5Mw/lsj82FueBDDQd9Fi6PQKPI1Sl8GgzLY1
BMtmZYB+5ydpUteQoIF4rjtf6e9S1TFkcAUzqMhRyDA/0mou5qCAse7eT4bjmB3N
j/BfceG15mEAK+m7MrV/ell7SQGQjBTUXajuBy8JrdaH28+oLRFHJ+Cz/vG2J/tq
XDuqm+TJ5wMLp8iu+Bd3twE313y3V1ret0mQ5ligPm1Qqt6joHBLl2rAu9U11L5U
hsEMfHe7Y/42v94l9Sok8vCEkpJ+MA==
=krHA
-----END PGP SIGNATURE-----

--Sig_/S6PIT6/iCI7c5JePTqua5jZ--
