From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [bisected c64e09ce] sysctl command hung
 indefinitely
Date: Mon, 21 Aug 2017 21:57:31 +1000
Message-ID: <20170821215731.3b32d942@canb.auug.org.au>
References: <1503137971.28497.19.camel@abdul>
        <20170821075001.GA24530@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58469 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751814AbdHUL5f (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Aug 2017 07:57:35 -0400
In-Reply-To: <20170821075001.GA24530@dhcp22.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, sachinp <sachinp@linux.vnet.ibm.com>, Joonsoo Kim <js1304@gmail.com>

Hi Michal,

On Mon, 21 Aug 2017 09:50:01 +0200 Michal Hocko <mhocko@kernel.org> wrote:
>
> commit 69885605ee3ba681deb54021e3df645f46589ba1
> Author: Michal Hocko <mhocko@suse.com>
> Date:   Mon Aug 21 09:46:04 2017 +0200
> 
>     mmotm: mm-page_alloc-rip-out-zonelist_order_zone-fix
>     
>     Abdul has noticed that reading sysctl vm.numa_zonelist_order
>     read will never terminate. This is because of
>     http://lkml.kernel.org/r/20170714080006.7250-2-mhocko@kernel.org
>     where the reading side doesn't update ppos and so the reader will
>     never get 0. Return back to proc_dostring which does all the necessary
>     stuff.
>     
>     Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
>     Signed-off-by: Michal Hocko <mhocko@suse.com>

I have added that to linux-next for tomorrow.

-- 
Cheers,
Stephen Rothwell
