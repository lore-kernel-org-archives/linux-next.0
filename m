From: Asai Thambi S P <asamymuthupa@micron.com>
Subject: Re: linux-next: manual merge of the akpm tree with the block tree
Date: Tue, 15 Jan 2013 20:03:07 +0530
Message-ID: <50F568A3.3060602@micron.com>
References: <20130114145816.397108bb0b1aec82e77d5a7a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from masquerade.micron.com ([137.201.242.130]:5408 "EHLO
	masquerade.micron.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756345Ab3AOOgl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Jan 2013 09:36:41 -0500
In-Reply-To: <20130114145816.397108bb0b1aec82e77d5a7a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sam Bradshaw <sbradshaw@micron.com>, Jens Axboe <axboe@kernel.dk>, Kent Overstreet <koverstreet@google.com>

On 1/14/2013 9:28 AM, Stephen Rothwell wrote:

> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in
> drivers/block/mtip32xx/mtip32xx.c between commit 16c906e51c6f ("mtip32xx:
> Add workqueue and NUMA support") from the  tree and commit "mtip32xx:
> convert to batch completion" from the akpm tree.
> 
> I couldn't see how to fix up the conflicts, so I just dropped the akpm
> tree patch.
> 

I will fix this and send out the patch.

--
Regards,
Asai
