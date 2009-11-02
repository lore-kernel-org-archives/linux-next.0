From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: percpu/kvm/tip tree build failure
Date: Mon, 2 Nov 2009 11:28:30 +0100
Message-ID: <20091102102830.GA3724@elte.hu>
References: <20091102161722.eea4358d.sfr@canb.auug.org.au> <4AEEAA82.8070705@redhat.com> <20091102100735.GB16963@elte.hu> <4AEEB0AF.5000904@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:47599 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754264AbZKBK3U (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 Nov 2009 05:29:20 -0500
Content-Disposition: inline
In-Reply-To: <4AEEB0AF.5000904@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>


* Avi Kivity <avi@redhat.com> wrote:

> On 11/02/2009 12:07 PM, Ingo Molnar wrote:
>>> Ingo, can you queue this on x86/entry?
>>>      
>> Already done, tested and pushed out.
>
> Usually there is an ack from tip-bot?

Yeah, the final, committed form of the patch (with small edits done in 
99% of the cases) gets sent to the discussion thread on lkml and can be 
reviewed (and double checked) there.

<plug> We use the tip-bot mechanism to:

 - increase transparency (every commit gets posted into the lkml thread 
   it originates from),

 - avoid patch-bombing/spamming lkml every week/month with new patches,

 - it also makes the patch postings much more on-topic and easier to
   ignore for those who are not interested in a discussion,

 - it can also be used to fine-tune any workflow details - the specific
   timings can be seen in the discussion, missed or incorrectly queued 
   patches can be identified,

 - new discussions/bugreports can be started based on that commit
   notification, on lkml.

Developers and maintainers involved in the process absolutely love it as 
it visibly increases workflow reliability and transparency and increases 
the information density on lkml - you might want to consider something 
similar too, for kvm.git ;-)

</plug>

Should be in your mbox any minute.

	Ingo
