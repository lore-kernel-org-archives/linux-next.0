From: Andi Kleen <andi@firstfloor.org>
Subject: Re: linux-next: hwpoison tree build failure
Date: Tue, 8 Dec 2009 10:51:47 +0100
Message-ID: <20091208095147.GS18989@one.firstfloor.org>
References: <20091208191418.79270012.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from one.firstfloor.org ([213.235.205.2]:53555 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752235AbZLHJvl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2009 04:51:41 -0500
Content-Disposition: inline
In-Reply-To: <20091208191418.79270012.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andi Kleen <andi@firstfloor.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 08, 2009 at 07:14:18PM +1100, Stephen Rothwell wrote:
> Hi Andi,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> ERROR: "set_migratetype_isolate" [mm/hwpoison-inject.ko] undefined!
> ERROR: "unset_migratetype_isolate" [mm/hwpoison-inject.ko] undefined!

Ah these symbols need to be exported and made sure to be enabled
in the Kconfig. Thanks I'll fix and push out a new tree.

-Andi

-- 
ak@linux.intel.com -- Speaking for myself only.
