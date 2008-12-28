From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [BUG] next-20081216 - WARNING: at kernel/smp.c:333
	smp_call_function_mask
Date: Sun, 28 Dec 2008 13:55:10 +0100
Message-ID: <20081228125510.GA10387@elte.hu>
References: <20081226181733.GA24439@elte.hu> <20081227071138.GA4530@linux.vnet.ibm.com> <4955DBBC.4070508@kernel.org> <20081227083758.GA12138@elte.hu> <20081227083936.GA12609@elte.hu> <20081227112125.GB4530@linux.vnet.ibm.com> <20081227112450.GA24150@elte.hu> <20081227115712.GC4530@linux.vnet.ibm.com> <20081227122632.GA18909@elte.hu> <20081227152918.GD4530@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:55737 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754071AbYL1Mz7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 28 Dec 2008 07:55:59 -0500
Content-Disposition: inline
In-Reply-To: <20081227152918.GD4530@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: Yinghai Lu <yinghai@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, David Howells <dhowells@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, mel@csn.ul.ie


* Kamalesh Babulal <kamalesh@linux.vnet.ibm.com> wrote:

> Hi Ingo,
> 
> 	kernel still crashes, with the updated patch.

hm, i thought we got all bugs fixed - could you try latest tip/master:

  http://people.redhat.com/mingo/tip.git/README

does it still crash in the same way? (if yes then please attach the new 
crashlog if it's easy to do)

Thanks,

	Ingo
