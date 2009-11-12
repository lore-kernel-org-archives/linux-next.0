From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: linux-next: sysctl tree build failure
Date: Thu, 12 Nov 2009 01:11:34 -0800
Message-ID: <m1fx8kp0op.fsf@fess.ebiederm.org>
References: <20091112184805.1c0720cb.sfr@canb.auug.org.au>
	<m1ljicp3l0.fsf@fess.ebiederm.org>
	<20091112191451.d21250f2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from out02.mta.xmission.com ([166.70.13.232]:53397 "EHLO
	out02.mta.xmission.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751305AbZKLJLd (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 Nov 2009 04:11:33 -0500
In-Reply-To: <20091112191451.d21250f2.sfr@canb.auug.org.au> (Stephen Rothwell's message of "Thu\, 12 Nov 2009 19\:14\:51 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Eric,
>
> On Thu, 12 Nov 2009 00:08:59 -0800 ebiederm@xmission.com (Eric W. Biederman) wrote:
>>
>> Thank you, and my apologies.  I thought I had tried it with every
>> applicable compile option but apparently not.
>> 
>> Ugh.  It looks like I have a small refcount leak in that case as
>> well.  Blind I was.
>> 
>> Thank you very I will have this fixed shortly.
>
> Thanks.

Any clue how all_noconfig happened to have CONFIG_SYSCTL_SYSCALL set?

Eric
