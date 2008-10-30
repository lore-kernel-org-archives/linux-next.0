From: Christoph Lameter <cl@linux-foundation.org>
Subject: Re: linux-next: manual merge of the cpu_alloc tree
Date: Thu, 30 Oct 2008 13:01:45 -0500 (CDT)
Message-ID: <Pine.LNX.4.64.0810301300590.29346@quilx.com>
References: <20081028165831.ff892db6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nlpi053.sbcis.sbc.com ([207.115.36.82]:56929 "EHLO
	nlpi053.prodigy.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753567AbYJ3SMT (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 30 Oct 2008 14:12:19 -0400
In-Reply-To: <20081028165831.ff892db6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

Note that the cpu_alloc patchset used to reside on top of the zero based 
with which we are conflicting now. If this is going to be a problem then 
Mike and I can get the old order reestablishwed.
