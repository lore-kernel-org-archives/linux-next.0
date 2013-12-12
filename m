From: Mark Salter <msalter@redhat.com>
Subject: Re: getting fixmap patches in linux-next
Date: Thu, 12 Dec 2013 10:11:54 -0500
Message-ID: <1386861114.1979.122.camel@deneb.redhat.com>
References: <1386775505.1979.105.camel@deneb.redhat.com>
	 <20131211154021.GA11208@gmail.com>
	 <1386777359.1979.106.camel@deneb.redhat.com>
	 <20131211140157.0a9c6decb597b491968c484a@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:36843 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751300Ab3LLPMC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Dec 2013 10:12:02 -0500
In-Reply-To: <20131211140157.0a9c6decb597b491968c484a@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, mingo <mingo@redhat.com>

On Wed, 2013-12-11 at 14:01 -0800, Andrew Morton wrote:
> It seems that "[PATCH 03/11] arm: use generic fixmap.h" has issues?
> 
> If/when that gets resolved, please integrate all the reviewed-by's and
> acked-by's and cc me on the resend?

The posted v2 of that patch shouldn't have any issues. The kmap
interfaces which would be effected by the change have been tested.
I pinged the arm folks on it, so let's see if they have anything
to say about it.

--Mark
