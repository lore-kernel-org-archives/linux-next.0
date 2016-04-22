From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Apr 22 (adjust_autoksyms.sh)
Date: Fri, 22 Apr 2016 09:52:20 -0700
Message-ID: <571A56C4.7030907@infradead.org>
References: <20160422153503.24aa389e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42651 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753881AbcDVQw0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 22 Apr 2016 12:52:26 -0400
In-Reply-To: <20160422153503.24aa389e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, nicolas.pitre@linaro.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On 04/21/16 22:35, Stephen Rothwell wrote:
> Hi all,
> 
> There will be no linux-next release on Monday (ANZAC Day).
> 
> Changes since 20160421:
> 

on x86_64:

I'm seeing:

/bin/sh: scripts/adjust_autoksyms.sh: No such file or directory
/local/lnx/next/linux-next-20160422/Makefile:937: recipe for target 'vmlinux' failed

when using O=subdir for the build output directory.


Is there a missing $(objtree) somewhere?

thanks,

-- 
~Randy
