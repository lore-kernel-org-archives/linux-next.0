Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E3830C631;
	Wed, 15 Apr 2026 14:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776263174; cv=none; b=WZt2b5t86a29mIi66/JGeZNSyyM6+Krx0N2vdXBHRYtrSeJPnlvTZqu9+KsT6aI0eHd0NXBuo+QCSR6Edr0x9/RplrXFKG8D/fcVX2SxUjPK9YoNdychFE6tP/7iKoBiHWWivvR9Z/MjuRaE0/EUKz+9JaC6YOCu4lmnUCV4dbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776263174; c=relaxed/simple;
	bh=RSueRU8EklLeI/w5J8cftxdUjuHFxU1yWrCgyi1xq4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqwTrAew09InQTKtAz6RSPCZuno9R4SMDbvnVf9AC+GbzexCPhN+h7JKFfXkYpwhwLH1y5FUty/OjNiDurzh5613/FwyYsVg3ChjVG6NQbDV0Al/Ybs892LE7b8eMtxWt4r4R1IGxYchePSnjkkQvqQE+RRZprDcaKdyFnjiEkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f95s+nPC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f95s+nPC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776263173; x=1807799173;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RSueRU8EklLeI/w5J8cftxdUjuHFxU1yWrCgyi1xq4k=;
  b=f95s+nPC0Q66dT0yP8FbOOpFXZBJe0EwHvbX4rQsGsBab08eUGzqhkEO
   E32HsapGGl4clwjxE2QYprFYmNwhZlKGDfTuBY2ltUIMfy42fWUz5MaBm
   lF/dYnvAkBy4e9V/16X4Mzm/tXu9Xvn9dnu5gX65cl2NpK0SsKGj92f4P
   T7/V6mvOUgvolSvya46GEYTUtjBQqhunHRSa7iiayO2wFwsKLVXmPRtHv
   WUkgiHf7VVyZieVrE54RTw79NEQwFVHrkwmAInFek9tEenfv7WaHIErVk
   pEFgaHtuhxM+hNztWrdjPP/VD0ib60t6IAaP3uJoFQkHl5qwbbxSR9v+c
   g==;
X-CSE-ConnectionGUID: BJ0FXlAQTLaJQ286TCMkdw==
X-CSE-MsgGUID: sRZJr9nkRfyhpLVWHdURxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77423473"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77423473"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 07:26:13 -0700
X-CSE-ConnectionGUID: YqUucAghRXSP92Rqxdd/dQ==
X-CSE-MsgGUID: HdXzh76ES3ujmcVn1KfxVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234466918"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Apr 2026 07:26:11 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD1Bw-000000000Zd-2oop;
	Wed, 15 Apr 2026 14:26:08 +0000
Date: Wed, 15 Apr 2026 22:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <202604152229.1a2cJtU9-lkp@intel.com>
References: <adjrVagmLJaozz5o@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adjrVagmLJaozz5o@sirena.co.uk>

Hi Mark,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on isilence/zcrx/for-next]
[cannot apply to linus/master v7.0 next-20260414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Brown/linux-next-build-failure-after-merge-of-the-block-tree/20260415-013341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/adjrVagmLJaozz5o%40sirena.co.uk
patch subject: linux-next: build failure after merge of the block tree
config: loongarch-randconfig-001-20260415 (https://download.01.org/0day-ci/archive/20260415/202604152229.1a2cJtU9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604152229.1a2cJtU9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604152229.1a2cJtU9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/zcrx.c:812:8: error: call to undeclared function 'netif_mp_open_rxq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     812 |         ret = netif_mp_open_rxq(ifq->netdev, if_rxq, &mp_param, NULL);
         |               ^
   io_uring/zcrx.c:812:8: note: did you mean 'net_mp_open_rxq'?
   include/net/page_pool/memory_provider.h:26:5: note: 'net_mp_open_rxq' declared here
      26 | int net_mp_open_rxq(struct net_device *dev, unsigned ifq_idx,
         |     ^
   1 error generated.


vim +/netif_mp_open_rxq +812 io_uring/zcrx.c

   781	
   782	static int zcrx_register_netdev(struct io_zcrx_ifq *ifq,
   783					struct io_uring_zcrx_ifq_reg *reg,
   784					struct io_uring_zcrx_area_reg *area)
   785	{
   786		struct pp_memory_provider_params mp_param = {};
   787		unsigned if_rxq = reg->if_rxq;
   788		int ret;
   789	
   790		ifq->netdev = netdev_get_by_index_lock(current->nsproxy->net_ns,
   791							reg->if_idx);
   792		if (!ifq->netdev)
   793			return -ENODEV;
   794	
   795		netdev_hold(ifq->netdev, &ifq->netdev_tracker, GFP_KERNEL);
   796	
   797		ifq->dev = netdev_queue_get_dma_dev(ifq->netdev, if_rxq);
   798		if (!ifq->dev) {
   799			ret = -EOPNOTSUPP;
   800			goto netdev_put_unlock;
   801		}
   802		get_device(ifq->dev);
   803	
   804		ret = io_zcrx_create_area(ifq, area, reg);
   805		if (ret)
   806			goto netdev_put_unlock;
   807	
   808		if (reg->rx_buf_len)
   809			mp_param.rx_page_size = 1U << ifq->niov_shift;
   810		mp_param.mp_ops = &io_uring_pp_zc_ops;
   811		mp_param.mp_priv = ifq;
 > 812		ret = netif_mp_open_rxq(ifq->netdev, if_rxq, &mp_param, NULL);
   813		if (ret)
   814			goto netdev_put_unlock;
   815	
   816		ifq->if_rxq = if_rxq;
   817		ret = 0;
   818	netdev_put_unlock:
   819		netdev_unlock(ifq->netdev);
   820		return ret;
   821	}
   822	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
