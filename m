From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for May 10 (net/phy)
Date: Thu, 10 May 2012 22:36:55 -0400
Message-ID: <CAP=VYLon7XRoh9s==wGYjUPNAYaTk8QQx7FGRnaDR97v+O-zXA@mail.gmail.com>
References: <20120510192635.c6f3a55196bbf65f13956e44@canb.auug.org.au> <4FAC35E2.4060900@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:34683 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932162Ab2EKCh2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 10 May 2012 22:37:28 -0400
In-Reply-To: <4FAC35E2.4060900@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org

On Thu, May 10, 2012 at 5:40 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> On 05/10/2012 02:26 AM, Stephen Rothwell wrote:
>
>> Hi all,
>>
>> Changes since 20120508:
>
>
>
> ERROR: "of_mdio_find_bus" [drivers/net/phy/mdio-mux.ko] undefined!

Not just randconfig, but also powerpc allmodconfig:

http://kisskb.ellerman.id.au/kisskb/buildresult/6291463/

Adding ppc ML to cc.

P.
--


>
> Full randconfig file is attached.
>
> --
> ~Randy
