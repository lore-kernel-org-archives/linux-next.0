From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next: manual merge of the rr tree
Date: Tue, 06 Jan 2009 06:21:20 -0800
Message-ID: <496368E0.8000801@sgi.com>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au> <200901051727.11403.rusty@rustcorp.com.au> <20090105124745.GC29758@elte.hu> <200901061921.49131.rusty@rustcorp.com.au> <496358F8.30308@sgi.com> <20090106131908.GB15228@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.179.30]:54034 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751904AbZAFOVY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 09:21:24 -0500
In-Reply-To: <20090106131908.GB15228@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Christoph Lameter <cl@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Jack Steiner <steiner@sgi.com>, Andrew Morton <akpm@linux-foundation.org>

Ingo Molnar wrote:
> * Mike Travis <travis@sgi.com> wrote:
> 
>> Rusty Russell wrote:
>>> On Monday 05 January 2009 23:17:45 Ingo Molnar wrote:
>>>> That would allow Mike, Christoph and you to work this out cleanly from 
>>>> scratch. It would also solve your merge conflict.
>>>>
>>>> Does that sound like a good solution?
>>> Sure, but it won't make this window.  I guess since those patches 
>>> don't do anything but lay groundwork it's not critical, but annoying 
>>> they've lain fallow so long.
>>>
>>> I'm happy to put them with the cpualloc patches, since they're related 
>>> and going to conflict, but I still want to see if Mike has the rest of 
>>> them?
>> I do.  And really, as soon as the cpus4096 is safely set for 2.6.29 I 
>> can devote much more time on it.
> 
> I think the complete elimination of cpumask_t should be the primary 
> priority - before jumping to any other aspect. If we dont get rid of it it 
> will stick around forever, like the BKL. It was a nice migration helper 
> but now it's time to wave goodbye? :)
> 
> 	Ingo

I think that's possible for 2.6.30 especially with Rusty's "big hammer"
patch that removes the definition of cpumask_t.  Of course, as has been
the delay forever, is dealing with all the arch's.  The current method
of some via tip, some via linux-next/rr has been somewhat excruciating.
How about we push the big ones via -mm so we get more complaints early on?

Or some other suggestion?  Once the "big hammer" patch is in, there will
be massive fallout, and I plan on being on an extended vacation when that
happens... ;-)

Thanks,
Mike
