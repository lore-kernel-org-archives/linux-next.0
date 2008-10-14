From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: manual merge of the kernel-doc tree
Date: Tue, 14 Oct 2008 10:43:23 -0700
Message-ID: <48F4DA3B.2090003@oracle.com>
References: <20081014181114.c069b145.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:32912 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751472AbYJNRns (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Oct 2008 13:43:48 -0400
In-Reply-To: <20081014181114.c069b145.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Kiyoshi Ueda <k-ueda@ct.jp.nec.com>

Stephen Rothwell wrote:
> Hi Randy,
> 
> Today's linux-next merge of the kernel-doc tree got a conflict in
> block/blk-core.c between commit d00e29fd99dd63d1c51917604e35dee824ed567f
> ("block: remove end_{queued|dequeued}_request()") from Linus' tree and
> commit bcbfb613cdca2d5c4c3f67ed428d7464abe7fb2f ("kerndoc-block-add")
> from the kernel-doc tree.
> 
> The former removed what the latter was modifying, so I just removed the
> code.

Hi Stephen,

Fixed & updated.  Better luck tomorrow.

Thanks,
~Randy
