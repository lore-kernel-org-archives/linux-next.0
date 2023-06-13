Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB6CC7EE29
	for <linux-next@archiver.kernel.org>; Tue, 13 Jun 2023 06:23:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbjFMGXr (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 13 Jun 2023 02:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233225AbjFMGXr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Jun 2023 02:23:47 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B17A1AD;
        Mon, 12 Jun 2023 23:23:46 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4QgJR51YLrz4x4G;
        Tue, 13 Jun 2023 16:23:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1686637425;
        bh=BiFeAYc5B5PTQLF690yIlkUI+6JQtYgU6kOZVyj07jY=;
        h=Date:From:To:Cc:Subject:From;
        b=UmCy34gxXw38DxHerDhSB+m5plOagCsqYnlvgZFw34u2GXiFLtFaa1rwPGN/jnjfq
         tPsLs4+CMHFCpaItDF9d9FnZTFJWS2KWZlVqPHhVWVZtHL0D7ghakc7gjiEuxk/RG2
         TJR3dB6is49AiHtgk9/fQSSroR15++Mz4itpuv0sPPeQ813gvNEETN49YD237K2MXR
         rAudesynprWiQ1qboLpQGK7G7iy9riyoZEaM+YlLdPaCfUDjcdAu6iO5fmHgvvJ5Dp
         LV8zVxzEg+sdLQKWjfY0c6ipbftnK17kH8x6n8sZ8NVx5GFJ0I8Pz2QDkN5Et/KqJI
         ucqB3uWJJ6FGQ==
Date:   Tue, 13 Jun 2023 16:23:44 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Baoquan He <bhe@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the arm64 tree
Message-ID: <20230613162344.1dcb6ac0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/V_kAW3EaT=R2bU0Ptd2TH8x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/V_kAW3EaT=R2bU0Ptd2TH8x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm64 tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/arm64/kdump.rst: WARNING: document isn't included in any toct=
ree

Introduced by commit

  03dc0e05407f ("Documentation: add kdump.rst to present crashkernel reserv=
ation on arm64")

--=20
Cheers,
Stephen Rothwell

--Sig_/V_kAW3EaT=R2bU0Ptd2TH8x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSIC3AACgkQAVBC80lX
0GwTiwgAkKuk+h0a3okaEwDztqV+24yVdfomXJIHaizmgEvXMib4i2NAhkvuykQ0
xUuwTHc/6smpZnRCnMRkZGZhpaTthcU7mC5FXehhiAiPRY1PF9Yp4M9vLtMaQXQj
ZV1v6pRnGFEDqEw7UvbxhqJ5F/m1nuSpWZwuEZ4JE1dAKyegqh5FJReKPlLbG6y8
FSMjzl33jsOsrFZOL0CUQ31GCK6nzrUn/vGOR0WDCMzBzgwtchBjLaaQk4JRDlMH
6mRMbx8G7ghCdhGxWQtzcxHgWJ19EEPYuU/gRdvFve8DCFjYNFZVMHJdKajxXsXP
XyaiccaZ6cTYAOefsPuhvy2+yIGYEQ==
=ymEL
-----END PGP SIGNATURE-----

--Sig_/V_kAW3EaT=R2bU0Ptd2TH8x--
