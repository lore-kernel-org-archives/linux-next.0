From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: Tree for Aug 29 (bnx2x)
Date: Mon, 29 Aug 2011 22:57:11 -0400 (EDT)
Message-ID: <20110829.225711.920800080995518716.davem@davemloft.net>
References: <20110829132800.f7174f2e.rdunlap@xenotime.net>
	<1314653744.3085.2.camel@lb-tlvb-dmitry>
	<20110829155618.01a73cce.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:48534 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751423Ab1H3C7R (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 29 Aug 2011 22:59:17 -0400
In-Reply-To: <20110829155618.01a73cce.rdunlap@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rdunlap@xenotime.net
Cc: dmitry@broadcom.com, sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, eilong@broadcom.com

From: Randy Dunlap <rdunlap@xenotime.net>
Date: Mon, 29 Aug 2011 15:56:18 -0700

> On Tue, 30 Aug 2011 00:35:44 +0300 Dmitry Kravkov wrote:
> 
>> On Mon, 2011-08-29 at 13:28 -0700, Randy Dunlap wrote:
>> > On Mon, 29 Aug 2011 16:19:07 +1000 Stephen Rothwell wrote:
>> > 
>> > > Hi all,
>> > 
>> > (on i386 or x86_64)
>> > 
>> > drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:10148: error: 'bnx2x_fcoe_get_wwn' undeclared here (not in a function)
>> > 
>> > 
>> > Full randconfig file is attached.
>> > 
>> > ---
>> > ~Randy
>> > *** Remember to use Documentation/SubmitChecklist when testing your code ***
>> This should sync #define structures between definition and declaration
>> ---
>> 
>> Reported-by: Randy Dunlap <rdunlap@xenotime.net>
>> Signed-off-by: Dmitry Kravkov <dmitry@broadcom.com>
> 
> Acked-by: Randy Dunlap <rdunlap@xenotime.net>

Applied, thanks everyone.
