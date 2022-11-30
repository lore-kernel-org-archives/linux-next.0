Return-Path: <linux-next-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42040C4321E
	for <linux-next@archiver.kernel.org>; Wed, 30 Nov 2022 17:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229700AbiK3RoJ (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Wed, 30 Nov 2022 12:44:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbiK3RoI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 30 Nov 2022 12:44:08 -0500
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBD24E427;
        Wed, 30 Nov 2022 09:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669830247; x=1701366247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7pGMD6HEPoc1TQnO2ruy3iXPYAWHi/zlaILqC5kWvMs=;
  b=LxjGx31awtl8h2bDiI8a0vwO1qed5YUMLV1BPDKWWpWR756Lb0fTThd/
   V4idRnahvkpzKfTDM9IljMtcoxog1TZBHDl04wehIfcoEKkoiMBTzXAp6
   zh7Zs4Pk4TDAI56m9abbxCd1mPVUQBuR3zTLE40jWqAZ8SfxUPJFL6m44
   hzOQRGcomddz0NSQrXbJ5wLhAr9Z1l0J89pniOdQMSwM+xaRVvr790CyO
   bu6oeT7wrxJZCNUelYFVE0VGb0ZPFFH4PNXH11qK9BlA7YCMXOoMdKeHS
   NdfoUQ55voPKgyabOJWzNDshLf6DyVfPyhr254J58wGb3qMS7GHb8OsLj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="313089326"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="313089326"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 09:43:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="594746511"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; 
   d="scan'208";a="594746511"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 30 Nov 2022 09:43:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1p0R7d-002NUN-0w;
        Wed, 30 Nov 2022 19:43:49 +0200
Date:   Wed, 30 Nov 2022 19:43:49 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the usb tree
Message-ID: <Y4eWVSmMjmntrq3U@smile.fi.intel.com>
References: <20221130131854.35b58b16@canb.auug.org.au>
 <Y4c11VtMQ64W1U+i@kroah.com>
 <Y4c3YwZqFGhJZN1L@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y4c3YwZqFGhJZN1L@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 30, 2022 at 12:58:43PM +0200, Andy Shevchenko wrote:
> On Wed, Nov 30, 2022 at 11:52:05AM +0100, Greg KH wrote:
> > On Wed, Nov 30, 2022 at 01:18:54PM +1100, Stephen Rothwell wrote:

...

> > Andy, I'm going to revert this series from the USB tree now, please fix
> > it up and resend.
> 
> Sure. I think I will rename in my series list_count() to list_count_nodes().
> This will be less invasive and should solve the issue(s).
> 
> $ git grep -n -lw list_count
> drivers/block/z2ram.c
> drivers/gpu/drm/i915/gt/intel_engine_cs.c
> drivers/scsi/hptiop.c
> drivers/scsi/hptiop.h
> drivers/xen/unpopulated-alloc.c
> 
> $ git grep -n -lw list_count_nodes

v5 had been sent.

-- 
With Best Regards,
Andy Shevchenko


