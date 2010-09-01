From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH next&mainline] oprofile: fix build when CONFIG_PM is
 disabled
Date: Wed, 1 Sep 2010 18:52:11 +0200
Message-ID: <20100901165211.GA22093@elte.hu>
References: <20100901133614.2580f238.sfr@canb.auug.org.au>
 <20100901094132.e734ad94.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:58104 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755658Ab0IAQw0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Sep 2010 12:52:26 -0400
Content-Disposition: inline
In-Reply-To: <20100901094132.e734ad94.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Robert Richter <robert.richter@amd.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>


* Randy Dunlap <randy.dunlap@oracle.com> wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Using do/while for a function-returning-a-value does not
> make gcc happy, so change it to a static inline function.
> (happens when CONFIG_PM is not enabled)
> 
> arch/x86/oprofile/nmi_int.c:784: error: expected expression before 'do'

Yeah, i reported this to Robert a few hours ago, with the same suggested 
solution.

Thanks,

	Ingo
