From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] SGI IA64 UV: fix ia64 build error in the linux-next
	tree
Date: Wed, 11 Feb 2009 13:32:49 +0100
Message-ID: <20090211123249.GE16535@elte.hu>
References: <20090209162520.GA4882@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:46791 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754781AbZBKMc7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Feb 2009 07:32:59 -0500
Content-Disposition: inline
In-Reply-To: <20090209162520.GA4882@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dean Nelson <dcn@sgi.com>
Cc: Tony Luck <tony.luck@intel.com>, Andrew Morton <akpm@linux-foundation.org>, linux-ia64 <linux-ia64@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>


* Dean Nelson <dcn@sgi.com> wrote:

> Fix the ia64 build error that occurs in the linux-next tree by introducing
> an ia64 version of uv.h.  Additionally, clean up the usage of is_uv_system().
> 
> Signed-off-by: Dean Nelson <dcn@sgi.com>
> Signed-off-by: Jack Steiner <steiner@sgi.com>

Applied, thanks Dean!

Tony, since this breakage is an accidental side-effect of the x86 tree (that
has to be fixed there), mind if we carry it there?

	Ingo
