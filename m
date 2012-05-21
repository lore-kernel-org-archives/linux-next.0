From: Cyrill Gorcunov <gorcunov@openvz.org>
Subject: Re: linux-next: manual merge of the akpm tree with Linus' tree
Date: Mon, 21 May 2012 12:16:44 +0400
Message-ID: <20120521081644.GB7767@moon>
References: <20120521181347.51d96de343880746c9b285b4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:48610 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751405Ab2EUIQv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 May 2012 04:16:51 -0400
Content-Disposition: inline
In-Reply-To: <20120521181347.51d96de343880746c9b285b4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>

On Mon, May 21, 2012 at 06:13:47PM +1000, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in
> fs/proc/base.c between commit eb94cd96e05d ("fs, proc: fix ABBA deadlock
> in case of execution attempt of map_files/ entries") from Linus' tree and
> commit "proc: unify ptrace_may_access() locking code" from the akpm tree.
> 
> I used the version of the conflicting code from Linus' tree.

Hi Stephen, gimme some time to take a look on...

	Cyrill
