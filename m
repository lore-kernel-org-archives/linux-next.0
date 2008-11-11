From: Lachlan McIlroy <lachlan@sgi.com>
Subject: Re: linux-next: xfs tree build failure
Date: Tue, 11 Nov 2008 13:05:14 +1100
Message-ID: <4918E85A.5000701@sgi.com>
References: <20081030132324.0d619fdd.sfr@canb.auug.org.au>	<20081030090832.GQ17077@disturbed>	<20081105132000.4e560cad.sfr@canb.auug.org.au>	<20081105204754.GO4985@disturbed>	<20081106152753.GA9161@infradead.org> <20081107160611.d6f64fdd.sfr@canb.auug.org.au>
Reply-To: lachlan@sgi.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from netops-testserver-3-out.sgi.com ([192.48.171.28]:56997 "EHLO
	relay.sgi.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753765AbYKKCGR (ORCPT
	<rfc822;@relay.corp.sgi.com:linux-next@vger.kernel.org>);
	Mon, 10 Nov 2008 21:06:17 -0500
In-Reply-To: <20081107160611.d6f64fdd.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Chinner <david@fromorbit.com>, Christoph Hellwig <hch@infradead.org>, xfs-masters@oss.sgi.com, linux-next@vger.kernel.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk

Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 6 Nov 2008 10:27:53 -0500 Christoph Hellwig <hch@infradead.org> wrote:
>> On Thu, Nov 06, 2008 at 07:47:54AM +1100, Dave Chinner wrote:
>>>>> I think it's probably the only solution - we need to wait until
>>>>> the I_LOCK bit is cleared from the inode and AFAICT wait_on_inode()
>>>>> is the only way to do it.
>>>> Any resolution?
>>> I was waiting on a comment from Christoph. I'll cc him directly this
>>> time ;)
>> What comment do you expect from me?  The fix looks correct, but at some
>> point you should probably run all these exports past Al to get another
>> review.  Especially as he's doing major work in this area currently.
> 
> OK, I have dropped the xfs tree for today.  Let me know when it is sorted
> out.

Okay, your fix is in and it is building again.
