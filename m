From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: linux-next: kmemleak tree build failure
Date: Thu, 30 Jul 2009 09:58:57 +0100
Message-ID: <1248944337.3376.5.camel@pc1117.cambridge.arm.com>
References: <20090730160012.5814e251.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:40862 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751236AbZG3I7E (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 30 Jul 2009 04:59:04 -0400
In-Reply-To: <20090730160012.5814e251.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2009-07-30 at 16:00 +1000, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> arch/x86/kernel/process.c: In function 'free_thread_info':
> arch/x86/kernel/process.c:58: error: implicit declaration of function 'kmemleak_free'
> 
> Caused by commit 3d898087320a732ec853c98f244253892616840f ("kmemleak:
> Inform kmemleak about kernel stack allocation") from the kmemleak tree.
> Probably a missing include of linux/kmemleak.h.

Yes, it's missing this (I was only testing it with slub which has
kmemleak.h included in its header file).

I updated the kmemleak branch now. Thanks.

-- 
Catalin
