From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: [-next] cpu cache info in drivers base?
Date: Tue, 25 Nov 2014 07:44:28 +0100
Message-ID: <20141125064428.GB3880@osiris>
References: <20141124150048.GD3738@osiris>
 <5473577B.6010708@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:32813 "EHLO
	e06smtp10.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750840AbaKYGod (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 25 Nov 2014 01:44:33 -0500
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <heiko.carstens@de.ibm.com>;
	Tue, 25 Nov 2014 06:44:31 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 645811B0805F
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2014 06:44:44 +0000 (GMT)
Received: from d06av12.portsmouth.uk.ibm.com (d06av12.portsmouth.uk.ibm.com [9.149.37.247])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id sAP6iT7F14614954
	for <linux-next@vger.kernel.org>; Tue, 25 Nov 2014 06:44:29 GMT
Received: from d06av12.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av12.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id sAP6iSem000796
	for <linux-next@vger.kernel.org>; Mon, 24 Nov 2014 23:44:29 -0700
Content-Disposition: inline
In-Reply-To: <5473577B.6010708@arm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Mon, Nov 24, 2014 at 04:06:19PM +0000, Sudeep Holla wrote:
> Hi Heiko,
> 
> On 24/11/14 15:00, Heiko Carstens wrote:
> >Hi there,
> >
> >I'm just wondering what the point of the current cpu cache info
> >within drivers/base is?
> >If I startup linux-next (as of today) all I get is an error message
> >"error detecting cacheinfo..cpu0".
> 
> That's correct, I did post a patch[1] to suppress that given not all
> architectures might add support.
> 
> >Which naturally comes from:
> >
> >int __weak init_cache_level(unsigned int cpu)
> >{
> >	return -ENOENT;
> >}
> >
> >Given that there is no implementation without __weak I'm wondering
> >what the point is? Also it looks like no architecture has been
> >converted to the new infrastructure, even though such patches have
> >been posted in the past?
> 
> Yes, I asked Greg to hold off on the architecture patches for next
> versions as there may be conflicts(though we can have solve it using
> a common baseline, but I thought it was too late to try that). Also
> I have not got testing on few other architectures(ppc, ia64, amd). I
> will post those patches individually on respective arch lists and
> chase after the v3.19-rc1 release. Is that OK ?

Ok, thanks for clarifying!
