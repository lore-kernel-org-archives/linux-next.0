From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: linux-next: build warning after merge of the clk tree
Date: Thu, 18 Oct 2018 11:21:35 -0700
Message-ID: <153988689564.5275.14828718879173741076@swboyd.mtv.corp.google.com>
References: <20181018085142.0fc1d2f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018085142.0fc1d2f7@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Taniya Das <tdas@codeaurora.org>, Craig Tatlor <ctatlor97@gmail.com>, Rob Herring <robh@kernel.org>
List-Id: linux-next.vger.kernel.org

Quoting Stephen Rothwell (2018-10-17 14:51:53)
> Hi all,
> =

> After merging the clk tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> =

> WARNING: modpost: missing MODULE_LICENSE() in drivers/clk/qcom/gcc-sdm660=
.o
> see include/linux/module.h for more information
> =

> Introduced by commit
> =

>   f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for =
SDM660")
> =


Thanks! I silenced it.
