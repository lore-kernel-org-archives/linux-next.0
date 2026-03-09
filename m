Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7A1411607;
	Mon,  9 Mar 2026 19:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085867; cv=none; b=gnk46U7BVgLJQ+DoDBPxA+cXg2lPCZxhNaII0jq6r8UmdDswNqZXtRcufmKYNzxMw61YavLCeOCIml/fpGCBZJ3euI+9vRmv57LodYJrBL+DDYfvU2yRPYLOmqU3JRP3XHFj52kCOfXpLSbrH7evHZ/Y8IIlEaESGvm60CQ7k84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085867; c=relaxed/simple;
	bh=Dy1rA6o/S8VcaVk3fc+zGAcnCvboteWvZ0mTdUrXwu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzuQLpbFXzxSykZCMo6Z8iqNwsGjK2PEHCaf3Pliy+5TCO/Rsf5mhJOOzhRPXSN9b1gUJQMK9TmR3xmvQueIpHUZNR4uPyWQv0ksnY75A9pFvKOdo51JkRAqvKsK5BzNJboBqaxqVdV85z2HghP77OeqBiQZV2eIoYnIAe55zIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jYQsYUK3; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jYQsYUK3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773085864; x=1804621864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dy1rA6o/S8VcaVk3fc+zGAcnCvboteWvZ0mTdUrXwu0=;
  b=jYQsYUK3NramxuTk0PnPOp0CjrnD3iZqm51faz/kjPyINarXNGQlVTni
   xM3/ej+l6dF8H2hemeJJZWJonZ9yHpPSPl7UsDcuF+mq0BVlcjjql0Z3P
   7k0ckYWR3bepM6U9fsih72WP8DdunHlyzdoLfWIEm7q+GB8aRD18/Teog
   hNoV5zTlRQHylG/uSO+PwUa8YFpmoExltNA2LWTpnS4/jSHnyfMYA6AZu
   HzYWYXQ4zHf/obZ3x76Fu+Qs71I/AxpqCGxhlgFIP5DA6zoVGNFNeXQBe
   zBXxFsCoU3wvyukPzhHyv2bW0APQz25Txy0dXxwXWJB7czCtNC/U9Sv1W
   w==;
X-CSE-ConnectionGUID: eWnh1YDmR824uTvo9PnZ5w==
X-CSE-MsgGUID: KDvIIAFTQkWlotf8yWTC7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74199036"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="74199036"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 12:51:04 -0700
X-CSE-ConnectionGUID: KhkPoXZIQFWQBj18vKs/mg==
X-CSE-MsgGUID: 07B8u4noR66d5Dnb4p9yuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="216738165"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 09 Mar 2026 12:51:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id F2D1C98; Mon, 09 Mar 2026 20:51:01 +0100 (CET)
Date: Mon, 9 Mar 2026 20:51:01 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Tree for Mar 9
Message-ID: <aa8kpRLIdvA98N-J@black.igk.intel.com>
References: <aa8WV_KvEV_TFPPZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa8WV_KvEV_TFPPZ@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 09, 2026 at 06:49:59PM +0000, Mark Brown wrote:
> Hi all,
> 
> Changes since 20260306:

The 20260309 contains a file (some bug?) of more than 1GiB in size with interesting name:
": change inode->i_ino from unsigned long to u64" (without surrounding double quotes).

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/

Mode	Name	Size
-rw-r--r--	.clang-format	24291	logstatsplain
-rw-r--r--	.clippy.toml	374	logstatsplain
-rw-r--r--	.cocciconfig	59	logstatsplain
-rw-r--r--	.editorconfig	566	logstatsplain
-rw-r--r--	.get_maintainer.ignore	270	logstatsplain
-rw-r--r--	.gitattributes	105	logstatsplain
-rw-r--r--	.gitignore	2238	logstatsplain
-rw-r--r--	.mailmap	54433	logstatsplain
-rw-r--r--	.pylintrc	66	logstatsplain
-rw-r--r--	.rustfmt.toml	369	logstatsplain
-rw-r--r--	: change inode->i_ino from unsigned long to u64	1173300385	logstatsplain
-rw-r--r--	COPYING	496	logstatsplain
-rw-r--r--	CREDITS	107693	logstatsplain
...

Please, drop this stuff, and remake the tag.

-- 
With Best Regards,
Andy Shevchenko


