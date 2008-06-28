From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for June 26
Date: Sat, 28 Jun 2008 16:51:13 +0200
Message-ID: <20080628145113.GA26878@elte.hu>
References: <20080627010842.e1a0c4b5.sfr@canb.auug.org.au> <200806270138.53895.rjw@sisk.pl> <1214563913.10393.180.camel@pmac.infradead.org> <200806280104.17527.rjw@sisk.pl> <1214646863.2660.22.camel@jaswinder.satnam>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:38720 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751256AbYF1Ovv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 28 Jun 2008 10:51:51 -0400
Content-Disposition: inline
In-Reply-To: <1214646863.2660.22.camel@jaswinder.satnam>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jaswinder Singh <jaswinder@infradead.org>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, David Woodhouse <david.woodhouse@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, kernel-testers@vger.kernel.org, "Maciej W. Rozycki" <macro@linux-mips.org>


* Jaswinder Singh <jaswinder@infradead.org> wrote:

> No, firmware is same.
> 
> Our Firmware blob looks like this...
> 	u8 firmware_major
> 	u8 firmware_minor
> 	u8 firmware_fix
> 	u8 pad
> 	__be32 start_address
> 	__be32 length (total, including BSS sections to be zeroed)
> 	data... (in __be32 words, which is native for the firmware)
> 
> rest of data is same and you can see it manually.
> 
> I am surprise why Ingo is using hex dump and he finds different data.
> 
> And I did not received any feedback from Ingo yet.

sorry - it was just a drive-by comment i made to Rafael while i reacted 
to the x86 portion of his mail - i dont have this tg3 problem myself so 
there's nothing i could report or test. I only looked at the patch that 
was identified and the tg3FwText[] array appeared to be different - but 
as you explain it above, that is OK and the firmware image is the same.

	Ingo
