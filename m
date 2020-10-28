Return-Path: <SRS0=0UPh=ED=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F023C388F7
	for <linux-next@archiver.kernel.org>; Wed, 28 Oct 2020 22:08:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCC7F24724
	for <linux-next@archiver.kernel.org>; Wed, 28 Oct 2020 22:08:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HE0JzoZ7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729685AbgJ1WIw (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbgJ1WIu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Oct 2020 18:08:50 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1633CC0613CF;
        Wed, 28 Oct 2020 15:08:50 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CLYmj3bQSz9sVS;
        Wed, 28 Oct 2020 14:23:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1603855385;
        bh=zGgdftVfw/AFrzAzemRlwybBGKSTvIw3c6dIzczEUSo=;
        h=Date:From:To:Cc:Subject:From;
        b=HE0JzoZ7DHvftbryidRVLpw8tUA01JvwtrB0nY0aqklFEvmHoCUMNAknMN5spWq5q
         LeQE1+Y1Tn6NYk8O4/Uq0/ViUX28VvPpbhRGhykOy0Fabaq4gFNre8AFpWhR2ff+VM
         jFqqBN0TG7zecLjCtDV44IOhCoJ9+s3URWbeJixh9kH/cXzO0RHjdYCTvDEsxqaXHo
         w9f9HtgbE4Uu1+UQGOATSVEbbLNg2OUPwA5QRHp/BO7SkAgaYujd/sVZEUPgtFmSgX
         JGksbiZ9ulILHOGiJadDHG99HVZ4+e7WRkwRzVYAHpJmhzB/lRIzDrDC1cQB4HnxyQ
         MDZWrDI6Iz8Ow==
Date:   Wed, 28 Oct 2020 14:23:00 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Balbir Singh <sblbir@amazon.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the tip tree
Message-ID: <20201028142300.34ed89b1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ta83_Vl8B6oH797zcmq1Mk5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ta83_Vl8B6oH797zcmq1Mk5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (htmldocs) produced
this warning:

Documentation/admin-guide/hw-vuln/l1d_flush.rst:25: WARNING: undefined labe=
l: documentation/userspace-api/spec_ctrl.rst (if the link has no caption th=
e label must precede a section header)

Introduced by commit

  767d46ab566d ("Documentation: Add L1D flushing Documentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/ta83_Vl8B6oH797zcmq1Mk5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+Y5BQACgkQAVBC80lX
0GzMqQgApVv7wCuJdSaBvWJxGdPxF5MqBDuT/SXjx/AQbEV/NUG1k2t9qS5MkA/r
2X7Uephh6gU37TUk6YaqB1+b3+sRsuu5Ms11WXfqN13IP4hG9njQryPQ1vkKx61O
wanic+WRwBL/uThz5snCAGVAON7l/pgGdpQFgTJJN8+vpSPgWyXBD99PllkUFMuT
RZJ6nLJjOz5ctvObVQDGW5qcLpeFHeM+l/stBITecasIseGDXaTNO82Qm6RLbWAA
A1rhGjafFQVsbEBrxwvVBPOuU5PBajk5oYab20hGWlaonuN2bl6tmxxrv2bwVX09
LU6iCbdNqLg04CE5QrhK8xlmwRvm9w==
=n/Xs
-----END PGP SIGNATURE-----

--Sig_/ta83_Vl8B6oH797zcmq1Mk5--
