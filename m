From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20170710 build: 2 failures 5 warnings (next-20170710)
Date: Mon, 10 Jul 2017 19:22:34 +1000
Message-ID: <20170710192234.143c255f@canb.auug.org.au>
References: <E1dUTPU-0005oi-5M@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52347 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752227AbdGJJ2N (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Jul 2017 05:28:13 -0400
In-Reply-To: <E1dUTPU-0005oi-5M@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, heiko.carstens@de.ibm.com

Hi all,

On Mon, 10 Jul 2017 08:47:12 +0100 Build bot for Mark Brown <broonie@kernel.org> wrote:
>
> ../include/linux/nvmem-provider.h:51:9: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]

Possibly caused by commit

  697e5a47aa12 ("rtc: add generic nvmem support")

from the rtc tree.  include/linux/nvmem-provider.h uses ERR_PTR, but
does not include err.h :-(

-- 
Cheers,
Stephen Rothwell
