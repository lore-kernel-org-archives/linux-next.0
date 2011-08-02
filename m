From: Jens Axboe <jaxboe@fusionio.com>
Subject: Re: linux-next: build warning after merge of the moduleh tree
Date: Tue, 2 Aug 2011 10:42:11 +0200
Message-ID: <4E37B863.4080700@fusionio.com>
References: <20110801132359.1de051cb8a4a2bdfdad7560c@canb.auug.org.au> <4E37A696.2090007@fusionio.com> <20110802183558.fda9e3b1e9f3b93a70f6e494@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.fusionio.com ([66.114.96.30]:35119 "EHLO mx1.fusionio.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752621Ab1HBImO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Aug 2011 04:42:14 -0400
In-Reply-To: <20110802183558.fda9e3b1e9f3b93a70f6e494@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mike Christie <michaelc@cs.wisc.edu>

On 2011-08-02 10:35, Stephen Rothwell wrote:
> Hi Jens,
> 
> On Tue, 2 Aug 2011 09:26:14 +0200 Jens Axboe <jaxboe@fusionio.com> wrote:
>>
>> Thanks, will you carry this until things are merged? Not easy for me to
>> fix up.
> 
> Yes, no problem.  It is possible that the module.h split may not even go
> into v3.1, in which case the fix patch will jst become part of the moduleh
> tree after the block tree is merged.
> 
> Though the feedback to the original patch writer is that they should have
> included module.h instead of relying on it being implicitly included.

That would arguably have been a much saner approach.

> You could include a patch to add an include of module.h to this file in
> your tree - that way even if the module.h split goes ahead, your tree
> won't get broken.  It could then be changed to the lighter weight
> export.h later.

OK, I will add that. Thanks.

-- 
Jens Axboe
