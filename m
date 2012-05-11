From: David Daney <ddaney.cavm@gmail.com>
Subject: Re: linux-next: Tree for May 10 (net/phy)
Date: Fri, 11 May 2012 09:14:59 -0700
Message-ID: <4FAD3B03.3070109@gmail.com>
References: <20120510192635.c6f3a55196bbf65f13956e44@canb.auug.org.au>	<4FAC35E2.4060900@xenotime.net>	<CAP=VYLon7XRoh9s==wGYjUPNAYaTk8QQx7FGRnaDR97v+O-zXA@mail.gmail.com> <20120510.224352.2149006669429730060.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:45381 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752827Ab2EKQPD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 May 2012 12:15:03 -0400
In-Reply-To: <20120510.224352.2149006669429730060.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: "paul.gortmaker@windriver.com" <paul.gortmaker@windriver.com>, "rdunlap@xenotime.net" <rdunlap@xenotime.net>, "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, =?ISO-8859-1?Q?Bj=F8rn_Mork?= <bjorn@mork.no>

On 05/10/2012 07:43 PM, David Miller wrote:
> From: Paul Gortmaker<paul.gortmaker@windriver.com>
> Date: Thu, 10 May 2012 22:36:55 -0400
>
>> On Thu, May 10, 2012 at 5:40 PM, Randy Dunlap<rdunlap@xenotime.net> =
 wrote:
>>> On 05/10/2012 02:26 AM, Stephen Rothwell wrote:
>>>
>>>> Hi all,
>>>>
>>>> Changes since 20120508:
>>>
>>>
>>>
>>> ERROR: "of_mdio_find_bus" [drivers/net/phy/mdio-mux.ko] undefined!
>>
>> Not just randconfig, but also powerpc allmodconfig:
>>
>> http://kisskb.ellerman.id.au/kisskb/buildresult/6291463/
>>
>> Adding ppc ML to cc.
>
> Adding the guilty party to the CC:.  This really stinks, especially
> after I did give the patch submitter a hard time about getting the
> dependencies right. :-/

Indeed, how embarrassing.

It looks like Bj=F8rn may have already posted a fix.  I will try to ver=
ify=20
that it works, and take appropriate action.

Sorry about the screw up,
David Daney
