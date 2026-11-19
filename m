Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110531;
	b=GNEtMFlq5jPHXNi9mHwwThzpg4elW50Rb3xRtwMX1n63mXekZOoLO3GtlzbyLKCb5Ixi
	 fI9hGI7/zHEHEMGl1zoqRqZnUVoZgsgsnP7eWvc9a0hX3EyHtJEIwXNBkgF6Ug3vwHOZX
	 KXitPHChMKm1jl12C7h9D4ImdRBcDfjPOq+0T9Z4ydO/+iZXTUD1dL4JBT6AhLo8OjeC6
	 tuj9Dao4XOc7d9zXiNBKIBUttWMF4SSY0YYjFPwoCNVqUVe3irxZw/3VggKzRuK91sGwu
	 07MBZoYzJDKu54W1DQyqJ+JgVpmr7+kB8Xb2DiHUDHLZQDHrgV+xusFPrT/O6n1mFow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110531;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=juzIsGJrbHwJRBg9Tz55nWpau+n9tRXOv+2iyOnacXo=;
	b=HLr5HceROrUA4FJ5i16gXpwND31sJ8CRPLJXiCCCk1D/O/1YnEcbanSoFr810BcqfqTg
	 0Z9br++6t1pYqCLmnQwVb1A6kZKewYhJsLJNGSqCeymmqBdVrpUAWKmBKGkU5B4kg0zxa
	 LUEUK2wJePNtclmZuksNNmnsXtphIhZRW6fU0A8E4Ezoc3+L4rFPPjzz2vBqRiP4+WJBs
	 haJjPY0QAFCY7ze7x2O1p0K2u7g+n7d3VhnZHyLAq4/aR6C8yBK0eM0/SsaLk1nEKdg46
	 1isuNugTApXHseKi8fEGyblVA8zT3rPpsPsOIWmJ4KqaKjKjhtdOdg1VJz+e16Ssn3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NmQfptd5;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8593B606A325;
	Thu, 19 Nov 2026 17:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8593B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NmQfptd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795110531; x=1826646531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UlaoukuZS7x22+BAxbH31K4PW51oC55ssrBAHfL27s8=;
  b=NmQfptd56UBdYgQk1LZmg/od39PWjzwioEhObJi9n2oZq3x+fYcXUgfv
   6xlEHWz6qLyxmAcMo164piNIqWED8flskNOk8RicAPriVwDQxz9iM4syu
   9M1XNCcapppdzL+TRd4sER2lmbfLrBx4fCS46IzHd5hyuKDSFbZ8JvnIt
   lCLDgLY+v/Cqlj+Ipzh+W267CVzOywxs0ig66C4Bgu9wji5PNNuVO9V6p
   ow4Lo/mU9eRjPdntygiCfeL/uifBDmGbdw6x+JKGmVGmUflxehUXnnt1P
   Owz/YHUtu5neevq7C8i9Pmj+L5NjkaTU4zUn4I0QAniCuZaI8UAL5ngRQ
   Q==;
X-CSE-ConnectionGUID: hHXuyapvRTqpBKlhVuldqg==
X-CSE-MsgGUID: VzdHcjkKRA2o/EnwOLg3Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3870891"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3870891"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:48:50 -0800
X-CSE-ConnectionGUID: W3q+yw74TXq/u1ZspQOn6g==
X-CSE-MsgGUID: Arlvnx/bQgup7FqS2AkVHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10784061"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 09:48:48 -0800
Date: Thu, 19 Nov 2026 19:48:45 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Kees Cook <kees+treewide@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pinctrl-intel tree with the
 origin tree
Message-ID: <av82fbjKtHu6n66C@ashevche-desk.local>
References: <av8yCr4r_U8R_mul@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av8yCr4r_U8R_mul@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 19, 2026 at 05:29:46PM +0000, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the pinctrl-intel tree got a conflict in:
> 
>   drivers/pinctrl/intel/pinctrl-intel.c
> 
> between commit:
> 
>   4dd10fbbeb9c3 ("treewide: Convert devm_kmalloc() family to the devm_kmalloc_obj() family")
> 
> from the origin tree and commit:
> 
>   34925b925793b ("pinctrl: intel: define iterator variables inside for-loop")
> 
> from the pinctrl-intel tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, it is correct resolution.

-- 
With Best Regards,
Andy Shevchenko


