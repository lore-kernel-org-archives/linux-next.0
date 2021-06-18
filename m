Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9ECCC2B9F4
	for <linux-next@archiver.kernel.org>; Fri, 18 Jun 2021 02:42:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90DA2613BA
	for <linux-next@archiver.kernel.org>; Fri, 18 Jun 2021 02:42:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbhFRCoP (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 17 Jun 2021 22:44:15 -0400
Received: from ozlabs.org ([203.11.71.1]:49587 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229683AbhFRCoO (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 17 Jun 2021 22:44:14 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G5jqw1x60z9s5R;
        Fri, 18 Jun 2021 12:42:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623984124;
        bh=GgqDsKw0S+0cxozB49BeJV0Ozs/cAxEnN9s2flGBzEU=;
        h=Date:From:Cc:Subject:From;
        b=cFZbpv6CG229aIQmrx/+6uXtDR7cKmfAD1hFveRwbHkQw3mX4uD/U0x3nYL9ZPTfF
         yy1w3i2SFTynb6AcuRtE2Ng5YwMN6X6Hg6jrFjhmdigmpst/dQ9AuYwMnfGRPzL+BY
         WGn3Ytel9exQ0vvScPCceISSpogbLOvXTWe5lrwyeySMtIVXpodEdFL5SSGxVjDPTW
         EFvEzX6UPwfSMQ7Meky6gd6KG4/lxbOiC0Dko7cRBpG1nEYZMq71dfwsYA59iDfKos
         OsinimefQBkIHTz0nbp6eKRyNxLNJM65vR8M8AcPNH7cT9lC45h3g/SNLwVBs/pK1o
         S2rRY+RCZBeCQ==
Date:   Fri, 18 Jun 2021 12:42:03 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the drm-msm tree
Message-ID: <20210618124203.14b57bef@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GprlEwAh4SNpIjpgvvJro/i";
 protocol="application/pgp-signature"; micalg=pgp-sha256
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/GprlEwAh4SNpIjpgvvJro/i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the etnaviv tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!

I don't know which commit in the drm-msm tree caused the failure, but
it is probably in the range 558d4272b60f..7e0230fd096c.

I have used the drm-msm tree from next-20210617 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/GprlEwAh4SNpIjpgvvJro/i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDMB/sACgkQAVBC80lX
0Gwyfgf/aOp9GrLYmjYs6FbVNvNWEgWWFwlmIDvAH8hcT9dA1YWg9u+N7p17CdV/
M0FjkT/X2BUtarePiBKv5yXq4cQdpNuffOMyaaxoFvlUATKWAaa9RiI5rq9v21dg
Tzct1K00MrhUlAfAKoVg2X24dw/NpBQd9UdCqHpDcfFuM/HZ4yRmpRuJqtke3D42
urno7SThP/+dZftzdL1OyF9EwEp5Q/bCd9ShlMIXiNH1H8Lc8NQuL+E+J9qsWCXm
F+3B1CLWuhBTxHd+mz4KextI14VD/eK/Ckt6I2VK8dDm68jvCeF/Ph81lDCYOLcA
dCtVvNs3yN+FqAA5k8Wvh7pPn4/nqg==
=ryza
-----END PGP SIGNATURE-----

--Sig_/GprlEwAh4SNpIjpgvvJro/i--
