Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2C242883E;
	Tue, 20 Jan 2026 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919859; cv=none; b=pQZDEpfwT+fwGCt5Q4gjZCbRDkrJJujquOkCnB54Ik8kFV0vXpEFQBEyCZJ7G6jb8o5fMSTXj70Wb1hJYp7QW6iyqMzh67DwG/MZculwIvdqIfSfoELINzB/M6np5Hnp1enWCTbrNgXlPSqPabHIH9qpdSvfO9vQncSEjuy7IuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919859; c=relaxed/simple;
	bh=ktoZiPD4sV0Sr90jexrbsSh8x19kSh4JwxlNAbAw0X0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rx1SxYioG8w78xsT2fXpODEIoRhVKNKzUTu53heddkyAO242rQk+Pr8r2NhFeiQoaeWNUA2oXOjv4OCzD+ybvGfLvIi+iGdKwT0UHre6t7LF6Ztab0XZ2/dkRxG17yX9wRtINHCI2BFAdDx2ZqS0v5DcjAMxXSxrQ3co66T4VJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kwoIkDxF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kwoIkDxF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768919857; x=1800455857;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ktoZiPD4sV0Sr90jexrbsSh8x19kSh4JwxlNAbAw0X0=;
  b=kwoIkDxFaQhQJPJYQ+f6nyy/nChfJCTjQk3XuPIyKR1vpQk52TVrL86a
   hS/9iuUtyFDWbSSTqVXJHKZ0Rtjm6qk/tvcgEw+c7GxMtZPtcG25mcPGP
   B0fcbkcvonUW3hUciT+nMkrObkoBKZpIfvrjyk3WHZCTcOdhobyJrJg6H
   1Ee6R2rM9SX5zDr7inc8SpS1R+Zz3wI5Cn6bkXyM3CkXWNvrFBFaAuCLH
   gLc3BhCO0X5NUa6RExN/x40lddNp/WgczJSivjHGwNks5ov9MEgkZYMVc
   ARGqrIWlhSiCapSPVqrelkbdsylQrHZ9m3mBiHfFaOahJJlzGX7Vs22PZ
   w==;
X-CSE-ConnectionGUID: 5gST6TCUTICo6LQMsT7ihA==
X-CSE-MsgGUID: B/xTp+AeS7ebtnkraB9fTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70183688"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70183688"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:37:37 -0800
X-CSE-ConnectionGUID: oXGGcwwpQ5G9D5u07jm8ig==
X-CSE-MsgGUID: dXJREl33Thy5ul3EYR2z9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="229074750"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:37:34 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Jan 2026 16:37:31 +0200 (EET)
To: Mark Brown <broonie@kernel.org>
cc: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the drivers-x86-fixes tree
In-Reply-To: <aW-LCX4W9qIWNSdx@sirena.org.uk>
Message-ID: <ee1f1510-2935-587c-d459-af9c1680c25c@linux.intel.com>
References: <aW-LCX4W9qIWNSdx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 20 Jan 2026, Mark Brown wrote:

> Commit
> 
>   bb820f17b68f6 ("platform/x86: hp-bioscfg: Fix kernel panic in GET_INSTANCE_ID macro")
> 
> is missing a Signed-off-by from its author

Thanks for the heads up.

The patch was submitted with Signed-off-by but git interpret-trailers --in-place
seems to mess the tag up for some reason.

-- 
 i.

