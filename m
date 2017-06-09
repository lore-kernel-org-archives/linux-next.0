From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20170609 build: 0 failures 5 warnings (next-20170609)
Date: Fri, 9 Jun 2017 21:38:19 +1000
Message-ID: <20170609213819.57130789@canb.auug.org.au>
References: <E1dJFwJ-0004qo-LG@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53965 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751524AbdFILiW (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Jun 2017 07:38:22 -0400
In-Reply-To: <E1dJFwJ-0004qo-LG@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Build bot for Mark Brown <broonie@kernel.org>, kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, Hannes Reinecke <hare@suse.com>

Hi All,

On Fri, 09 Jun 2017 10:10:43 +0100 Build bot for Mark Brown <broonie@kernel.org> wrote:
>
> -------------------------------------------------------------------------------
> x86_64-defconfig : PASS, 0 errors, 1 warnings, 0 section mismatches
> 
> Warnings:
> 	../drivers/block/loop.c:1149:3: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
> -------------------------------------------------------------------------------

Caused by commit

  f2c6df7dbf9a ("loop: support 4k physical blocksize")

-- 
Cheers,
Stephen Rothwell
