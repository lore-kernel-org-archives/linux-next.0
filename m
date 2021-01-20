Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8994DC433E0
	for <linux-next@archiver.kernel.org>; Wed, 20 Jan 2021 20:46:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 286262360D
	for <linux-next@archiver.kernel.org>; Wed, 20 Jan 2021 20:46:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732157AbhATUqM (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 20 Jan 2021 15:46:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731842AbhATUpa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Jan 2021 15:45:30 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF33C061575;
        Wed, 20 Jan 2021 12:44:47 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DLcvs1wjsz9sVF;
        Thu, 21 Jan 2021 07:44:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611175483;
        bh=ju3rZsVNCTgrT7CBLz+kAXKmHwHT8KYchY86eAjbLbQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=M18N5clZggL+3TJwjKiLDdHWQcdrY1QA10NYGgokWuHgsQmFMVY9rDscfn5QnNcF2
         OFIEdUPNT/8upH7/LiXJnrc2POSKygVkV5HILuGHiaUhGY20ReLlhdWFXKTbNIvMds
         EKx5+Bk48vfwPehRbazr2V+C8UONoh+dB5H9Ei1NFh8ZWVg8xFpMEaLOxuuwNbT4hq
         k2fDJb1z6tGY6Y+TMN/Za3cHfPvfbLaEt9Er/cZoU8251Ta1vrWN2goQRRSbKx+CD1
         2OtAtBFDTrVpEPcNwCWx5pHv8+km9JhjTY1V8PsCCSIeEfpY+DjjrE/YOr1c7TN6tI
         lDsR9Ly9dfFPQ==
Date:   Thu, 21 Jan 2021 07:44:39 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Dave Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Dave Airlie <airlied@linux.ie>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20210121074439.13665ff5@canb.auug.org.au>
In-Reply-To: <CAKMK7uEtpi+20rEp4zg5P+d=qS7XcPi0VCp2OdHirX_Fm9TX7A@mail.gmail.com>
References: <20210108115518.2b3fdf58@canb.auug.org.au>
        <20210108122540.657501b2@canb.auug.org.au>
        <20210111105654.17e3aa76@canb.auug.org.au>
        <20210118115924.6ee14fd3@canb.auug.org.au>
        <CAPM=9tz7bEZewNwg_96Jj+oyBk3=c7hZ4aFbSKdMAsewJpfXHw@mail.gmail.com>
        <CAKMK7uEtpi+20rEp4zg5P+d=qS7XcPi0VCp2OdHirX_Fm9TX7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lr.x9ni75lgA0hRiVgbSip_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/lr.x9ni75lgA0hRiVgbSip_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, 20 Jan 2021 13:12:21 +0100 Daniel Vetter <daniel.vetter@ffwll.ch> w=
rote:
>
> I've pulled drm-misc-next into drm-next now, so as long as all other
> drm trees are merged after drm, this should be solved now.
> drm-intel-next also has their msm build breakage fixed (I acked the
> patch already), so hopefully we should be all clean again.

Thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/lr.x9ni75lgA0hRiVgbSip_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAIljcACgkQAVBC80lX
0Gy3XAf/e3MkYTmvxoBOWXWpMg6Xe9fR3z52Ci+cawkcsAkaDq9oHTUEVJKThGXR
veU3SMNdPubFR2WZbto51kBlUu0WFl5odMTMvU2oTct4iRkwn7HRWGdV0xaUVCm/
t/t72Pr9K66bKqF4QkWeQQjACOHA3iDEcKMT9ldpjdrBZEWmtosD17kBTrD5V/yb
w+NsLFvV0AC4iiiOLRutHbeFI0wiasFdS/OAOGhMeRQON8K3dXLElS6muRrGyacP
rHMJ0RVQ5welr5wDaMeZVQv7eDHlj2dKmMTrfGlzGhWJxnswtPPf5sKPGkmD0Lpk
iNTSwzCfRkvOkmW/z1vllJKDXg30Dg==
=Fy0m
-----END PGP SIGNATURE-----

--Sig_/lr.x9ni75lgA0hRiVgbSip_--
