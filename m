From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20170331 build: 3 failures 5 warnings (next-20170331)
Date: Fri, 31 Mar 2017 22:23:06 +1100
Message-ID: <20170331222306.6978eecb@canb.auug.org.au>
References: <E1ctrQv-0002hq-Jk@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34503 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933051AbdCaLXU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 31 Mar 2017 07:23:20 -0400
In-Reply-To: <E1ctrQv-0002hq-Jk@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Build bot for Mark Brown <broonie@kernel.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Hi all,

On Fri, 31 Mar 2017 08:57:21 +0100 Build bot for Mark Brown <broonie@kernel.org> wrote:
>
> 	arm64-allmodconfig
> ../arch/arm64/include/asm/bug.h:62:29: error: implicit declaration of function '_BUG_FLAGS' [-Werror=implicit-function-declaration]

My mistake, I typoed the merge resolution (it should have been
__BUG_FLAGS) ... it will be fixed on Monday.

-- 
Cheers,
Stephen Rothwell
