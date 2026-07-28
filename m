Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC933A6B92;
	Tue, 28 Jul 2026 04:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785213342; cv=none; b=cu2f/y/ESL/a7MShGDC1It113tqJssacGRkEQviOLhwyW5HriZXye/1WFZ3+5VqHIT9zP0ddeJN0RJK/HFLUj1YAxjqhsiYXGsR+q6MEQPJCmJFBThkc4K1NjIyyQrz6QETIRewur4XVtX5GIPIL5ysjac2DBQpJLW2yS6TN/ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785213342; c=relaxed/simple;
	bh=4IFu1pr6nWUxqOhwMlIt6rtmiqQQRV/7QBaY07DblTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVzhFOGGAmGW8K7DckKaCqqdcoVMj1hhoLtboCCjL53bKgPvkpqfqbBgBwab4mCFHz8KbwytUhMv6WUufE+87s2zWX07Nhra8PToPEdxS0l3qn6MSXoBxg6Y7wmoYEKw8fuZwYqlk+9l4t4ACuYnN7MmdhB2SkKO0bqTKW+t3Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KF96xcXq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KF96xcXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785213341; x=1816749341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4IFu1pr6nWUxqOhwMlIt6rtmiqQQRV/7QBaY07DblTw=;
  b=KF96xcXqVRP3BruPAbk+6JLuAW0dE5o6oISoum1vCjmYwINp7kL9neKs
   8OrOGnO8o7/nAjV/mQnmFRUNeQRf60MnlxMvIBsp7S9WPqWST27cdTGu4
   XRpkKGoNUY70Ao9qAs3R6c8K2l30SGptddC8FWsN6P+n7FaGRu+Nu3LpY
   V5Op4yxW+Y+rKbA5L608lm/KwxvGqNvJ87/aRSe8CVfmVF2Bow+ghfeZw
   dkKN1EO1opdoptgcQ6C/0X5fZ2rbQEQIJ4o/QcVpdrj1orkDkVYc3aSe2
   KDyeBCXHKlrVKACO0lXk/FA8neDmL29A8G2x7XJCZ+XlM7cqzg/LXP468
   A==;
X-CSE-ConnectionGUID: c/Gxzz9oQ9upO6IoHQ4OrQ==
X-CSE-MsgGUID: U0CfNXpiT+WVtq2TOKiNAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="103198350"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="103198350"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 21:35:40 -0700
X-CSE-ConnectionGUID: mnTc48WRTZmK8LjfTi4I2g==
X-CSE-MsgGUID: 0iCfD89bSHi7HrfhjoSi0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="255288036"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jul 2026 21:35:39 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id ADCAC99; Tue, 28 Jul 2026 06:35:37 +0200 (CEST)
Date: Tue, 28 Jul 2026 06:35:37 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Pan Chuang <panchuang@vivo.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the thunderbolt tree
Message-ID: <20260728043537.GO2365036@black.igk.intel.com>
References: <amdzcQ97eSeOg9C_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <amdzcQ97eSeOg9C_@sirena.org.uk>

On Mon, Jul 27, 2026 at 04:04:17PM +0100, Mark Brown wrote:
> Hi all,
> 
> After merging the thunderbolt tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/thunderbolt/pci.c:115:17: error: unused variable 'dev' [-Werror,-Wunused-variable]
>   115 |         struct device *dev = &pdev->dev;
>       |                        ^~~
> 1 error generated.  make[5]: ***
> 
> Caused by commit
> 
>    eef9f6d8c36f7 (thunderbolt: Remove redundant dev_err_probe())
> 
> I have used the tree from next-20260726 instead.

Thanks for the report Mark. I've dropped that commit from my tree now.

@Pan Chuang, please send an updated version where this variable is removed
as well.
