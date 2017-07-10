From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: next-20170710 build: 2 failures 5 warnings (next-20170710)
Date: Mon, 10 Jul 2017 11:31:02 +0200
Message-ID: <20170710093102.6mujx2p5od7gaa5k@piout.net>
References: <E1dUTPU-0005oi-5M@optimist>
 <20170710192234.143c255f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:33663 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752317AbdGJJbE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 Jul 2017 05:31:04 -0400
Content-Disposition: inline
In-Reply-To: <20170710192234.143c255f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, heiko.carstens@de.ibm.com

Hi,

On 10/07/2017 at 19:22:34 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 10 Jul 2017 08:47:12 +0100 Build bot for Mark Brown <broonie@kernel.org> wrote:
> >
> > ../include/linux/nvmem-provider.h:51:9: error: implicit declaration of function 'ERR_PTR' [-Werror=implicit-function-declaration]
> 
> Possibly caused by commit
> 
>   697e5a47aa12 ("rtc: add generic nvmem support")
> 
> from the rtc tree.  include/linux/nvmem-provider.h uses ERR_PTR, but
> does not include err.h :-(
> 

I'll fix it up. I was kind of relying on the kbuild test robot to catch
those. That code has been in a tree that they should be building for
more than two months but it seems to be timeouting a lot recently.


-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
