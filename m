From: Avi Kivity <avi@redhat.com>
Subject: Re: linux-next: kvm tree build failure
Date: Sun, 04 Jan 2009 21:55:54 +0200
Message-ID: <4961144A.3060400@redhat.com>
References: <20081223002514.6fbcfe4f.sfr@canb.auug.org.au>	 <20081229161750.e2197bad.sfr@canb.auug.org.au>	 <20090102115354.46fc59e0.sfr@canb.auug.org.au>  <49609896.201@redhat.com> <1231098347.7724.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:55579 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755901AbZADTzp (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 4 Jan 2009 14:55:45 -0500
In-Reply-To: <1231098347.7724.11.camel@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Hollis Blanchard <hollisb@us.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>

Hollis Blanchard wrote:
> The "disarm" patch should fix the build. I'll resend that in a moment.
>
> I'd like to remind you though that the cause of this breakage was the
> debug patches you applied. It's also worth noting that the "fix" is to
> delete functionality, so any way you look at it it's not a good
> situation.
>   

No question.  We should have identified this earlier (my compile time 
tester) and dealt with it.  However, note that x86 is the main arch for 
kvm; we'll try hard to accommodate ppc, but you must adapt to x86 kvm 
changes, or lose functionality.

We'll try to make this tradeoff as rare as possible, of course.


-- 
I have a truly marvellous patch that fixes the bug which this
signature is too narrow to contain.
