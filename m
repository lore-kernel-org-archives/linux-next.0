From: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 00/12] Thumb-2 kernel support
Date: Thu, 24 Jul 2008 09:28:32 +0100
Message-ID: <1216888112.27026.28.camel@pc1117.cambridge.arm.com>
References: <20080606173300.7930.31525.stgit@pc1117.cambridge.arm.com>
	 <20080630125110.1dc5689a.akpm@linux-foundation.org>
	 <1214901131.29199.31.camel@pc1117.cambridge.arm.com>
	 <20080701014529.272706d8.akpm@linux-foundation.org>
	 <1216829155.23395.19.camel@pc1117.cambridge.arm.com>
	 <20080723130140.ff016944.akpm@linux-foundation.org>
	 <1216847422.6550.8.camel@localhost.localdomain>
	 <20080723151045.bcae107e.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([193.131.176.58]:55449 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751855AbYGXI24 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 24 Jul 2008 04:28:56 -0400
In-Reply-To: <20080723151045.bcae107e.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.arm.linux.org.uk, linux-next@vger.kernel.org

On Wed, 2008-07-23 at 15:10 -0700, Andrew Morton wrote:
> On Wed, 23 Jul 2008 22:10:22 +0100
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> > To minimise the conflicts, what commit or tag id do you base your
> > current development branch on?
> 
> err, it's not that simple.  I just maintain plain old patches against
> linux-next.
> 
> Most git trees are based on current Linus mainline.

OK, it makes sense. I rebased the for-akpm branch onto Linus' latest git
tree.

-- 
Catalin
