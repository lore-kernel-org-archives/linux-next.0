From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20150817 build: 2 failures 16 warnings (next-20150817)
Date: Tue, 18 Aug 2015 00:01:25 +1000
Message-ID: <20150818000125.2225c713@canb.auug.org.au>
References: <E1ZRJRP-0003Sa-92@optimist>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39903 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750759AbbHQOB0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 17 Aug 2015 10:01:26 -0400
In-Reply-To: <E1ZRJRP-0003Sa-92@optimist>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Build bot for Mark Brown <broonie@kernel.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Hi Mark,

On Mon, 17 Aug 2015 13:23:04 +0100 Build bot for Mark Brown <broonie@kernel.org> wrote:
>
> 	arm64-allmodconfig
> ../scripts/sign-file.c:20:25: fatal error: openssl/bio.h: No such file or directory
> ../scripts/extract-cert.c:23:25: fatal error: openssl/bio.h: No such file or directory
> 
> 	arm-allmodconfig
> ../scripts/sign-file.c:20:25: fatal error: openssl/bio.h: No such file or directory
> ../scripts/extract-cert.c:23:25: fatal error: openssl/bio.h: No such file or directory

allmodconfig builds will now need libssl-dev or the equivalent installed
to build the host programs for the new signing code that came in the
security tree today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
