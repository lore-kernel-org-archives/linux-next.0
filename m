From: "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: linux-next: manual merge of the xen tree with the tip tree
Date: Thu, 25 Aug 2011 16:12:33 -0700
Message-ID: <4E56D6E1.6030405@zytor.com>
References: <20110825142450.c84e02d8763cfd1a93411844@canb.auug.org.au> <4E5690C3.2050706@goop.org> <4E5693DD.2010307@zytor.com> <20110826090619.7588d424798f53a6f3621eb2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:54903 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750898Ab1HYXNT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Aug 2011 19:13:19 -0400
In-Reply-To: <20110826090619.7588d424798f53a6f3621eb2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Xen Devel <Xen-devel@lists.xensource.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>

On 08/25/2011 04:06 PM, Stephen Rothwell wrote:
>>
>> Stephen: the x86/spinlocks branch in the -tip tree is obsolete and
>> should be dropped.
> 
> That's a bit tricky as I get a rolled up tip tree.  The best I could do
> is revert the commit that merges the x86/spinlocks branch into
> auto-latest ...  I'll do that for today (unless something happens to the
> tip tree in the next hour).
> 

OK, let me bother Ingo about it.

	-hpa
