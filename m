Return-Path: <linux-next-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4548C7EE23
	for <linux-next@archiver.kernel.org>; Thu,  1 Jun 2023 06:27:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbjFAG1j (ORCPT <rfc822;linux-next@archiver.kernel.org>);
        Thu, 1 Jun 2023 02:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231734AbjFAG1M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 1 Jun 2023 02:27:12 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8F33B186;
        Wed, 31 May 2023 23:27:10 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9093C1063;
        Wed, 31 May 2023 23:27:55 -0700 (PDT)
Received: from bogus (unknown [10.57.96.86])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1D613F7D8;
        Wed, 31 May 2023 23:27:08 -0700 (PDT)
Date:   Thu, 1 Jun 2023 07:27:06 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the scmi tree
Message-ID: <20230601062706.prsbojeabi7u3h4y@bogus>
References: <20230601114014.52b6dd99@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230601114014.52b6dd99@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 01, 2023 at 11:40:38AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in driver-core.current tree as different
> commits (but the same patches):
> 
>   78c5fa2c98af ("drivers: base: cacheinfo: Update cpu_map_populated during CPU Hotplug")
>   3e871b199c9f ("drivers: base: cacheinfo: Fix shared_cpu_map changes in event of CPU hotplug")
> 
> These are commits
> 
>   c26fabe73330 ("drivers: base: cacheinfo: Update cpu_map_populated during CPU Hotplug")
>   126310c9f669 ("drivers: base: cacheinfo: Fix shared_cpu_map changes in event of CPU hotplug")
> 
> in the driver-core.current tree.
>

Sorry for that, I did drop those patches from my branch locally but failed
to push it after Greg applied those patches. It shouldn't happen tomorrow
as the branch is now properly pushed.

-- 
Regards,
Sudeep
