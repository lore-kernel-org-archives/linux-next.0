Return-Path: <SRS0=YLCN=EI=vger.kernel.org=linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D03BC00A89
	for <linux-next@archiver.kernel.org>; Mon,  2 Nov 2020 21:32:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2725208B6
	for <linux-next@archiver.kernel.org>; Mon,  2 Nov 2020 21:32:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hTg5hh2Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbgKBVcF (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Mon, 2 Nov 2020 16:32:05 -0500
Received: from ozlabs.org ([203.11.71.1]:56825 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725833AbgKBVcF (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Nov 2020 16:32:05 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CQ5hy3w1yz9sRK;
        Tue,  3 Nov 2020 08:32:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1604352722;
        bh=gtoqJfn9FIdEkbzAxub4iuBVUObrpUd1AOjxOPH8/eQ=;
        h=Date:From:To:Cc:Subject:From;
        b=hTg5hh2YBpaLKYuKxTSrEZbnOqdhJMX/xxA6i1ZQDuZW1xOVqesrSS6YbpfZaDZlG
         sL5Vvut9K62+FtgZ1d98Ed8Sj23csS35C9UxpUp55H8Ze9qMu9aVemnzBJzQudCnFf
         mJSA/6cUPnY3XmqptC8p/JJAEtuRxIn203FKuZf9mJWsMX7Z/vqPRzbuSg8H+qPTy8
         P5HKikqWtOCF6BHH/nGzcXhrV1Rr0kBUCEmVsXw/+4TKi7k/FzGUiUFn0A6LuHiXEs
         BlarPUGLtHCO4OhgQaE40oBG6t2WdcjIRNbfbYiLBnVxhDrYQOygw6euK1WdEmywjh
         Kz1WFDBb07gEw==
Date:   Tue, 3 Nov 2020 08:32:01 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Petr Mladek <pmladek@suse.com>
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the printk tree
Message-ID: <20201103083201.4c653eed@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hc1z_9m0psR.L5Og6lAVvqh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/hc1z_9m0psR.L5Og6lAVvqh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8a8424bf2439 ("init/Kconfig: Fix CPU number in LOG_CPU_MAX_BUF_SHIFT desc=
ription")

Fixes tag

  Fixes: 23b2899f7f ("printk: allow increasing the ring buffer depending on=
 the number of CPUs")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/hc1z_9m0psR.L5Og6lAVvqh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+getEACgkQAVBC80lX
0Gz7RggAmFZG42PuTH117ZayMoNwr5k3+6pYp62xvpbHE9BdOaCxfNHoy0jWVEl3
Hqhin3oYjtjBPVjEWCZLpohx5N20WfLGP04AUiKWenQd6RFKIOEWpclWLTyfuvhC
6L5uolfumHR7Z8OZmek/YvLVQQmqhW47JZCVHypmEsdl41dvnOypBnytSoTuPoQv
1iaQ9zygEjf7kvCZYF8UqChL/G1CMNjKizm55/s2U1dlalC04usRbg5myoIiPSDM
isfQOat79XPN4ktv79gWvJCrpjRLfiTcss8vBHMXNdPetJ1781xxcARetsWyQSop
sI6gBkYS7Ux+VUCDc/l+Brekg5MRDw==
=w0Kh
-----END PGP SIGNATURE-----

--Sig_/hc1z_9m0psR.L5Og6lAVvqh--
