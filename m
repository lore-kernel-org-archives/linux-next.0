From: Jonathan Austin <Jonathan.Austin@arm.com>
Subject: Re: linux-next: manual merge of the arm-mpidr tree with the arm	tree
Date: Wed, 19 Jun 2013 09:39:39 +0100
Message-ID: <51C16E4B.4060809@arm.com>
References: <20130619104409.358078cdc4957fa6832f3413@canb.auug.org.au> <20130619082619.GA31513@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:41704 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933833Ab3FSIo7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Jun 2013 04:44:59 -0400
In-Reply-To: <20130619082619.GA31513@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Will Deacon <Will.Deacon@arm.com>

On 19/06/13 09:26, Russell King wrote:
> On Wed, Jun 19, 2013 at 10:44:09AM +1000, Stephen Rothwell wrote:
>> Hi Lorenzo,
>>
>> Today's linux-next merge of the arm-mpidr tree got a conflict in
>> arch/arm/kernel/suspend.c between commit aa1aadc3305c ("ARM: suspend: fix
>> CPU suspend code for !CONFIG_MMU configurations") from the arm tree and
>> commit 3fed6a1e3bf0 ("ARM: kernel: implement stack pointer save array
>> through MPIDR hashing") from the arm-mpidr tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary (no action
>> is required).
>>
>> P.S. that arm tree commit above has no Signed-off-by from its
>> committer :-(
>
> Oh bloody hell.  Now what do I do about that.  The branch is a declared
> stable branch, and the commit came in from someone elses tree.  So it's
> immutable...
>

Sorry guys, this was my first pull request and I didn't realise that,
though Will was the author, I needed to sign off on the patch too as *I*
had become the committer (I thought that Russell would become the
committer as this was going 'via' him, as it does when it goes through
Russell's patch system).

Apologies. I'll make sure this doesn't happen again...

Jonny




-- IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium.  Thank you.
