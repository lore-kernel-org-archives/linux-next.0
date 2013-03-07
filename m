From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: Multiple for-next branches from same tree
Date: Thu, 7 Mar 2013 17:55:21 +0530
Message-ID: <51388731.5020805@synopsys.com>
References: <51382DCA.5010209@synopsys.com> <20130307222446.d2b14a7a3785ef99dbf098b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from us02smtp1.synopsys.com ([198.182.60.75]:50871 "EHLO
	vaxjo.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751229Ab3CGM0I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Mar 2013 07:26:08 -0500
In-Reply-To: <20130307222446.d2b14a7a3785ef99dbf098b8@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>

On Thursday 07 March 2013 04:54 PM, Stephen Rothwell wrote:
> Hi Vineet,
>
> On Thu, 7 Mar 2013 11:33:54 +0530 Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>> With ARC arch merged in 3.9-rc1 I feel the need for a revised workflow.
>>
>> I intend to have 2 branches for -next exposure: for-curr and for-next.
>> * for-curr would contain the bug fixes for this release to be sent to Linus at
>> some point in time.
>> * for-next obviously is next release stuff and will be rebased off for-curr.
> I have several sets of branches like that and it works fine.
>
> Occasionally, the branches will conflict, but that can be sorted by
> merging the for-curr branch into the for-next branch after Linus has
> merged the for-curr branch.

Thanks for your reply Stephen. In that case, can you add the following additional
arc branch to -next

git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git for-curr


-Vineet
