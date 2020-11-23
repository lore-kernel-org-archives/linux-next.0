Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA62CC2D0E4
	for <linux-next@archiver.kernel.org>; Mon, 23 Nov 2020 07:19:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B298B20732
	for <linux-next@archiver.kernel.org>; Mon, 23 Nov 2020 07:19:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="T9JF6Yil"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgKWHTp (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 23 Nov 2020 02:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbgKWHTp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Nov 2020 02:19:45 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C482AC0613CF;
        Sun, 22 Nov 2020 23:19:44 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cfdnk4X1Nz9sRR;
        Mon, 23 Nov 2020 18:19:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606115981;
        bh=5aWq4/5oCgtrxSInVEjfuJ5H6MgIcybqOoCCNa8qOwA=;
        h=Date:From:To:Cc:Subject:From;
        b=T9JF6YilggbcQY8JHr4Q0Uj2Yh27jouU6WT/E+qtpmU/XvMMnTPSl++J3H2guhIW0
         3UjVzmDUGBvkZ86yb++PPemGIcxkHXgni1HgNs4GnRdBRiAnqrRc/yCzvWZa42musM
         SCeUn7v0b2nA46aS2EWj9sFymTcJya+nFJVy38Lv3AXHuj7bWG17HZmD94W5I2X/Fb
         cRC6Dl8tsiHHVFNV7Jddjjjfy9CkGdk+gauDY3f5yMREYUwla9XL5J19lAaZ69AHDM
         WAgwhY2WPCyxa0sJXLFUSrq9oE9fXWmyPkKRn8X5CI/FGHPnvpQCNYH9/1AVth2NJJ
         MyrvsIjFxhITg==
Date:   Mon, 23 Nov 2020 18:19:22 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     Borislav Petkov <bp@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the tip tree
Message-ID: <20201123181922.0c009406@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4FMpJZLd1GGbJP_/T+3_/dY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4FMpJZLd1GGbJP_/T+3_/dY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tip tree, today's linux-next build (htmldocs) produced
these warnings:

arch/x86/kernel/cpu/sgx/ioctl.c:666: warning: Function parameter or member =
'encl' not described in 'sgx_ioc_enclave_provision'
arch/x86/kernel/cpu/sgx/ioctl.c:666: warning: Excess function parameter 'en=
clave' description in 'sgx_ioc_enclave_provision'

Introduced by commit

  c82c61865024 ("x86/sgx: Add SGX_IOC_ENCLAVE_PROVISION")

--=20
Cheers,
Stephen Rothwell

--Sig_/4FMpJZLd1GGbJP_/T+3_/dY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+7YnoACgkQAVBC80lX
0GwEQgf/dB57ZwMZTakfV1oqE5rCSHWeqzP5khBWw0zmzQfyMlhFKJIZDOZr7gez
6i2Hu74C2mD+Fsf6V9wTDzAPmIuOgasbB8SbXj0W4wi1gn9AqEiPp2ATSKumN4q1
+jOGTkp6k7zjfvyHs+jfRT9oE3l7cZw/WehIvWaouN3H6P7IpyvLRZkpFPkgiDFU
PgUW+HuaVWNGymdCiZpFMLOoFk+thpdjzpqxOLO4x3/HtUNQloYw0EUPZMJsLXCK
oiu+72oWJjYw5FoGXUQcsbXGzINqlYST6Y8ae59eGXd+Y6Ct7OCv6FDy4aGyPyHA
Ik0PRLf01nU+7hd0kOH/yMmqn4ZUJQ==
=6VVK
-----END PGP SIGNATURE-----

--Sig_/4FMpJZLd1GGbJP_/T+3_/dY--
