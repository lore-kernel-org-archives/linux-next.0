Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8A03537F3;
	Thu, 12 Mar 2026 14:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325333; cv=none; b=KhuAU8HKlpyy+RwSvCkRADtaizWCLvAZrZVT+UOBZzn0/syprpjxNgzFvnFQx7Yv5RIWTcwIi6RYg7cPoYJyTIubzDtfea2UuTRqVQ6txSn+p8EbBB8rpOvpQ3n78K2RRNMsmgpQRZXAptEFYHcz7suvnrBqpEGsWkHhf/8v8x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325333; c=relaxed/simple;
	bh=2XYkdyDQ12cbchUprVcqU7h9GMnu2o/JMlkakIcCesQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4G2IH8xgtZ0yBXuBDC8xoJEijX1HG32/JY6T3IaOSn27m2vrIxlmilnkFTWA/qecq+KCv3LuDK9LUa9lOULdmWUXfSE/DkLQAQhh5eDZvDZrCFSsDzbZkF4qjMG3jyFt5Jv6iAJLf01COi5RG/935wv5tL+5QOEfOTbnz+/oVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3vg0EmL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3vg0EmL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773325332; x=1804861332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2XYkdyDQ12cbchUprVcqU7h9GMnu2o/JMlkakIcCesQ=;
  b=n3vg0EmLeRW2AluHSe4jKpqlcWfKySfACgCEe3XWlV0Dql27S9kivup3
   ZX+I8otezk0U5j4b2VLZYqvlo+vdPhSVJZ2stlrQn/rXRhvFzyyrSiwdd
   ZL8YJDEjCTJgjZNtj0vDMhdukqqsxH32htOw9y0iaqMd8pMdjltmHxb6K
   04f37e2ioYd4A35b2FsWMm8fP0NSeR0NOzljBWRRAoJDxrkdQhZZZlUtW
   4ZxiqMzqFeXQ6zrRxOFSc/7kQLgSFCseOGlv5l1YzpHuynfwHSeoaHc5t
   ASZZpvCdJKNrQMpGFDDFRhUD0KWZBvFgE99K2CAKbHQujGZ5Iv7YYtvib
   w==;
X-CSE-ConnectionGUID: JpMpnJbWRCOz0DhVZ0PIAg==
X-CSE-MsgGUID: DL0aOVp2Rlmq1+GQyTATKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74501583"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74501583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 07:22:12 -0700
X-CSE-ConnectionGUID: EetHY9ibRcug8EKlx1AT9Q==
X-CSE-MsgGUID: tVmMas/+R4+r4dMIg61Y+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="220092333"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 07:22:10 -0700
Date: Thu, 12 Mar 2026 16:22:07 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mtd tree
Message-ID: <abLMD1d5ft4xyFgH@ashevche-desk.local>
References: <abK8KXC70RC2K_fW@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abK8KXC70RC2K_fW@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Mar 12, 2026 at 01:14:17PM +0000, Mark Brown wrote:
> Hi all,
> 
> After merging the mtd tree, today's linux-next build (KCONFIG_NAME)
> failed like this:
> 
> /tmp/next/build/drivers/mtd/maps/physmap-core.c: In function 'physmap_flash_of_init':
> /tmp/next/build/drivers/mtd/maps/physmap-core.c:367:23: error: implicit declaration of function 'of_flash_probe_bt1_rom'; did you mean 'of_flash_probe_ixp4xx'? [-Wimplicit-function-declaration]
>   367 |                 err = of_flash_probe_bt1_rom(dev, dp, &info->maps[i]);
>       |                       ^~~~~~~~~~~~~~~~~~~~~~
>       |                       of_flash_probe_ixp4xx
> 
> Caused by commit
> 
>    16d68d10f5b93 (mtd: physmap: physmap-bt1-rom: Remove not-going-to-be-supported code for Baikal SoC)
> 
> I have used the version from 20260311 instead.

Yeah, sorry for that, I will send a follow up that may be applied on top or
squashed with the original change.

-- 
With Best Regards,
Andy Shevchenko


