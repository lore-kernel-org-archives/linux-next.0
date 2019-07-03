Return-Path: <SRS0=JrHm=VA=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF005C5B578
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 21:33:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 986CE21882
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 21:33:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BvceXGMm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727371AbfGCVd4 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 3 Jul 2019 17:33:56 -0400
Received: from ozlabs.org ([203.11.71.1]:51225 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726656AbfGCVdz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jul 2019 17:33:55 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 45fDrJ03Pnz9s8m;
        Thu,  4 Jul 2019 07:33:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1562189632;
        bh=Os+jzgQMICZR69IdtZ2LPrWGr3wL6t8dfhpo9PW9CTc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BvceXGMmlD2pgIGNG4nRkkfwbZOsnSGFutgb9K7qpsyEMTPB+3lIDosiN7RYgY+6D
         P7OD5zI76p5WSsPw6OB/AKHY2QrJU7vzHtRsvz/Z42ZznveL6e1r3id+GYPtQih/qY
         kZqHCBDlUJqF2iE6Jkt8MEI+GzYmJX9Bvg+CuQBx0L+BPw4ggURceiRfx2Fg1jRCh3
         RwLod3wU3Eey0ZiFBf0Cj4fi7HemDArKarPKAUKrkVN1Ny/nFVAJQFnCKkTA5ncOUF
         McZOsnicRdX4IwPaMR/kCLxAVzSz6Fs5xJROthl7FeZE3KR2d1RbhmQ0KZgcMBOi+P
         Z5cdAmX544oTA==
Date:   Thu, 4 Jul 2019 07:33:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Kuehling, Felix" <Felix.Kuehling@amd.com>
Cc:     Jason Gunthorpe <jgg@mellanox.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "Yang, Philip" <Philip.Yang@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Message-ID: <20190704073350.1776b317@canb.auug.org.au>
In-Reply-To: <a9764210-9401-471b-96a7-b93606008d07@amd.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
        <20190703141001.GH18688@mellanox.com>
        <a9764210-9401-471b-96a7-b93606008d07@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_//OkC/dWzQJ./2kmAlmbmsCZ"; protocol="application/pgp-signature"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_//OkC/dWzQJ./2kmAlmbmsCZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Felix,

On Wed, 3 Jul 2019 21:03:32 +0000 "Kuehling, Felix" <Felix.Kuehling@amd.com=
> wrote:
>
> It looks like Stephen already applied my patch as a conflict resolution=20
> on linux-next, though. I see linux-next/master is getting updated=20
> non-fast-forward. So is the idea that its history will updated again=20
> with the final resolution on drm-next or drm-fixes?

linux-next gets rebased every day (that is its nature).  Do not worry
about that, I will cope with whatever you do.

--=20
Cheers,
Stephen Rothwell

--Sig_//OkC/dWzQJ./2kmAlmbmsCZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0dHz4ACgkQAVBC80lX
0Gxxdgf9E2csugoLApYbShqrhYZvNZV6CSi5bk64nkcRGjGhYrf/iOJKJFYLu8ef
N2UJofT51bVSvo5N4jHHXznLj5BYaPfpk7ZnOWBrcT96QFZQJ3pUVGwwcBU9Vfvi
MjxDEhNsbKvG987UnTXy4M3s9ZQ3h+YDrWv4gHZACBoTXFHJtpQWzlq7KuI2qVei
YPVWtEA18ygX1C6yAkKcaqeI4BW+43xio9ZLvCy86DFouyF0+cLkJAi+oe2eysX+
RKsrOjnEIdKlq1xKV0OGuT6ovuEHqUBj1vm6AFUZQ0XoUATrvSt7xtWYvETG1seN
RQ51nmJ3eG1uft0nzra48IztE1E6lw==
=QFow
-----END PGP SIGNATURE-----

--Sig_//OkC/dWzQJ./2kmAlmbmsCZ--
