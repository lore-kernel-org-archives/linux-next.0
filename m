From: Jiri Slaby <jirislaby@gmail.com>
Subject: Re: linux-next: manual merge of the limits tree with Linus' tree
Date: Mon, 14 Dec 2009 11:10:45 +0100
Message-ID: <4B260F25.6070908@gmail.com>
References: <20091214143909.a7b6dcf1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.157]:43000 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755719AbZLNKKs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2009 05:10:48 -0500
In-Reply-To: <20091214143909.a7b6dcf1.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>

On 12/14/2009 04:39 AM, Stephen Rothwell wrote:
> Today's linux-next merge of the limits tree got a conflict in
> arch/ia64/kernel/sys_ia64.c between commit
> bb52d6694002b9d632bb355f64daa045c6293a4e ("Get rid of open-coding in
> ia64_brk()") from Linus' tree and commit
> d9ef7d0ce61f214180f505b78cdf8f9b3d862dfa ("IA64: use helpers for
> rlimits") from the limits tree.
> 
> The former removed the code that the latter was updating.  A merge with
> Linus' tree will fix this up, but it is pretty trivial anyway.

Hi.

Thanks, I fixed all 3 conflicts.

-- 
js
