From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86: memtest: fix compile warning
Date: Thu, 11 Jun 2009 07:30:57 -0700
Message-ID: <4A311521.7000607@zytor.com>
References: <20090611112746.802a24cb.sfr@canb.auug.org.au> <20090611102927.GE12431@alberich.amd.com> <alpine.LFD.2.00.0906111512400.3372@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:47224 "EHLO
	terminus.zytor.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751849AbZFKR1c (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 11 Jun 2009 13:27:32 -0400
In-Reply-To: <alpine.LFD.2.00.0906111512400.3372@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andreas Herrmann <andreas.herrmann3@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Thomas Gleixner wrote:
> 
> But aside of that this code is confusing.
> 
> 	start_phys_aligned = ALIGN(start_phys, incr);
> 
> Why do we have to fiddle with the alignment. Are you really seing e820
> entries which are not 8 byte aligned ?
> 

I have personally seen those on real systems.

	-hpa

-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.
