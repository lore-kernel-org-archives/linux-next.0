Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF623C2D0E4
	for <linux-next@archiver.kernel.org>; Tue, 24 Nov 2020 07:20:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C09D20674
	for <linux-next@archiver.kernel.org>; Tue, 24 Nov 2020 07:20:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OUfwjftg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729492AbgKXHTl (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Tue, 24 Nov 2020 02:19:41 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:57659 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729283AbgKXHTl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Nov 2020 02:19:41 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CgFlG5NCHz9sSs;
        Tue, 24 Nov 2020 18:19:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606202379;
        bh=yNYb3CA0f5Alb8v6AnhoqwzsijAlnPiZ+alDHKffC74=;
        h=Date:From:To:Cc:Subject:From;
        b=OUfwjftgKLNkhEUYElXYUZ0aj63mpyhaXGBWFUBs+qIDvZP0fNltCyEgi/8BO9ROD
         1ER7tOmOPm6Ycz+YQgz8Enr3nGaUkZ+9fCd3qqNqfQOHOJI9UoUMAtwVLSI+qfKrj/
         i4k/tW5RE/FE3yUvc9ZBNmAhl6ilSgAiFr3mtpdQ1RuJSfz+fIP58Axxt4TZbamrIV
         WSgZ+K0U8spm5NSQgfiG5CHo90S9sv++8Tr+To0ZUQ+BIR0A/yERXFbuN2+Icr9y/3
         FMSX54vFpk0imc5+04+PLCAfTCBZ40sGTQT9VFFtwvv+iaitD92tDnrzIlW9YGBz1w
         9AqPSmyeitYWg==
Date:   Tue, 24 Nov 2020 18:19:38 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andy Gross <agross@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the qcom tree
Message-ID: <20201124181938.11046212@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aFb0b9x1a9_Wv+n_=iRQTRG";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/aFb0b9x1a9_Wv+n_=iRQTRG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  872b41c9a255 ("arm64: dts: qcom: sort sm8150 usb_2 node")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/aFb0b9x1a9_Wv+n_=iRQTRG
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+8tAoACgkQAVBC80lX
0Gxkdwf7BerlZXL+y9dPKoBwb8A7fnx26kftVUMXj74RLdX2whGpjebt75LL1udi
FnQ3T3k8kfDdCkCQipudyfqX8EvG3AwyZnaHxg5Lb8DCCw+S+5ZPWizBZUnJ2q6M
3pP+BRqTpZz4sj9beQ2Tft4zRymoZq9atoK41pNcHyFDx6BJvupfmnmqMkcsPDDp
nOHbVxELrmbdD1OsgOD74WtyvhJO+nfddoJPegFILeTfNxmsUz1qKO7fNP/iWc8I
WBFltX9sYRUnIZyFadO4DiX1k5hISjx6KalGLZmlqXCmiCYtbledNmGmCxefXNVx
nt/rBmwz9yiF2gsdHk62kSQvadBGcQ==
=X++2
-----END PGP SIGNATURE-----

--Sig_/aFb0b9x1a9_Wv+n_=iRQTRG--
