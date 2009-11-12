From: Eric Dumazet <eric.dumazet@gmail.com>
Subject: Re: linux-next: net tree build warning
Date: Thu, 12 Nov 2009 03:55:49 +0100
Message-ID: <4AFB7935.8010204@gmail.com>
References: <20091112132424.e010e3c5.sfr@canb.auug.org.au> <20091111.185338.253345558.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw1.cosmosbay.com ([212.99.114.194]:36664 "EHLO
	gw1.cosmosbay.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759999AbZKLCzy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 11 Nov 2009 21:55:54 -0500
In-Reply-To: <20091111.185338.253345558.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

David Miller a =E9crit :
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 12 Nov 2009 13:24:24 +1100
>=20
>> Hi Dave,
>>
>> Today's linux-next build (x86_64 allmodconfig) produced this warning=
:
>>
>> net/ipv6/addrconf.c: In function 'inet6_dump_ifinfo':
>> net/ipv6/addrconf.c:3833: warning: unused variable 'err'
>>
>> Introduced by commit 84d2697d9649339215675551eae28ba04068dea1 ("ipv6=
:
>> speedup inet6_dump_ifinfo()").
>=20
> I just pushed a fix for this into net-next-2.6, thanks!

You beat me :)

Thanks
