From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the net-next
 tree
Date: Mon, 17 Jun 2013 17:51:29 +0400
Message-ID: <51BF1461.8060401@cogentembedded.com>
References: <20130617163920.04523ba6de50bcc81563f33e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:49457 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753798Ab3FQNvc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 17 Jun 2013 09:51:32 -0400
Received: by mail-lb0-f171.google.com with SMTP id 13so2545269lba.16
        for <linux-next@vger.kernel.org>; Mon, 17 Jun 2013 06:51:31 -0700 (PDT)
In-Reply-To: <20130617163920.04523ba6de50bcc81563f33e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Miller <davem@davemloft.net>, netdev@vger.kernel.org, Bastian Hecht <hechtb@gmail.com>, Simon Horman <horms+renesas@verge.net.au>

Hello.

On 17-06-2013 10:39, Stephen Rothwell wrote:

> Today's linux-next merge of the arm-soc tree got a conflict in
> arch/arm/mach-shmobile/clock-r8a7740.c between commit e5c9b4cd6651
> ("sh_eth: get R8A7740 support out of #ifdef") from the net-next tree and
> commit 9e0b428f079d ("ARM: shmobile: r8a7740: Add interim sh-eth device
> name to clocks list") from the arm-soc tree.

    To me that latter commit looked utterly pointless, as there's no 
device tree support for the 'sh-eth' driver yet (and at this stage it 
isn't even going to happen due to procedural platform data). I'm instead 
going to use OF_DEV_AUXDATA() in the platform code which again would 
render that commit pointless.

> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).

    Thanks.

WBR, Sergei
