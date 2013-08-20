From: Andi Kleen <andi@firstfloor.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Tue, 20 Aug 2013 02:52:34 +0200
Message-ID: <20130820005234.GX19750@two.firstfloor.org>
References: <20130819142633.82fb06bfa3bc0276fb09cbea@canb.auug.org.au>
 <20130819065817.GB23742@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from one.firstfloor.org ([193.170.194.197]:56693 "EHLO
	one.firstfloor.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751652Ab3HTAwh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 Aug 2013 20:52:37 -0400
Content-Disposition: inline
In-Reply-To: <20130819065817.GB23742@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andi Kleen <andi@firstfloor.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>

> > Introduced by commit 9a55fdbe941e ("x86, asmlinkage, paravirt: Add
> > __visible/asmlinkage to xen paravirt ops").  The 2 definitions used to be
> > identical ... maybe there should be only one.
> 
> Andi, please send a fix for this build warning, against 
> tip:x86/asmlinkage.

I resent the patch. Thanks for the headsup.
-Andi
