From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: ia64 dies in slab code on next-20120906
Date: Mon, 10 Sep 2012 17:52:18 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F19D3C056@ORSMSX108.amr.corp.intel.com>
References: <CA+8MBbKmaaiEJ363E2PU-=6KJ4u+ZsQ1ywjb0nWMrp4xaSCeLw@mail.gmail.com>
 <20120907112606.7d09e84c4782b748a95e1946@canb.auug.org.au>
 <00000139a722a761-bafedf19-81a0-4922-a522-a2bb0fbb951a-000000@email.amazonses.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:5915 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754070Ab2IJRwU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 10 Sep 2012 13:52:20 -0400
In-Reply-To: <00000139a722a761-bafedf19-81a0-4922-a522-a2bb0fbb951a-000000@email.amazonses.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>

-	kmem_cache = (void *)__get_free_pages(GFP_NOWAIT, order);
+	kmem_cache = (void *)__get_free_pages(GFP_NOWAIT|__GFP_ZERO, order);

This patch is in next-20120910 ... which boots just fine on ia64. Thanks.

> Thanks for testing. My daughter has been in the ICU since Thursday and I
> had to guess that this was the right solution based on what I was able
> to glean on from experiences of others with the issue. Never was able to
> truly test the fix or even do a kernel build while the crisis was going
> on here. She just was moved out of the ICU an hour ago so I will be
> able to do more next week.

If only medical science worked like computer science. A couple of people
around the world see some symptoms and do some superficial diagnosis
and within hours you have a one line patch to make it all better.

Best wishes for a speedy recovery for your daughter.

-Tony
