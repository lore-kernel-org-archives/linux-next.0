From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: linux-next: manual merge of the tip tree
Date: Fri, 18 Oct 2013 01:50:40 +0400
Message-ID: <20131017215040.GJ6789@moon>
References: <20131017212319.GS2443@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:53358 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762435Ab3JQVup (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 17 Oct 2013 17:50:45 -0400
Content-Disposition: inline
In-Reply-To: <20131017212319.GS2443@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 17, 2013 at 10:23:19PM +0100, Mark Brown wrote:
> Today's linux-next merge of the kvm-arm tree got conflicts in
> mm/mprotect.c between c3d16e1652 (mm: migration: do not lose soft dirty
> bit if page is in migration state) from Linus' tree and e920e14c (mm: Do
> not flush TLB during protection change if !pte_present &&
> !migration_entry) from the tip tree.
> 
> I've fixed up as below and can carry as required.
>

Thanks a lot, dirty bit handling looks good!

	Cyrill
