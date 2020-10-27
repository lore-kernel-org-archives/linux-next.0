Return-Path: <SRS0=G6w6=EC=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74069C55178
	for <linux-next@archiver.kernel.org>; Tue, 27 Oct 2020 21:34:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0990C22249
	for <linux-next@archiver.kernel.org>; Tue, 27 Oct 2020 21:34:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XP2KaI+M"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S374024AbgJ0V0J (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 27 Oct 2020 17:26:09 -0400
Received: from ozlabs.org ([203.11.71.1]:50495 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S374082AbgJ0VZ5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Oct 2020 17:25:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CLPrg2QqJz9sRk;
        Wed, 28 Oct 2020 08:25:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603833955;
        bh=5TzWojLfR5wPPCfBJL59xdfX/iM136TguBSnvWAqY/E=;
        h=Date:From:To:Cc:Subject:From;
        b=XP2KaI+M1foSz93/SN+jvmJbI7D37Dgm1sW2UmD8u/k7h8LREziAWEKbdpcU9xm+z
         GYgtvAng+XFqvfZRIBX92khUROea2q8vzyaqn6wC5qGRXz8IrhN5MS3Nc7ApO104ij
         if6N3/49JCRvj5dzG4sYoBcrapDc1imdtgbzapxB/Hr5xYKvYLreu4SiNB7n69T10S
         wQP2g0jP6Qt2qIuhdEyeMOHLm0Nh4LKJzE6sXdOl66+5Gtil4x5XYEl6BD4mk6Awyi
         vzRvE3rubPhKxjyDaanm+ojB9xH0tf4ARZ0PGMkFGUWwDBjloX3NqlOT0YJp6oZT7T
         bmtg79fVPr2ug==
Date:   Wed, 28 Oct 2020 08:25:54 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the mmc tree
Message-ID: <20201028082554.3a486ebe@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7FvpXCn_KqDi/gk2yyWsDrt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7FvpXCn_KqDi/gk2yyWsDrt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  4a890911ffdb ("mmc: sdhci-of-esdhc: make sure delay chain locked for HS40=
0")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/7FvpXCn_KqDi/gk2yyWsDrt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+YkGIACgkQAVBC80lX
0Gyg5gf6AxlZpWys4faOk0cWcrUjX34Ao0JCe3Bwp5ZKlHDB9tQSSIrtxdpLIdTy
TE5eCabRNSq/hp0vfFFTbLBz4kk+VScTZQmSHAGDn9ObRXvOm1OyfK+RIsMEzuSS
X0O9NVvPbSfZ4io+ppS9hEKB89R0lnVFu+V117yrqJAgdB4xOPWQgKFtkqtG1tEn
As23zNWUaKPuYW5HYAqX2OdCCPz6GGvysZmSTZTzYjt7RyHy7uEipDYWfB9u0/mk
2+cY9eHTeaWvg7d/0cnjoLRCExZ8qg4ndvVm1ovSb6orcbO4vCzgts1+/Hf1+KAC
gdkUv8u3dh+EEf88qx9gfmmMOdhirw==
=vgwK
-----END PGP SIGNATURE-----

--Sig_/7FvpXCn_KqDi/gk2yyWsDrt--
