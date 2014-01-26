From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: linux-next: manual merge of the clk tree with the arm-soc tree
Date: Sun, 26 Jan 2014 21:59:48 +0100
Message-ID: <52E57744.5030807@gmail.com>
References: <20140113160630.cf720268510f5e0931c24284@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140113160630.cf720268510f5e0931c24284@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Turquette <mturquette@linaro.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On 13.01.2014 06:06, Stephen Rothwell wrote:
> Hi Mike,
>
> Today's linux-next merge of the clk tree got a conflict in
> drivers/clk/samsung/clk-exynos4.c between commit 86576fbe201b ("clk:
> samsung: exynos4: Fix definition of div_mmc_pre4 divider") from the
> arm-soc tree and commit 2d7382375054 ("clk: exynos4: replace clock ID
> private enums with IDs from DT header") from the clk tree.
>
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

It seems like somehow this fix-up has been lost in action and the 
conflict ended up being merged incorrectly in linux-next. Could you take 
a look?

Best regards,
Tomasz
