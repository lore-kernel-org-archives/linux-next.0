Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A417EC433B4
	for <linux-next@archiver.kernel.org>; Wed, 14 Apr 2021 13:51:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 849256109D
	for <linux-next@archiver.kernel.org>; Wed, 14 Apr 2021 13:51:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349137AbhDNNwG (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 14 Apr 2021 09:52:06 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:52161 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351702AbhDNNwA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Apr 2021 09:52:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FL3mG2lZMz9sX5;
        Wed, 14 Apr 2021 23:51:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1618408286;
        bh=0ZHHhWHIWZ3sCbWllT/QqDes1z9nCDYXTSwDbroDug0=;
        h=Date:From:To:Cc:Subject:From;
        b=AdTKeTifOhH12mtMIFYRQnemQ6jf0L5qUPLj6Kt20HQ7HIL9fzOZv7kTc4f8YbQ7I
         0lYBovbB90Hre8GRyovABbkyZc3xS33d0EBFjC5Qz8kWbla3a9/j6IRE0itR87vpaa
         QAviHaYmafXHKPMqGnQR6z+zUmlNooY9Y9IwD2BqIvhz46Fbsp8L2oXRVLGj7CkKyI
         Sc5U4paviDDExzjcHy7Bd+DmOvQFMTv6h8LABBsRrw6oUV16wdfwEp/dyjJ6gH7VQp
         +As4N7kylslFSrETbFqjboBTGR9ZhpRJXW5w7R4w/PZ6nE2aRv3D7IFtuKtMwCUS1u
         G8rnAN9WaxUaA==
Date:   Wed, 14 Apr 2021 23:51:23 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Message-ID: <20210414235123.4ebcd479@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/J0lqY1GHuTJe9E7Z8SfkbPZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/J0lqY1GHuTJe9E7Z8SfkbPZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  ff57cfaa3d68 ("platform/x86: pmc_atom: Match all Beckhoff Automation bayt=
rail boards with critclk_systems DMI table")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/J0lqY1GHuTJe9E7Z8SfkbPZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmB281sACgkQAVBC80lX
0GzCcgf9E/42ltlfr3LxUfO1LBojjC3c+69V+7zG+tRvIS2/gZwt2rYIIrcS5aS3
cwDPXy3zRRzmEki00qOcBqpnFaixhTps5GcOYQlRRyCPC1LXusOFC7vrljjNuCRM
yY+I6eVNDVWbGhesL7gS1YZjIwXrLb70SpXvVdpHLZ7CLTud5Scxipmv4kHT/19r
j9mb4TmT5DsPzoaUVPHwEHCuAjMkysGcMQggr9TvtAffwngWEDZb9sAV6OlYy/dx
pOLbnnHzjVUTjXgm6XkIdj0eYwZgBNVNOSQeOwJdghr2/r1g3mqnAPVD31p/sAA2
Koi9kX5laYaaO3pYu215LrcDIcxGqg==
=34t8
-----END PGP SIGNATURE-----

--Sig_/J0lqY1GHuTJe9E7Z8SfkbPZ--
