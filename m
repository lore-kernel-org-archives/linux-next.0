Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771703DABE3;
	Wed, 25 Feb 2026 18:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772044727; cv=none; b=VlrNZx4QulR30DqXGhCd8zvu3n1ipXkH1uYfcRCVXuoybExRb2ixFLQJNU7wLFHPBcyhe9MznAbyPMwML1PckWSP8RAVcRriyfzBDr/y9FBSdcWtk90erxmo1it4NDvrIjInEArs1O9AkKrIJlekCEgtiqoeYdhEKyJ9Gso0dyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772044727; c=relaxed/simple;
	bh=i6Uo0nHNUMZVuEu4t/52RWLQWBEwKqxQxNP3EHTU3Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdzKhuIXnX8cEYS/P/CdlocK81sJ5KmC943sWtp1pOUUD4wh2pt+qSpTqYe1ASt9X2cxEqKuVRxHoBSH4VdFV4oWDMmrRAhuXbLKNGfjxJOVmUxWqvmqmQlsVgn5h5lZIw7Z9Q3wmr1V24inlzYNqXtmZOE5h8Zmty+BLjYwPSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUHVSQKy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUHVSQKy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772044725; x=1803580725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i6Uo0nHNUMZVuEu4t/52RWLQWBEwKqxQxNP3EHTU3Uw=;
  b=FUHVSQKyuRhzvoJWb2mVc7DNYgRcafUCI3QdxzexX9dIdv9tNZcQ/jED
   R4iRR7jg1nPJlRtf0m6087p4a3o/RfOZ3lrck81V/5eP40BNWVf3oHQqm
   smvKX1SAGy1aUkrA2S3Btz6hHdkdbhSNowPY5LXhivZEx9lemgtBHsS/J
   fUu1pm9DTiwacnP0FfVOL1t8wf0jZ5odyVzjhM/Si4A4Maujyeeods3vL
   IC8JCGfw1jL1bkBVVER4oSb6xvEI+9kZ/m7N3wmsemxrVjG1/PJtRvVqX
   v6VOEm5gUpmYwF+Mc6dXQD1vd5qr/jitQVHof61voPVMpJhTw2F9unmI1
   Q==;
X-CSE-ConnectionGUID: FjOiN+vvQK2Yb0kEonQlSg==
X-CSE-MsgGUID: 72IHWBZiTfCCQwwhC4d5sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73001907"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="73001907"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 10:38:45 -0800
X-CSE-ConnectionGUID: EliFdfCxRtmc5tt7c+1RpQ==
X-CSE-MsgGUID: KcF3tBx/Sy2IQL37/6TisA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="215544446"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 25 Feb 2026 10:38:44 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9319F98; Wed, 25 Feb 2026 19:38:42 +0100 (CET)
Date: Wed, 25 Feb 2026 19:38:42 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Feb 25
Message-ID: <aZ9BsrhtNZ5LlFAc@black.igk.intel.com>
References: <aZ8pWvKqd9DhNYRD@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ8pWvKqd9DhNYRD@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 25, 2026 at 04:54:50PM +0000, Mark Brown wrote:
> Hi all,
> 
> Changes since 20260224:
> 
> The URL for the imx-mxs tree was updated.
> 
> The socfpga tree was added.
> 
> The ntfs tree was added.
> 
> The drm-msm-fixes tree acquired a conflict with the origin tree.
> 
> The net-next tree acquired a conflict with the net tree.
> 
> The bluetooth tree acquired a conflict with the net tree.
> 
> The drm-misc lost it's build failure.
> 
> The staging tree acquired a conflict with the staging.current tree.
> 
> Non-merge commits (relative to Linus' tree): 1890
>  2114 files changed, 196952 insertions(+), 29041 deletions(-)

spi/for-next doesn't include spi/for-7.1. So SPI changes missed Linux Next for
a few days already. Not sure about other your repositories.


-- 
With Best Regards,
Andy Shevchenko


