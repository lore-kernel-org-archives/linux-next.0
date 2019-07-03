Return-Path: <SRS0=JrHm=VA=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4609C5B578
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 21:32:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7B1FA21882
	for <linux-next@archiver.kernel.org>; Wed,  3 Jul 2019 21:32:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="aB7R7tl9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbfGCVc0 (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 3 Jul 2019 17:32:26 -0400
Received: from ozlabs.org ([203.11.71.1]:57143 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726736AbfGCVc0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jul 2019 17:32:26 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 45fDpY6pyGz9s4V;
        Thu,  4 Jul 2019 07:32:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1562189543;
        bh=vcfEUN/OJ3FmHGsLAuzadqK55t4/uLDhFaOEhdyst7E=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aB7R7tl9cIWWDzrZOvEGwccHaqmKG7yk7h4eEkKNTOUnCjEK5L980pe9PmuU+9Wko
         Mu+kpBTpaBamhVHsRgeicTgZLyRxbKBUJMi7Fo4nKqHKMxcw76rx5UdZUnX36EN5Ss
         yErFzZZXXDAIiEi6PtvTWib03Cwz+AnnYS8dVu6IXYwtRnBVjijseJwJKcm1et5Utd
         OV2jP9CktQlEvDJvxWz4rp7DDJdQJ9wQnkB32T8AIXRVHw6iqIubYeR6gsjjpSdD9K
         F/KgB3PljSRgprGwdO/g0PpaCQ6phbyZRHjlO4CzSSKGwPWgrK/hG+uiPWsIjIEHHb
         eYvRxhB9abG2w==
Date:   Thu, 4 Jul 2019 07:32:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     "Kuehling, Felix" <Felix.Kuehling@amd.com>,
        Jason Gunthorpe <jgg@mellanox.com>,
        "Yang, Philip" <Philip.Yang@amd.com>,
        Dave Airlie <airlied@linux.ie>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Message-ID: <20190704073214.266a9c33@canb.auug.org.au>
In-Reply-To: <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
        <20190703141001.GH18688@mellanox.com>
        <a9764210-9401-471b-96a7-b93606008d07@amd.com>
        <CADnq5_M0GREGG73wiu3eb=E+G2iTRmjXELh7m69BRJfVNEiHtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QCzYje/thezhTNHZAHbS5n."; protocol="application/pgp-signature"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QCzYje/thezhTNHZAHbS5n.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Wed, 3 Jul 2019 17:09:16 -0400 Alex Deucher <alexdeucher@gmail.com> wrot=
e:
>
> Go ahead and respin your patch as per the suggestion above.  then I
> can apply it I can either merge hmm into amd's drm-next or we can just
> provide the conflict fix patch whichever is easier.  Which hmm branch
> is for 5.3?
> https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/?h=3Dhmm

Please do not merge the hmm tree into yours - especially if the
conflict comes down to just a few lines.  Linus has addressed this in
the past.  There is a possibility that he may take some objection to
the hmm tree (for example) and then your tree (and consequently the drm
tree) would also not be mergeable.

Just supply Linus with a hint about the conflict resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/QCzYje/thezhTNHZAHbS5n.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl0dHt4ACgkQAVBC80lX
0GwOLwf/bLqfP05XRzAft1l6aLoPjQIG+JOwKAInxBLdWUC0kQXWzxw3AQWDl7WL
l/VowMzvzxqjHGFW5VN3kSrajP6gkSFW3yS0jK4e3Zihhw3x69anzN5VkyUiEByN
IiYHHCYnCCSxrPjAR6JWidX/upjA0+clsMdPC3JHWENnRKvTsixi6iDO/2rsEnUp
bJeXOdZXuX3cteMU7IuZHFpPDdmzJrIfz8uDQrr0AoptLamWXSTr6ep2G+oeTlhS
tBf+WCTf5TLtu5jElnEJIWLi+3UDmtFYj90xE8JHgnjS3Ks09JB4wovgIj/vyriV
TQALMjcIlQq1iRRyIYe+rd6y6V5R5Q==
=FgfH
-----END PGP SIGNATURE-----

--Sig_/QCzYje/thezhTNHZAHbS5n.--
