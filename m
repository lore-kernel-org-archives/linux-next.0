From: Eric Dumazet <dada1@cosmosbay.com>
Subject: Re: linux-next: manual merge of the net tree with the tree
Date: Fri, 08 May 2009 10:21:04 +0200
Message-ID: <4A03EB70.2060207@cosmosbay.com>
References: <20090508132352.4763ae91.sfr@canb.auug.org.au> <20090508.004938.203704149.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw1.cosmosbay.com ([212.99.114.194]:37245 "EHLO
	gw1.cosmosbay.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757067AbZEHIVT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 May 2009 04:21:19 -0400
In-Reply-To: <20090508.004938.203704149.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, satoru.satoh@gmail.com

David Miller a =E9crit :
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 8 May 2009 13:23:52 +1000
>=20
>> Today's linux-next merge of the net tree got a conflict in
>> include/net/tcp.h between commit 0c266898b42fe4e4e2f9edfc9d3474c10f9=
3aa6a
>> ("tcp: Fix tcp_prequeue() to get correct rto_min value") from Linus'=
 tree
>> and commit f5f8d86b231e0489c33542c42afbb14d32411ee8 ("tcp: tcp_prequ=
eue()
>> cleanup") from the net tree.
>>
>> I fixed it up (see below - please check) and can carry the fix for a
>> while.
>=20
> Thanks Stephen, I'll do a merge to fix this up.
>=20
>=20

Sorry, I did my patches on top of net-next-2.6, I didnt realize some ch=
anges
were in flight on net-2.6
