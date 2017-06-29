From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: unsigned commit in the libata tree
Date: Thu, 29 Jun 2017 10:22:15 -0400
Message-ID: <20170629142215.GA3531@htj.duckdns.org>
References: <20170629075415.6fc0e759@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yw0-f176.google.com ([209.85.161.176]:34823 "EHLO
        mail-yw0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753367AbdF2OWS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Jun 2017 10:22:18 -0400
Content-Disposition: inline
In-Reply-To: <20170629075415.6fc0e759@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Jun 29, 2017 at 07:54:15AM +1000, Stephen Rothwell wrote:
> Hi Tejun,
> 
> I appreciate the fix, but commit
> 
>   bb6133c54b97 ("libata: fix build warning from unused goto label")
> 
> has no Signed-off-by tag.

Oops, fixed.  Sorry about mess.  Thanks.

-- 
tejun
