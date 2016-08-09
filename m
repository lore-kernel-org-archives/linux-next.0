From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: linux-next: please clean up the samsung-krzk tree
Date: Tue, 9 Aug 2016 18:17:22 +0200
Message-ID: <20160809161722.GA5782@kozik-lap>
References: <20160809095505.2fd76ca4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:33018 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752323AbcHIQR1 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Aug 2016 12:17:27 -0400
Content-Disposition: inline
In-Reply-To: <20160809095505.2fd76ca4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Aug 09, 2016 at 09:55:05AM +1000, Stephen Rothwell wrote:
> Hi Krzysztof,
> 
> The samsung-krzk tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git#for-next)
> contains just these:
> 
> 253256f64294 Merge branch 'next/soc' into for-next
> b148ebe425aa Merge branch 'next/defconfig64' into for-next
> d11d19d93a01 Merge branch 'next/defconfig64' into for-next
> cc8b7edeaeff Merge branch 'next/drivers' into for-next
> 33d1679aeebb Merge branch 'next/dt64' into for-next
> c239aef8ed5c Merge branch 'fixes' into for-next
> 45338b4af16f Merge branch 'next/drivers' into for-next
> 42628e196937 Merge branch 'next/soc' into for-next
> 336361e2749d arm64: dts: Fix RTC by providing rtc_src clock
> 13fc4c900141 Merge branch 'for-v4.8/exynos-mfc' into for-next
> c210c51020f2 Merge branch 'for-v4.8/dts-exynos5410-odroid-xu' into for-next
> 976b260e2989 Merge branch 'fixes-dt' into for-next
> 279b6fdc5751 Merge branch 'next/defconfig' into for-next
> 42ba6ffaa300 Merge branch 'next/dt' into for-next
> 9f1bc73cb9b2 Merge branch 'next/drivers' into for-next
> a8c1aef0a08b Merge branch 'next/soc64' into for-next
> c39705ddcc6e Merge branch 'next/soc' into for-next
> 63b9ef3830d1 Merge branch 'fixes' into for-next
> 
> and is causing a conflict with mailline.  Please clean it up.

Indeed there was a conflict comming from different merge-conflict
resolution between me and arm-soc (which pulls my stuff). Fixed. Sorry
for the trouble.

However the changelog above is mostly correct. This is a common pattern for
arm-soc related repositories. All work is expected to be done in
separate branches so for-next often looks like this.

Best regards,
Krzysztof
