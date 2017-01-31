From: Dave Jiang <dave.jiang@intel.com>
Subject: Re: next-20170131 build: 2 failures 3 warnings (next-20170131)
Date: Tue, 31 Jan 2017 12:18:07 -0700
Message-ID: <d75e33ae-45ec-af7a-9ad1-1b8e54285b0c@intel.com>
References: <E1cYVke-0001Pw-1e@optimist>
 <20170131191021.ogodwklhn74o5ws5@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:63499 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752013AbdAaTah (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 31 Jan 2017 14:30:37 -0500
In-Reply-To: <20170131191021.ogodwklhn74o5ws5@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>, Ross Zwisler <ross.zwisler@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>



On 01/31/2017 12:10 PM, Mark Brown wrote:
> On Tue, Jan 31, 2017 at 10:33:28AM +0000, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build an arm allmodconfig due to:
> 
>> 	arm-allmodconfig
>> ../drivers/hsi/clients/cmt_speech.c:1114:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>> ../drivers/gpu/drm/armada/armada_gem.c:38:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>> ../drivers/gpu/drm/etnaviv/etnaviv_drv.c:468:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>> ../drivers/gpu/drm/etnaviv/etnaviv_gem.c:178:5: error: conflicting types for 'etnaviv_gem_fault'
>> ../drivers/gpu/drm/omapdrm/omap_drv.c:696:11: error: initialization from incompatible pointer type [-Werror=incompatible-pointer-types]
>> ../drivers/gpu/drm/omapdrm/omap_gem.c:531:5: error: conflicting types for 'omap_gem_fault'
> 
> which is triggered by 25d3db7600b87 (mm, fs: reduce fault, page_mkwrite,
> and pfn_mkwrite to take only vmf) which updates the signature for fault
> but doesn't update all the users.
> 

I think this patch posted by Arnd should've fixed it
http://ozlabs.org/~akpm/mmots/broken-out/mm-fs-reduce-fault-page_mkwrite-and-pfn_mkwrite-to-take-only-vmf-fix.patch
