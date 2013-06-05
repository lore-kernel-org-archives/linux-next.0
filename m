From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: bad merge in the libata tree
Date: Tue, 4 Jun 2013 19:51:04 -0700
Message-ID: <20130605025104.GN14916@htj.dyndns.org>
References: <20130605101339.16b56c6fc7e17092798d9ea9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:48235 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750905Ab3FECvI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 4 Jun 2013 22:51:08 -0400
Content-Disposition: inline
In-Reply-To: <20130605101339.16b56c6fc7e17092798d9ea9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 05, 2013 at 10:13:39AM +1000, Stephen Rothwell wrote:
> Hi Tejun,
> 
> The top commit of the libata tree is a merge that leaves some conflict
> markers in drivers/ata/sata_rcar.c ...
> 
> I will use yesterday's tree for today.

Sorry, I messed up while moving a sata_rcar build warning fix patch
from for-3.11 to for-3.10-fixes.  My apologies.  Fixed up.  Should be
okay now.

Thanks a lot.

-- 
tejun
