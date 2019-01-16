From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the clk tree
Date: Wed, 16 Jan 2019 14:35:59 -0800
Message-ID: <154767815973.169631.1738587342757192096@swboyd.mtv.corp.google.com>
References: <20190116083440.11b6839c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116083440.11b6839c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

Quoting Stephen Rothwell (2019-01-15 13:34:40)
> [I am experimenting with checking the Fixes tags in commits in linux-next.
> Please let me know if you think I am being too strict.]
>=20
> Hi all,
>=20
> Commit
>=20
>   b488517b28a4 ("clk: socfpga: stratix10: fix naming convention for the f=
ixed-clocks")
>=20
> has a malformed Fixes tag:
>=20
>   Fixes: 07afb8db7340 ("clk: socfpga: stratix10: add clock driver for
>   Stratix10 platform")
>=20
> It should not be split over 2 lines.

Ok sure. Does this matter to scripts? Is it documented in
Documentation/process/submitting-patches.rst? I've seen both types, one
line or many lines, so I'm happy to mandate a policy as long as it's
documented. Maybe also checkpatch can complain about this so that people
don't submit patches "the wrong way".
