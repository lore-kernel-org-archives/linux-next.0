From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: linux-next: build failure after merge of the clk tree
Date: Fri, 03 May 2019 08:55:47 -0700
Message-ID: <155689894782.200842.4115245530077819749@swboyd.mtv.corp.google.com>
References: <20190503092511.0054911e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503092511.0054911e@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Quoting Stephen Rothwell (2019-05-02 16:25:11)
> Hi all,
>=20
> After merging the clk tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> arch/arm/mach-omap2/omap_hwmod.c: In function '_get_clkdm':
> arch/arm/mach-omap2/omap_hwmod.c:669:35: error: 'CLK_IS_BASIC' undeclared=
 (first use in this function); did you mean 'CLOCKS_MASK'?
>    if (__clk_get_flags(oh->_clk) & CLK_IS_BASIC)
>                                    ^~~~~~~~~~~~
>                                    CLOCKS_MASK
> arch/arm/mach-omap2/omap_hwmod.c:669:35: note: each undeclared identifier=
 is reported only once for each function it appears in
>=20
> Caused by commit
>=20
>   7c36ec8a90a8 ("clk: Remove CLK_IS_BASIC clk flag")
>=20
> I have used the clk tree from next-20190502 for today.  (The above commit
> does not revert cleanly.)
>=20

Sorry, I got confused and merged the wrong branch over. Should be fixed
up now.
