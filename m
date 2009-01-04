From: Hollis Blanchard <hollisb@us.ibm.com>
Subject: Re: linux-next: kvm tree build failure
Date: Sun, 04 Jan 2009 13:45:47 -0600
Message-ID: <1231098347.7724.11.camel@localhost.localdomain>
References: <20081223002514.6fbcfe4f.sfr@canb.auug.org.au>
	 <20081229161750.e2197bad.sfr@canb.auug.org.au>
	 <20090102115354.46fc59e0.sfr@canb.auug.org.au>  <49609896.201@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e33.co.us.ibm.com ([32.97.110.151]:37183 "EHLO
	e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755901AbZADTpu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 4 Jan 2009 14:45:50 -0500
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com [9.17.195.227])
	by e33.co.us.ibm.com (8.13.1/8.13.1) with ESMTP id n04Jixpu025759
	for <linux-next@vger.kernel.org>; Sun, 4 Jan 2009 12:44:59 -0700
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id n04Jjnc4205896
	for <linux-next@vger.kernel.org>; Sun, 4 Jan 2009 12:45:49 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n04Jjm0V007189
	for <linux-next@vger.kernel.org>; Sun, 4 Jan 2009 12:45:48 -0700
In-Reply-To: <49609896.201@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>

On Sun, 2009-01-04 at 13:08 +0200, Avi Kivity wrote:
> Stephen Rothwell wrote:
> > And again.  Can you please find some fix for this so that the kvm tree
> > can get some integration testing ...
> >   
> 
> Hollis, help!

The "disarm" patch should fix the build. I'll resend that in a moment.

I'd like to remind you though that the cause of this breakage was the
debug patches you applied. It's also worth noting that the "fix" is to
delete functionality, so any way you look at it it's not a good
situation.

Between that and other kernel breakage (like Rusty's
smp_call_function_many patch), it has taken a lot of effort just to try
to catch up.

-- 
Hollis Blanchard
IBM Linux Technology Center
