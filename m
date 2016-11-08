From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: next-20161108 build: 2 failures 1 warnings (next-20161108)
Date: Tue, 08 Nov 2016 15:56:23 +0100
Message-ID: <1939700.Y8FDAGyee3@wuerfel>
References: <E1c43nx-0006yU-De@optimist> <20161108225858.17b3440d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:55113 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751296AbcKHO4j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Nov 2016 09:56:39 -0500
In-Reply-To: <20161108225858.17b3440d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Build bot for Mark Brown <broonie@kernel.org>, Stephen Warren <swarren@nvidia.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Thierry Reding <treding@nvidia.com>, linaro-kernel@lists.linaro.org, Mirza Krak <mirza.krak@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Jon Hunter <jonathanh@nvidia.com>, linux-next@vger.kernel.org

On Tuesday, November 8, 2016 10:58:58 PM CET Stephen Rothwell wrote:
> Hi all,
> 
> On Tue, 08 Nov 2016 10:39:01 +0000 Build bot for Mark Brown <broonie@kernel.org> wrote:
> >
> >       arm64-allmodconfig
> > ../drivers/bus/tegra-gmi.c:97:11: error: 'dev' undeclared (first use in this function)
> > 
> >       arm-allmodconfig
> > ../drivers/bus/tegra-gmi.c:97:11: error: 'dev' undeclared (first use in this function)
> 
> Caused by commit
> 
>   4f95e6a5c9e4 ("bus: Add support for Tegra Generic Memory Interface")
> 
> from the tegra tree.
> 

Sent a fix now, along with 22 more patches for new warnings and build errrors
in linux-next.

	Arnd
