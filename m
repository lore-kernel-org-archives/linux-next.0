From: Li Zefan <lizf@cn.fujitsu.com>
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
Date: Wed, 17 Mar 2010 10:03:05 +0800
Message-ID: <4BA03859.4060300@cn.fujitsu.com>
References: <20100317125200.5deb72ba.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:54696 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751973Ab0CQCCI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Mar 2010 22:02:08 -0400
In-Reply-To: <20100317125200.5deb72ba.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Blum <bblum@andrew.cmu.edu>

Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next merge of the block tree got a conflict in
> block/Kconfig between commit 67523c48aa74d5637848edeccf285af1c60bf14a
> ("cgroups: blkio subsystem as module") from Linus' tree and commit
> 910ac735bad53ce54741a72a5b19ab69794ae069 ("block: make CONFIG_BLK_CGROUP
> visible") from the block tree.
> 
> I used the block tree version.

The merge is correct, thanks!
