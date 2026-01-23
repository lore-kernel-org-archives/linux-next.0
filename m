Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596F42D0622;
	Fri, 23 Jan 2026 22:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769206732; cv=none; b=Yuz9Rm1fSXzkXt5Er3e1PTUbsAK06apxK+znYIRWJd1sov3xZMkd2sq+O6CS12uFiPOy7KG4uoFAGq5KWYvw0nw43rkVLx0DCUxzWElQ4zRD23e1x4mPK1abU7RuhHcoupuDV15YR2xArT053buza1wY4fyTnRgjlxyAcv+2Lqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769206732; c=relaxed/simple;
	bh=pqmwYUe4/taL5WoWyvwsr2cOrdKhKmDqH2eW2bxQuy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZC8e1bsayWct7kWWL5vk7qwGPSbQSC8pGf9STZ2CXygPHNOHNvuc09uj/a1Obu9PmZDyle4sKAJswnkmy1KXU4yIvuCKoD3/3LlLlVMOYnJwztYiLPqrVXG8R28aX+PuQQDUplidGC9iDWrc6CBgKqeoBkx3vSQO1g9ar3yxSkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bGJXiwBq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bGJXiwBq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769206730; x=1800742730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pqmwYUe4/taL5WoWyvwsr2cOrdKhKmDqH2eW2bxQuy4=;
  b=bGJXiwBqTCXZSxiSnszJ/Kqnr21ZvdFukyaowifT5W6zujiDKh04LXxY
   B8I2rAuVTEzOnOkdpUh3VAgxIgNUIKha7E0P+IGRzMapFhvJDn/7kX/rS
   Z2fq7rmLWJ3HDG8MlDLvu/D7ztspEQdVUJPnMr56+F3xgbYNwo+e6/DJV
   e6lgjUCnJvS5MQIw/7Y46pSOIEkAAQ7lnVpu7miVbVtLsCnuxPEIN5hLP
   h2zIWADfJm4YCWtzun/e1tqC/EoX2ouurJUmJUdaospkFtu1Ddb1gHgBu
   wM1kS/7xigr2kcA/oopLKJCZhNzea8wvmowBhQ70GHLjGctI1SWIt4/0p
   A==;
X-CSE-ConnectionGUID: OciMD0LcS2at7b0kninEiQ==
X-CSE-MsgGUID: Vu3RjPKqRkKBluTnSixgUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70185197"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="70185197"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:18:49 -0800
X-CSE-ConnectionGUID: 0WSoN+CBQ1KNr1klZzDCIQ==
X-CSE-MsgGUID: 2xHxtXYdSNyYUvuVhHvJgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207172666"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:18:48 -0800
Date: Sat, 24 Jan 2026 00:18:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the random tree
Message-ID: <aXPzxa58ZA38QIG-@smile.fi.intel.com>
References: <aXPso7beaFvlUYiP@sirena.org.uk>
 <aXPudNLOPmXd-U2O@smile.fi.intel.com>
 <f0a1812e-4235-4d32-ac72-f2d8f1cb0d5d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0a1812e-4235-4d32-ac72-f2d8f1cb0d5d@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jan 23, 2026 at 10:10:56PM +0000, Mark Brown wrote:
> On Fri, Jan 23, 2026 at 11:56:04PM +0200, Andy Shevchenko wrote:
> > On Fri, Jan 23, 2026 at 09:48:19PM +0000, Mark Brown wrote:
> 
> > > After merging the random tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> 
> > > /tmp/next/build/arch/arm/include/asm/smp.h:73:43: warning: 'struct completion' declared inside parameter list will not be visible outside of this definition or declaration
> > >    73 | extern int register_ipi_completion(struct completion *completion, int cpu);
> > >       |                                           ^~~~~~~~~~
> 
> > Wouldn't adding
> 
> > struct completion;
> 
> > at the top of arch/arm/include/asm/smp.h fix this?
> 
> That ougtht to do the bulk of it, though I see there's also at least:
> 
> /tmp/next/build/include/linux/dma-fence.h: In function '__dma_fence_is_later':
> /tmp/next/build/include/linux/dma-fence.h:501:22: error: implicit declaration of
>  function 'lower_32_bits' [-Wimplicit-function-declaration]
>   501 |         return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
>       |                      ^~~~~~~~~~~~~

This (dma-fence.h) needs wordpart.h.

> and
> 
> In file included from /tmp/next/build/drivers/power/supply/tps65090-charger.c:10
> :
> /tmp/next/build/include/linux/freezer.h: In function 'try_to_freeze':
> /tmp/next/build/include/linux/freezer.h:58:9: error: implicit declaration of function 'might_sleep' [-Wimplicit-function-declaration]
>    58 |         might_sleep();
>       |         ^~~~~~~~~~~
> 
> in there.

And this (freezer.h) for now requires kernel.h :-(

...

Okay, I need to reproduce that.
Thanks!


-- 
With Best Regards,
Andy Shevchenko


