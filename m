From: David Miller <davem@davemloft.net>
Subject: Re: sparc32 build...
Date: Thu, 15 Mar 2012 20:13:23 -0700 (PDT)
Message-ID: <20120315.201323.500647975902683335.davem@davemloft.net>
References: <20120315.195934.2192536141028515540.davem@davemloft.net>
	<20120316141222.210a0ccf1a245367e5c956f5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:34264 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964942Ab2CPDRc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Mar 2012 23:17:32 -0400
In-Reply-To: <20120316141222.210a0ccf1a245367e5c956f5@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, tony@bakeyournoodle.com

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 16 Mar 2012 14:12:22 +1100

> Hi Dave,
> 
> On Thu, 15 Mar 2012 19:59:34 -0700 (PDT) David Miller <davem@davemloft.net> wrote:
>>
>> Stephen, just checking, did my Makefile change make the sparc32 build
>> failures go away with newer tools?
> 
> Yeah, seems to have worked.  See (sparc defconfig builds)
> http://kisskb.ellerman.id.au/kisskb/buildresult/5869567/ (next-20120313 -
> bad) v. http://kisskb.ellerman.id.au/kisskb/buildresult/5871624/
> (next-20120314 - good)

Awesome, thanks.
