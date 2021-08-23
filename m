Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48138C4338F
	for <linux-next@archiver.kernel.org>; Mon, 23 Aug 2021 09:58:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17F3F61378
	for <linux-next@archiver.kernel.org>; Mon, 23 Aug 2021 09:58:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230188AbhHWJ6t (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 23 Aug 2021 05:58:49 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:59405 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231759AbhHWJ6s (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Aug 2021 05:58:48 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtSNY2p2hz9sX2;
        Mon, 23 Aug 2021 19:58:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629712685;
        bh=tc+MuSjGZBYIM2E3Ckyauunx58Bo/2bzWbamoxVmyNc=;
        h=Date:From:To:Cc:Subject:From;
        b=fsHV4CVg69i6mxOckI2mJfeIiqlGm910UXWlIGgbRzQ6/5N/04+Z/lgwvXTomWqxY
         e+1ZFPXzLkbsbBvrseVNNVYB7P4WnJu26p1qh8o6ipjo+ko4MmRZ/AdFJxglbFzpM0
         1l0DYlq//XTgz3zPjTwsun9BWgcHbSehWltmSzsOtRtUmctQkk9xUJhJGfwbTSF62S
         ToYh9l6h8VSLXrtkWt7fxsJBMaoikAZf+eylD90rZD4G/Zi8HcH4LnZVMYSAU8Myel
         eFXCFDXYvzZ3B9y6Kg4BpP49J4YW2EHeuhScEkAnwA2NVmLnYQt+InpNMuUr61LmDz
         X95jcJr2yc4ZQ==
Date:   Mon, 23 Aug 2021 19:58:04 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the ftrace tree
Message-ID: <20210823195804.10c5758a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HcsUxNEksk5PPP4IrPYpug1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/HcsUxNEksk5PPP4IrPYpug1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ftrace tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/trace/histogram.rst:80: WARNING: Malformed table.
Text in column margin in table line 8.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
.hex        display a number as a hex value
.sym        display an address as a symbol
.sym-offset display an address as a symbol and offset
.syscall    display a syscall id as a system call name
.execname   display a common_pid as a program name
.log2       display log2 value rather than raw number
.buckets=3Dsize  display grouping of values rather than raw number
.usecs      display a common_timestamp in microseconds
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Introduced by commit

  370364351926 ("tracing/histogram: Update the documentation for the bucket=
s modifier")

--=20
Cheers,
Stephen Rothwell

--Sig_/HcsUxNEksk5PPP4IrPYpug1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEjcSwACgkQAVBC80lX
0GyP7Qf/UUFSsP+xHhgC/SGhTlSzOdQTmjhzGSKFIg/+PJTFBdDxwevRNpqbq3af
vRYQjx2H69/R1D7TR/9sTkPhXoU/ve0SoJnp4K3o2O5cVXhFi8kQf0EvlFu9sEof
acIdSSaDw5Jch1DiRL3z1VT8Ao/hmFTogEEWJS0/koIEtE9qPonHibJvZOfa1ZbJ
bD/W7DRdsm7cPXC+7uxL42bQpj1XZpf9wnJHtWQw4wjYxcbXkGdrd+oSk2CfbWQj
1PonimVwi6heC0jSJVMW3zeZn2ua9cJTWTvrR+koJWYZ8KmJkP3cHTZfyoHo3BOL
bM5MAIwMfPo3V4YbbjeDeF27TH9Lcg==
=150d
-----END PGP SIGNATURE-----

--Sig_/HcsUxNEksk5PPP4IrPYpug1--
