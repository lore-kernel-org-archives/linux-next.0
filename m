From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Mon, 10 Sep 2012 08:24:49 -0700
Message-ID: <CACRpkdbf94QG59pvqcN_grCG_tcpri7JyypZ9ZMu3R=LwvSoXw@mail.gmail.com>
References: <20120910161428.879618aea62e5be6340ed93c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120910161428.879618aea62e5be6340ed93c@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mike Turquette <mturquette@ti.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Loic PALLARDY <loic.pallardy@st.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Mon, Sep 10, 2012 at 8:14 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the clk tree got a conflict in
> arch/arm/mach-ux500/clock.c between commit 79964bcd792f ("ARM: ux500:
> Correct Ux500 family names usage") from the arm-soc tree and commit
> ebc96db7632f ("ARM: ux500: Switch to use common clock framework") from
> the clk tree.
>
> The latter removed the file so I did that - there may be more fixup
> required.

This is the correct solution, thanks!

Yours,
Linus Walleij
