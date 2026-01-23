Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C085263C8F;
	Fri, 23 Jan 2026 21:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769205370; cv=none; b=HBh/PMWQ8oRiB1whsNiSqbgD9XSibq4wLrw4z3njF97wuHlJ1HoHni992jBB3IOiXZBrd4SheNm/V3blPPH7I0HHD7CDYce4sd2+KEzftF4IEMprp31YuCLpPUqJO7+9HHY28/7T3C4KFsefgzt7rWzmU3v7XxRHWHe057vxc3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769205370; c=relaxed/simple;
	bh=sPOcBCqn/5JwUYE+zeznvFjH3BB7yj/c6pbdHknf75s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OA1LmZp9cqwBDrhyrHVgVMSmka9U9MjtVMsMN1p5cat1eRRFlDe/IkTBTvtSf9gpGibzNgKF+ACzau1xqEr34jCYj5hUMeSHSPmIXkx2tQTWAMCw+p+VrWPIclcAZNFb/7vEIthzFY5sJNEKvoxx4olJeRsUt2hcEMymZX175yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjzXZz7H; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjzXZz7H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769205369; x=1800741369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sPOcBCqn/5JwUYE+zeznvFjH3BB7yj/c6pbdHknf75s=;
  b=hjzXZz7HTxGsOnneHN/E/cq7ZlfIuI0Dh3jbSMxwL9tDQGutDTRy3SpF
   YJYa6JMv4m3TbPgt4qpLS4AFV5JQHmteyDiRD1Rl/TUb6Xwsr1gP40lhc
   ayzeFj21/nwf308I4oDrla42ghhWgr/26HWINEGfp6R3rGAW8AgnN0OcP
   Gdl0qfkJtqr6SQg154fy5eAG/5IJIMn1bP+JoCpQZEuSB0p7ryufMl1/O
   PAlyZdcXJWZkHiwM+DFVKpmQXZl48N65hJPf9RQ/VpHHT/57KV9fhTixa
   hfDvu22jYj4ctXuyMVqLz1kdrTluPT9778F2fHTFgQCEFiNHxRcQ2o4CM
   w==;
X-CSE-ConnectionGUID: e3mc5vImT2+ebuzMVBEAKw==
X-CSE-MsgGUID: aKUkMVe+SX6CPXWlli2YmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70550407"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70550407"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:56:08 -0800
X-CSE-ConnectionGUID: +FwLtKxHSUespqFkVA8cEw==
X-CSE-MsgGUID: pHLDgP/fS+6Hu4YK/7G1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="207552958"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.112])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 13:56:06 -0800
Date: Fri, 23 Jan 2026 23:56:04 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the random tree
Message-ID: <aXPudNLOPmXd-U2O@smile.fi.intel.com>
References: <aXPso7beaFvlUYiP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXPso7beaFvlUYiP@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jan 23, 2026 at 09:48:19PM +0000, Mark Brown wrote:
> Hi all,
> 
> After merging the random tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from /tmp/next/build/include/linux/smp.h:119,
>                  from /tmp/next/build/include/linux/lockdep.h:14,
>                  from /tmp/next/build/include/linux/spinlock.h:63,
>                  from /tmp/next/build/include/linux/sched.h:37,
>                  from /tmp/next/build/arch/arm/kernel/asm-offsets.c:13:
> /tmp/next/build/arch/arm/include/asm/smp.h:73:43: warning: 'struct completion' declared inside parameter list will not be visible outside of this definition or declaration
>    73 | extern int register_ipi_completion(struct completion *completion, int cpu);
>       |                                           ^~~~~~~~~~

Thank you for the report.

> Caused by commit
> 
>    cb2d25278d5ff (random: don't use "proxy" headers)
> 
> I have used the tree from 20260122 instead.

Wouldn't adding

struct completion;

at the top of arch/arm/include/asm/smp.h fix this?

-- 
With Best Regards,
Andy Shevchenko


