From: Li Zefan <lizf@cn.fujitsu.com>
Subject: Re: linux-next: Tree for February 3 (can't boot)
Date: Thu, 05 Feb 2009 10:43:49 +0800
Message-ID: <498A5265.9020107@cn.fujitsu.com>
References: <20090203173616.ef3dec8a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([222.73.24.84]:63544 "EHLO song.cn.fujitsu.com"
	rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1756271AbZBECob (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Feb 2009 21:44:31 -0500
In-Reply-To: <20090203173616.ef3dec8a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20090202:
> 

I can't boot up linux-next-20090203. When booting, The box reset itself
immediately, before I can see anything.

I was not using pure linux-next. I was using mm tree, but it failed to
boot, so I did "quilt pop linux-next.patch", and there were still some
bug-fix patches before linux-next.patch.

Haven't tried 20090204.
