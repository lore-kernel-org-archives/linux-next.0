From: Roland Dreier <rdreier@cisco.com>
Subject: Re: [ofa-general] Re: linux-next: origin tree build failure
Date: Tue, 30 Dec 2008 07:41:36 -0800
Message-ID: <adaljtxsma7.fsf@cisco.com>
References: <20081229114321.4b6baea5.sfr@canb.auug.org.au>
	<adavdt2ru39.fsf@cisco.com>
	<20081230193048.db7ee462.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from sj-iport-1.cisco.com ([171.71.176.70]:22845 "EHLO
	sj-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750722AbYL3Pm6 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Dec 2008 10:42:58 -0500
In-Reply-To: <20081230193048.db7ee462.sfr@canb.auug.org.au> (Stephen
	Rothwell's message of "Tue, 30 Dec 2008 19:30:48 +1100")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Linus <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, general@lists.openfabrics.org

 > I can drop the revert after your fix goes into Linus' tree (since that is
 > where the breakage is) ... looking forward to it, thanks.

Shouldn't it work if the fix is in my for-next branch, since you pull
that as part of the -next tree?  Or am I unclear on how -next works?

 - R.
