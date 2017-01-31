From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pinctrl tree with the arm-soc tree
Date: Tue, 31 Jan 2017 16:29:51 +1100
Message-ID: <20170131162951.3de4bcd6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Linus,

Today's linux-next merge of the pinctrl tree got a conflict in:

  arch/arm/mach-exynos/suspend.c

between commit:

  b4765037fc8c ("ARM: EXYNOS: Constify list of retention registers")

from the arm-soc tree and commit:

  07731019c59c ("pinctrl: samsung: Move retention control from mach-exynos to the pinctrl driver")

from the pinctrl tree.

I fixed it up (the latter removed the code updated by the former, so I
just did that) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
