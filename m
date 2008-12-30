From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 00/14] Kernel memory leak detector
Date: Mon, 29 Dec 2008 16:23:10 -0800
Message-ID: <20081229162310.705a25fe.akpm@linux-foundation.org>
References: <20081219181255.7778.52219.stgit@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:47270 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752539AbYL3AXU (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 19:23:20 -0500
In-Reply-To: <20081219181255.7778.52219.stgit@pc1117.cambridge.arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Fri, 19 Dec 2008 18:12:56 +0000
Catalin Marinas <catalin.marinas@arm.com> wrote:

> A new kmemleak version is available. Thanks to all who reviewed the code
> and provided feedback.

There are a largeish number of trivialish rejects against all the
pending 2.6.29 code.  Fairly easily fixed.

I merge these patches into my tree, but I'd like to drop them again ;)

> Kmemleak can also be found on this git tree:
> 
> git://linux-arm.org/linux-2.6.git kmemleak

Please prepare and maintain a tree for inclusion in linux-next shortly
after 2.6.29-rc1 is released.




What is the track record of this code?  Has it found many leaks?  Do
we expect that it will find sufficient leaks of sufficient importance
to justify kmemleak's inclusion and maintenance?


I'm a little doubtful personally.  We often fix leaks, and they are
almost always things which nobody noticed at runtime, and which were
found by code inspection or source-code checking tools.  And they're
usually leaks which nobody would care about much anyway?
