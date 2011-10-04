From: Samuel Ortiz <sameo@linux.intel.com>
Subject: Re: linux-next: build failure in drivers/mfd/aat2870-core.c
Date: Tue, 4 Oct 2011 12:37:51 +0200
Message-ID: <20111004103751.GX4118@sortiz-mobl>
References: <4E839B53.3010201@windriver.com>
 <D9A2FA38A1E15B4E832469E5FE40C7ABFA07D3E667@HKMAIL01.nvidia.com>
 <CAMfhKb9dTY_OemQAgJokHn=DzaHn2hpi8UHRGvtFOv7a0SEjkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:21869 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755701Ab1JDKeu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 4 Oct 2011 06:34:50 -0400
Content-Disposition: inline
In-Reply-To: <CAMfhKb9dTY_OemQAgJokHn=DzaHn2hpi8UHRGvtFOv7a0SEjkg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jin Park <jinyoungp@nvidia.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org

Hi Jin,

On Fri, Sep 30, 2011 at 08:47:41PM +0900, Jin Park wrote:
> Hi, Paul
> 
> I have checked aat2870-core.c build problem when x86_64 and got the
> same error with you.
> 
> This error occurred since merged below change.
> ----------------------------------------------------------------------------------
> commit da417bacc9143b934f1a480a25d0fb2bb648a820
> Author: Stephen Boyd <sboyd@codeaurora.org>
> Date:   Wed Sep 28 10:50:29 2011 +1000
> 
>     x86: implement strict user copy checks for x86_64
> ----------------------------------------------------------------------------------
> The above change is check object size and copy size for
> copy_from_user() to prevent overflow.
> 
> The root cause is not matched type of size parameter for
> copy_from_user() in aat2870-core.c for x86_64.
> Because I just passed int type for size parameter to copy_from_user().
> It has no problem for i386, but has problem for x86_64.
> 
> 
> This is the patch for this build problem. Please review it.
I applied this patch and fixed the changelog to be slightly more descriptive.
Thanks a lot for the fix.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
