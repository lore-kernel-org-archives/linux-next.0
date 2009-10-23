From: Jiri Slaby <jirislaby@gmail.com>
Subject: writable limits to -next [was: Adding to linux-next?]
Date: Fri, 23 Oct 2009 10:36:26 +0200
Message-ID: <4AE16B0A.7020400@gmail.com>
References: <4AC6339B.7000905@gmail.com> <20091006225751.7d5f3eec.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.154]:37336 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083AbZJWIgZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Oct 2009 04:36:25 -0400
In-Reply-To: <20091006225751.7d5f3eec.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 10/06/2009 01:57 PM, Stephen Rothwell wrote:
> Here is my boilerplate:
> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgment of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 

Hi, could you please add git://decibel.fi.muni.cz/~xslaby/linux#limits
into the -next tree?

> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
> 	Signed-off-by,
>      * posted to the relevant mailing list,

I posted the patches twice, nobody seems to want to pick them up.
The last repost is at:
http://lkml.org/lkml/2009/10/17/126

>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.

I'll try to merge it to 2.6.33.

Thanks.
