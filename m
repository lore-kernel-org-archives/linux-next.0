Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B715C433FE
	for <linux-next@archiver.kernel.org>; Wed,  9 Dec 2020 17:30:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E65FA23CD5
	for <linux-next@archiver.kernel.org>; Wed,  9 Dec 2020 17:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732825AbgLIRad (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 9 Dec 2020 12:30:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:39862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729855AbgLIRaZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 9 Dec 2020 12:30:25 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607534984;
        bh=X3mrye1KXGcDNVeDxCVeGHxOE9WePBKAXTYWezNgwdw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=X5w+RnP9Xg+bFUlLwlLPQpCBrQ5xqjKLesd9e+6aGdwrZIXjkTSNtpxmwF0zy1UAz
         pQvfLuT1IJXM5vR4NaCAXzWRJUVqh567p64Ssuggv9GI85fbWGd9FAHF9k3My8jr6t
         ojF3/i5zjhQGEFkbe6s8qLyAJJ7L/eV8pPdMJ3ai4GiZhk6v3A0ThFTX0WZQMcBpb5
         L4bw3mRq7EbzYOUXHmw4d/BrPRJPdSHLkn9cauEPrEip5h/bgh3FCnJ9gMs4VPj2NF
         Enj1ZoNSx0DuE2VPApG9YjGQJiQeQhbR66oF5pgtU45aieOa/U8/MZpwRUZvB9OLtc
         qHMiwvBioe04g==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdVYoxUOUL0zNAPzTJUSR3vGzcJWMzvtCKK=ZxyM=8hk+A@mail.gmail.com>
References: <20201208090555.7159b138@canb.auug.org.au> <CAMuHMdVYoxUOUL0zNAPzTJUSR3vGzcJWMzvtCKK=ZxyM=8hk+A@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the clk tree
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Wed, 09 Dec 2020 09:29:43 -0800
Message-ID: <160753498332.1580929.15118515893187584689@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Geert Uytterhoeven (2020-12-08 00:37:00)
> Hi Stephen,
>=20
> On Mon, Dec 7, 2020 at 11:06 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> > In commit
> >
> >   c3f207f6d23d ("clk: renesas: r8a779a0: Make rcar_r8a779a0_cpg_clk_reg=
ister() static")
> >
> > Fixes tag
> >
> >   Fixes: c07439dea94050b6 ("clk: renesas: cpg-mssr: Add support for R-C=
ar V3U")
> >
> > has these problem(s):
> >
> >   - Target SHA1 does not exist
>=20
> Oops, my bad.
>=20
> > Maybe you meant
> >
> > Fixes: 17bcc8035d2d ("clk: renesas: cpg-mssr: Add support for R-Car V3U=
")
>=20
> Yes I did.
>=20
> Mike/Stephen: do you want me to respin my pull requests?
>=20

Sure a respin is fine. I can fix it up in clk tree. Any chance your
trees can be pulled into linux-next? That would find this earlier.
