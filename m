From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: build failure after merge of the net-next tree
Date: Mon, 23 Mar 2015 23:00:03 -0400 (EDT)
Message-ID: <20150323.230003.1242651745820752377.davem@davemloft.net>
References: <20150324134508.77b039a9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:60238 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752205AbbCXDAF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 Mar 2015 23:00:05 -0400
In-Reply-To: <20150324134508.77b039a9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: netdev@vger.kernel.org, viro@ZenIV.linux.org.uk, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, hch@lst.de, tadeusz.struk@intel.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 24 Mar 2015 13:45:08 +1100

> After merging the net-next tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> crypto/algif_skcipher.c: In function 'skcipher_async_cb':
> crypto/algif_skcipher.c:109:2: error: implicit declaration of function 'aio_complete' [-Werror=implicit-function-declaration]
>   aio_complete(iocb, err, err);
>   ^
> 
> Caused by commit a596999b7ddf ("crypto: algif - change algif_skcipher
> to be asynchronous") interacting with commit 04b2fa9f8f36 ("fs: split
> generic and aio kiocb") from the vfs tree.
> 
> I applied the following merge fix patch (which gets it building, but I
> am not sure if more is needed).

Ok, more conflicts wiht Al's vfs work.

This is starting to pile on, heavily...
