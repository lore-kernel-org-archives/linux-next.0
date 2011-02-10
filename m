From: Nitin Gupta <ngupta@vflare.org>
Subject: Re: linux-next: manual merge of the staging tree with the staging.current
 tree
Date: Thu, 10 Feb 2011 16:54:24 +0530
Message-ID: <4D53CAE8.1060007@vflare.org>
References: <20110210163527.3b2cc580.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:38231 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755578Ab1BJLXq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 10 Feb 2011 06:23:46 -0500
In-Reply-To: <20110210163527.3b2cc580.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Jennings <rcj@linux.vnet.ibm.com>

On 02/10/2011 11:05 AM, Stephen Rothwell wrote:
>
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/zram/zram_drv.c between commit
> 5414e557fca545614ceedc3d3496f747457e2e3b ("staging: zram: fix data
> corruption issue") from the staging.current tree and commit
> 2787f959d6c5fb258d964218ac75346019f49ee9 ("zram: Return zero'd pages on
> new reads") from the staging tree.
>
> I fixed it up (I think - see below) and can carry the fix as necessary.

The fix looks correct to me. Thanks for fixing this.

Nitin
