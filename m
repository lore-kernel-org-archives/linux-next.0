From: Darren Hart <dvhltc@us.ibm.com>
Subject: Re: linux-next: manual merge of the tip-core tree with Linus' tree
Date: Fri, 22 May 2009 11:18:09 -0700
Message-ID: <4A16EC61.5070307@us.ibm.com>
References: <20090521113902.3deb5031.sfr@canb.auug.org.au> <4A14D0FF.60202@us.ibm.com>	<20090522101939.0cba91da.sfr@canb.auug.org.au> <20090522155050.91e025e3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e6.ny.us.ibm.com ([32.97.182.146]:37194 "EHLO e6.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753191AbZEVSSS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 22 May 2009 14:18:18 -0400
In-Reply-To: <20090522155050.91e025e3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell wrote:
> Hi Darren, Thomas,
> 
> On Fri, 22 May 2009 10:19:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> I have made the changes you suggested for today since the -tip stuff has
>                                                                        ^^^
> has not
> 
>> filtered through yet.
> 
> The resolution patch now looks like below.

Looks right at a quick glance.  I just updated linux-2.6-tip and checked 
the "auto-core-next" branch.  I appears to have the necessary 
changes.... I believe since merge 74869023169c6b85383abc66877154a582b35798.

Thanks,

-- 
Darren Hart
IBM Linux Technology Center
Real-Time Linux Team
