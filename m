Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B97D3A7F54;
	Wed,  1 Apr 2026 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775056924; cv=none; b=jmVCrWr2Gm+FzgNBysmd/LUjG9IVvZRovKOe1PJF/Sr4GpzGfgoIzv7g0VNcokcLzgjQbPiqOy0v2/Pzy8Sps/qeaUo+GMWkfufBRL7lCclX02m5IKrjIdUAk9WQC7NiUMaCzNbZVNFeuWBJZQfFHdGy6cd6bkK4waR9kBBCu2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775056924; c=relaxed/simple;
	bh=YbMl7oT0McoISzWKpnwfjamnwvUqmAkC/IzebEcYdGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=owqW3rlXKgJfxCHMg0KsPbpt3KEdUKSyCm1t1hYfwU/EZ/2DD1c62euBdNGnePvrUfQR0uTyGcRUWvqE+X4zlxASYbzPq1fGSAiUwBMfCFkZ8yDr8U9aLwipRWZJXHEEqoaRo9gNKzCjYpuDl71CmYqf3GXmmT90hawbsR8ORzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpsd3d+v; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpsd3d+v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775056924; x=1806592924;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YbMl7oT0McoISzWKpnwfjamnwvUqmAkC/IzebEcYdGc=;
  b=kpsd3d+vZWW6Hy/pNwjZS4CARdt+Nd9Yfd9xIZ1+ZuNh9nj03eQJQG4e
   0phP+chjdbmWqNyj/qqesOIh5OySYtL3XBUSRe/so43pPGFBbAnH9KFyx
   Fz5CqVWDcQwhqIb4O98U+jUXCAFlwPpqq1GYjSLo4YmkMdVM4QhqkqjHa
   pCz10L3gVwKjx+7XE+DIilsiJ4Z8Y2GF86TEjyMe6008ACcphiY2RwCzg
   Jxvsp1CHsuOUys+Lc5uovU6htum0fsfeCR5oGxFfKNR4tIs8tCQFfHAtb
   /xrJukWoYOn/VhHn0DhtuLcyUd/HeiVBcBQ6UHsisKnq74ZNiIfdAKmZD
   g==;
X-CSE-ConnectionGUID: XtXFFsjcRwibSzKZhiZ4ig==
X-CSE-MsgGUID: dZoKE8CnRSeM/4zS/7KCkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86403696"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="86403696"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 08:21:58 -0700
X-CSE-ConnectionGUID: ZUo0B1KKTHqd+rUI/HUAgQ==
X-CSE-MsgGUID: 73ERnKdETbqpKFJs2abbxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="220042223"
Received: from aschende-mobl.amr.corp.intel.com (HELO [10.125.111.126]) ([10.125.111.126])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 08:21:57 -0700
Message-ID: <a600aee7-4d56-41eb-a170-38ae6902f103@intel.com>
Date: Wed, 1 Apr 2026 08:21:55 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the cxl tree
To: Mark Brown <broonie@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <aczyakZMFpvuVnlI@sirena.org.uk>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <aczyakZMFpvuVnlI@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/1/26 3:24 AM, Mark Brown wrote:
> Commit
> 
>   16413cc33cfd1 ("cxl/region: Fix use-after-free from auto assembly failure")
> 
> is missing a Signed-off-by from its author


Fixed. Thanks. 
