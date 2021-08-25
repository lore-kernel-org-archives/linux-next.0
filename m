Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF624C4338F
	for <linux-next@archiver.kernel.org>; Wed, 25 Aug 2021 02:51:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A010C61373
	for <linux-next@archiver.kernel.org>; Wed, 25 Aug 2021 02:51:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238832AbhHYCwL (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 24 Aug 2021 22:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238835AbhHYCwH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Aug 2021 22:52:07 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EFC0C06179A;
        Tue, 24 Aug 2021 19:51:20 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GvVq75hBkz9sWl;
        Wed, 25 Aug 2021 12:51:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629859876;
        bh=knKjxsyznS4IE1GXjcLUhTL3fKLtXd+Srj38s+xqkr8=;
        h=Date:From:To:Cc:Subject:From;
        b=nAh4QQXSJb+hXJ8hob6lzPXg8XTtv7t5D/jrH1QgBaumrkqnaFxDwdb/d/NkEew6C
         n6H+ZpFvcfA2bmduJl5wFiE/LFaYo+GDxrH+V8elBmiBqR3xD0os+2JS4ai1cOalq2
         aHPujjYkKjZiEcfWCV6oZIb5FXmt8POxZmcgPxmD4br58apvxI5NcZUhtC4vnP3yxa
         aLVBMPjat0dgsHYD3Uk7tOA3ExoVRW7R8zbytFKVerC8tml6TcqtcqwsZmlpJtp2JB
         KiV7dANokqmfuY7vLtD1gUTDRqRIgCugFzIai/DdgPhVYL08FclP6++0AKs8kQ2cJ3
         W7OM1LXEVJRsA==
Date:   Wed, 25 Aug 2021 12:51:14 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Fangzhi Zuo <Jerry.Zuo@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20210825125114.498e2a61@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BD=SuAckv1DE9tzzZX_2=pj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/BD=SuAckv1DE9tzzZX_2=pj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c: In f=
unction 'apply_single_controller_ctx_to_hw':
drivers/gpu/drm/amd/amdgpu/../display/dc/dce110/dce110_hw_sequencer.c:1495:=
20: warning: unused variable 'params' [-Wunused-variable]
 1495 |  struct drr_params params =3D {0};
      |                    ^~~~~~

Introduced by commit

  5de27e1d6755 ("drm/amd/display: Add DP 2.0 SST DC Support")

--=20
Cheers,
Stephen Rothwell

--Sig_/BD=SuAckv1DE9tzzZX_2=pj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmElsCIACgkQAVBC80lX
0GzKhgf9HwypSqQYnqZxjgpz4lU+UcDJbsd0+LRsQFxVt906KUEJ9oxLfIFr8ln/
hTjZmlLyYrVfo6VaSNT+DF3DZ34Gi0xzVzIOozwr1iq91uzArbiXM4cSdTYIsRG7
I19hSlv60Or24Y0+4fo1fn+zHzWYi4WXXDn/QyEpk3rdANAndkb4NxZq7qFwZmwO
0nhymak/n12CoU+j7I7GRG0pL/roWhw3tMvrQpcJT95Sfevn6TWJmrQd4fUMEOLk
MNLzHL5saJOdiU9RS8JGUoUMwp8Ru10yf/X/wApMI2v5clIxqD8zP867xeQxlUbq
/HvseUD7sIwhozgj3+Q0+ULlfaZYPA==
=KhEu
-----END PGP SIGNATURE-----

--Sig_/BD=SuAckv1DE9tzzZX_2=pj--
