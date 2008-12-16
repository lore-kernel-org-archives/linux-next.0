From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next: manual merge of the rr_cpumask tree
Date: Tue, 16 Dec 2008 08:03:11 -0800
Message-ID: <4947D13F.6020105@sgi.com>
References: <20081215170945.b91f3b9c.sfr@canb.auug.org.au>	<200812151711.36134.rusty@rustcorp.com.au>	<4946855D.7070403@sgi.com>	<200812161610.58496.rusty@rustcorp.com.au>	<49474471.2090409@sgi.com> <20081216170940.3c74d4d0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.179.30]:48519 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1756275AbYLPQDO (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Dec 2008 11:03:14 -0500
In-Reply-To: <20081216170940.3c74d4d0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, Ingo Molnar <mingo@elte.hu>

Stephen Rothwell wrote:
> Hi Mike,
> 
> On Mon, 15 Dec 2008 22:02:25 -0800 Mike Travis <travis@sgi.com> wrote:
>> Yes, I did finally figure that out.  Thanks for rebasing the part that Ingo needed
>> so maybe the rest can be pushed.  There was a problem when the 'for-ingo' tree was
>> merged as there were mixed up API calls in io_apic.c, but I fixed them in the first
>> x86 only patch.  I wasn't sure of what else to do.
> 
> You could have fixed them up as part of the actual merge commit.  If each
> tree was correct on it own, then the merge is the place for such
> resolutions.
> 

Thanks, I will try that next time.

Ingo - if you need a small patch to make the post-merge tree buildable, let me know. 
I can extract that from the 1st patch (that modifies the smp api).

Thanks,
Mike
