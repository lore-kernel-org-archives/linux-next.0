Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992BF27FB1C;
	Fri, 23 Jan 2026 22:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769208255; cv=none; b=r+M3M9Ft96tAHhpKQs8D43NykEFPu4rXytTja3Mzc6PhPpZUr4hUeGoLKkfFJSuLgtad1makfNOkKYnVOhMwuH/suAoNH8hRB4f7qDzNonjAe9PEO2sbppcGEPZlfSCsliErFJYk7n+X4JwKQOaUw/tmmWqFy9GKHfzRLKXOq7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769208255; c=relaxed/simple;
	bh=KrGpDkz0uSgndEXFGZQADVlMcQPw+u1FpyDbu0zW//Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvTE1RU/5aV6lWh6hZv0fEpdblNxDLy+u1U8rkGkQSNLg2TCYeWe1T+HRsCnu660nSVnMi8Hd2eVHXHPlYONo+wIK+9jgq7NWaJ2GjfcMEdMSB3FHsl+z+c+smaslD2IaMdSuJCsz51RFFOunNLM/D1qXXwS5JxAkRmoyD3u8mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zi4//WFp; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zi4//WFp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769208254; x=1800744254;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KrGpDkz0uSgndEXFGZQADVlMcQPw+u1FpyDbu0zW//Y=;
  b=Zi4//WFpQBRKNjQOomxqAsEZYJ89D2QKr2oclqPupsu1udwRSXBKb+HM
   AC7eVA0NS8TBKctA3UmJiFYp5JI4a2MkTYjFjZgoYxPHA7cGBg1VLCrMF
   YeSBwrWp7ZnOVVHQK3pK3ejdw9iQuDIyc7j+zTmm4H9HZL0Lep0CSGLU6
   t9hERTnE7qSQuJEAVklXtClRoaFTQA7jzukcIk5I/9M3ruoIdN52i3Ksg
   RAucrSUSEk8tdCNNjJa/kc/kXGgnTvmvMl11OfTIiX+i1oAnbZh5TNb6l
   Btk73BTUTZ0KwJ7GXO9DAKiLuzHNdJDgk+ezFm/V5X12PL47xNHRY1VCU
   Q==;
X-CSE-ConnectionGUID: injOyIhRSqqfaCqTg9kgdg==
X-CSE-MsgGUID: 9FYKkqnbRBWXu03Eg12ZFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70515193"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="70515193"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:44:14 -0800
X-CSE-ConnectionGUID: NVwTJNBvR52UF+hyeUvrcg==
X-CSE-MsgGUID: 24bGEo8lQ5GZkoHlRYUHfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="211996049"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:44:13 -0800
Date: Sat, 24 Jan 2026 00:44:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the random tree
Message-ID: <aXP5um_qyYUmOzMd@smile.fi.intel.com>
References: <aXPso7beaFvlUYiP@sirena.org.uk>
 <aXPudNLOPmXd-U2O@smile.fi.intel.com>
 <f0a1812e-4235-4d32-ac72-f2d8f1cb0d5d@sirena.org.uk>
 <aXPzxa58ZA38QIG-@smile.fi.intel.com>
 <12f27fef-34d1-48ff-a89f-47df92bcb7c0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12f27fef-34d1-48ff-a89f-47df92bcb7c0@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jan 23, 2026 at 10:22:47PM +0000, Mark Brown wrote:
> On Sat, Jan 24, 2026 at 12:18:45AM +0200, Andy Shevchenko wrote:
> 
> > Okay, I need to reproduce that.
> 
> I'd suggest testing some other configs/arches too, the -next build gives
> up as soon as one thing errors out so there's possibly other things with
> issues.

Yeah, it was x86 builds that I tested.

-- 
With Best Regards,
Andy Shevchenko


