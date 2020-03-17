Return-Path: <SRS0=rZYM=5C=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B035C2BB1D
	for <linux-next@archiver.kernel.org>; Tue, 17 Mar 2020 21:44:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E288820724
	for <linux-next@archiver.kernel.org>; Tue, 17 Mar 2020 21:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FjjHUtkJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgCQVog (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 17 Mar 2020 17:44:36 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:46252 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbgCQVof (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Mar 2020 17:44:35 -0400
Received: by mail-pg1-f177.google.com with SMTP id y30so12427063pga.13
        for <linux-next@vger.kernel.org>; Tue, 17 Mar 2020 14:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=89otpOHrqk65HILXOK8dtO4Tm8VdMpFbokIxr7Ul0QE=;
        b=FjjHUtkJheETmfhQrBxIxdeDgTh5g3mNgUDR8CMgqBg5NSygh4l0kpfSMQfPvoWtqe
         yE/H+c/99PR4h+31OiUlQsZ2oj3MTjTrP7TAJbO+Asq6YLKt4GJw+EWDLbk/bGsDEZbo
         M4bMM4H87plQiFMH9GlwoSd85at5c9ZRwRYgW/c26sC/jq/Qxv8wrEFgf4qNXa0U3R9y
         AHMYrbaPeRdMDVh7IBxidWmu47tAv7VW2YY53zr0MC876S04M3ZE5o+TSDsLikY6t8kU
         xBCiBOLV9xQAFSCwTwFjPSZB2fofjtGbzEgzNfGLWLL60w7r+7c1tfbpoBjhuimL5/Y0
         3SIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=89otpOHrqk65HILXOK8dtO4Tm8VdMpFbokIxr7Ul0QE=;
        b=SSEOSaH4h7HivpngpjI75q0E8eg8TO30xjRg3MsVH+zlM4g2WFza9mm3HSkz82J8nr
         FRZR6DAEfvbwUccCeT9ksdLC0yIG4VsMUe0ACga/ZXoVxKzBznSUlLlK3S89XAKDJldw
         5hF9IYnDqnqIKUTFobIMtkcqnhdV2FEnwkUpiyNuZlfSl2jATVGnqvX4GPwLVOGCUcIy
         axRe5R8WbUznS2Ip4TtE168Hf5SkulPo9pl0TIZGEQ2goWTq3DFnwP7NUaFFuS0oLew/
         bGvOXqAYsYPnabL5fqrk1NotSJtx/wME7Uq4QL11D3qGMRSUV6HwCiy0fsTY1nEhzlSd
         CJDQ==
X-Gm-Message-State: ANhLgQ2jw0mb8qFjS19fZfSbVagTTdSGyVCFI+9Km4bDCQ8MQXI2Cwuj
        EQx82tX48D3sBFbMkrx9TRlW2w==
X-Google-Smtp-Source: ADFU+vtCttadpOSvgkvm0uTCHYh4bF3AqGgbUut40qc5YKbdk0olQXxLurvHS3X5RXp3U6GQWDyx+w==
X-Received: by 2002:a63:5324:: with SMTP id h36mr1231564pgb.414.1584481472660;
        Tue, 17 Mar 2020 14:44:32 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bc61:d85d:eb16:9036])
        by smtp.gmail.com with ESMTPSA id mg16sm317366pjb.12.2020.03.17.14.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 14:44:31 -0700 (PDT)
Date:   Tue, 17 Mar 2020 14:44:25 -0700
From:   Benson Leung <bleung@google.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the
 chrome-platform tree
Message-ID: <20200317214425.GA79639@google.com>
References: <20200318074536.3121af53@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <20200318074536.3121af53@canb.auug.org.au>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, Mar 18, 2020 at 07:45:36AM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   6314450ece4c ("platform/chrome: cros_usbpd_notify: Fix cros-usbpd-notif=
y notifier")
>=20
> is missing a Signed-off-by from its committer.
>=20

Thanks. This has been rectified. The for-next branch has been rebased
and all commits have the correct S-o-B.

Thanks,
Benson

> --=20
> Cheers,
> Stephen Rothwell



--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXnFEuQAKCRBzbaomhzOw
woDOAQDIs4TkP5CwMMgmdTuvIMv1Pzvm4NdqQgN6kbNhvJ2g7QEAsX+pDp0/atFF
gjg3eVUBfF/oY6pZ/uXf8/JBzUZQtAQ=
=LaX7
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
