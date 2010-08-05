From: =?utf-8?B?TWljaGHFgiBOYXphcmV3aWN6?= <m.nazarewicz@samsung.com>
Subject: Re: linux-next: manual merge of the usb tree with Linus' tree
Date: Thu, 05 Aug 2010 12:35:29 +0200
Message-ID: <op.vgynpf0k7p4s8u@pikus>
References: <20100805132208.74bf6ab9.sfr@canb.auug.org.au>
 <alpine.LNX.2.00.1008051216260.29919@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed	delsp=yes
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:46893 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752995Ab0HEKd5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 5 Aug 2010 06:33:57 -0400
In-reply-to: <alpine.LNX.2.00.1008051216260.29919@pobox.suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jiri Kosina <jkosina@suse.cz>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Justin P.Mattock" <justinmattock@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Thomas Weber <weber@corscience.de>, Mike Frysinger <vapier.adi@gmail.com>

On Thu, 05 Aug 2010 12:17:05 +0200, Jiri Kosina <jkosina@suse.cz> wrote=
:

> On Thu, 5 Aug 2010, Stephen Rothwell wrote:
>
>> Today's linux-next merge of the usb tree got a conflict in
>> Documentation/usb/linux.inf between commit
>> 0ea6e61122196509af82cc4f36cbdaacbefb8227 ("Documentation: update bro=
ken
>> web addresses") from Linus' tree and commit
>> 2e73ce9389be011587a0ca581b6798b135e64807 ("USB: gadget: g_ether: upd=
ated
>> INF file") from the usb tree.
>>
>> The URL that was fixed by the former was removed by the latter, so I=
 just
>> used the latter version.
>
> I see. Greg, will you just rebase the patch in USB tree on top of cur=
rent
> Linus' tree please?

It should be enough to add this delta to the "USB: gadget: g_ether: upd=
ated
INF file":

-;   http://www.microsoft.com/whdc/hwdev/resources/HWservices/rndis.msp=
x
+;   http://www.microsoft.com/whdc/device/network/ndis/rmndis.mspx

--=20
Best regards,                                        _     _
| Humble Liege of Serenely Enlightened Majesty of  o' \,=3D./ `o
| Computer Science,  Micha=C5=82 "mina86" Nazarewicz       (o o)
+----[mina86*mina86.com]---[mina86*jabber.org]----ooO--(_)--Ooo--
