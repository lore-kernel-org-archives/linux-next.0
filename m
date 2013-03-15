From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: linux-next: manual merge of the l2-mtd tree with the mtd tree
Date: Fri, 15 Mar 2013 10:32:57 +0200
Message-ID: <1363336377.11441.115.camel@sauron.fi.intel.com>
References: <20130315115825.6c2b7ad9c48c82640ff9f3b8@canb.auug.org.au>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:10921 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752357Ab3COIcA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 15 Mar 2013 04:32:00 -0400
In-Reply-To: <20130315115825.6c2b7ad9c48c82640ff9f3b8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

On Fri, 2013-03-15 at 11:58 +1100, Stephen Rothwell wrote:
> Hi Artem,
> 
> Today's linux-next merge of the l2-mtd tree got a conflict in
> include/linux/mtd/nand.h between commit 5bc7c33ca93a ("mtd: nand:
> reintroduce NAND_NO_READRDY as NAND_NEED_READRDY") from the mtd tree and
> commit edac3311879c ("mtd: nand: remove AG-AND support") from the l2-mtd
> tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

Thanks Stephen, please, carry this one so far, I'll rebase my tree soon.

-- 
Best Regards,
Artem Bityutskiy
