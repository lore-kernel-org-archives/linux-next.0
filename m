From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next: manual merge of the rr tree
Date: Tue, 06 Jan 2009 05:13:28 -0800
Message-ID: <496358F8.30308@sgi.com>
References: <20090105143239.08b1a060.sfr@canb.auug.org.au> <200901051727.11403.rusty@rustcorp.com.au> <20090105124745.GC29758@elte.hu> <200901061921.49131.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay3.sgi.com ([192.48.171.31]:33817 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751594AbZAFNNb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Jan 2009 08:13:31 -0500
In-Reply-To: <200901061921.49131.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Christoph Lameter <cl@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

Rusty Russell wrote:
> On Monday 05 January 2009 23:17:45 Ingo Molnar wrote:
>> That would allow Mike, Christoph and you to work this out cleanly from 
>> scratch. It would also solve your merge conflict.
>>
>> Does that sound like a good solution?
> 
> Sure, but it won't make this window.  I guess since those patches don't
> do anything but lay groundwork it's not critical, but annoying they've
> lain fallow so long.
> 
> I'm happy to put them with the cpualloc patches, since they're related
> and going to conflict, but I still want to see if Mike has the rest of them?

I do.  And really, as soon as the cpus4096 is safely set for 2.6.29 I can
devote much more time on it.

Thanks,
Mike

> 
> Thanks,
> Rusty.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
