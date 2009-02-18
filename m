From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: linux-next: USB mouse won't work after resume.
Date: Wed, 18 Feb 2009 01:31:15 +0100
Message-ID: <499B56D3.3080701@free.fr>
References: <20090216172016.f1d159a7.sfr@canb.auug.org.au> <200902171135.13329.oliver@neukum.org> <499ABD80.9020904@free.fr> <200902172142.57302.oliver@neukum.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp4-g21.free.fr ([212.27.42.4]:55770 "EHLO smtp4-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754885AbZBRAbb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 19:31:31 -0500
In-Reply-To: <200902172142.57302.oliver@neukum.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Oliver Neukum <oliver@neukum.org>
Cc: linux-input@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>

Le 17.02.2009 21:42, Oliver Neukum a =E9crit :
> Am Tuesday 17 February 2009 14:37:04 schrieb Laurent Riffard:
>> Le 17.02.2009 11:35, Oliver Neukum a =E9crit :
>>> Am Tuesday 17 February 2009 10:55:57 schrieb Laurent Riffard:
>>>> My USB mouse won't work after suspend to disk and resume. I must u=
nload and reload the ohci_hcd module to get it back.
>>> Please recompile your kernel with CONFIG_USB_DEBUG and
>>> send me your dmesg.
>>>
>>> 	Regards
>>> 		Oliver
>>>
>> Here is it:
>>
>=20
> Please try the attached patch.
>=20
> 	Regards
> 		Oliver
>=20

This patch does fix the behaviour, my USB mouse now works after suspend=
/resume. Thanks.

Tested-by: Laurent Riffard <laurent.riffard@free.fr>
~~
laurent
