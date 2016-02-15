From: Jiri Kosina <jikos@kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 15 Feb 2016 11:17:02 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1602151115480.22727@cbobk.fhfr.pm>
References: <20160210165514.412992a5@canb.auug.org.au> <20160210115507.f1521e162a8489c18b02048b@linux-foundation.org> <20160211075144.28db2f39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:54709 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751016AbcBOKRH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Feb 2016 05:17:07 -0500
In-Reply-To: <20160211075144.28db2f39@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Thu, 11 Feb 2016, Stephen Rothwell wrote:

> Or the trivial tree should be based on v4.5-rc1 not v4.3 (in which case 
> this patch belongs as part of ee49ac85bc24b946 (and presumably would 
> have been found in testing of the trivial tree alone).

This was indeed applied to wrong base, my error, sorry for that. I will 
drop this now from my tree and we'll merge it properly later; best thing 
would probably be to send it directly to Linus at the very end of merge 
window.

Thanks for noticing,

-- 
Jiri Kosina
SUSE Labs
