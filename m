From: Ken Lewis <kennylewis@gmail.com>
Subject: Re: [next-20091231] linux-next builds fine, but panics at runtime
Date: Tue, 12 Jan 2010 19:35:20 +0000
Message-ID: <5a44caba1001121135kfdc5226y4e8b0ddf111c9d09@mail.gmail.com>
References: <5a44caba1001111228m126d9524g1384d3518915b306@mail.gmail.com>
	 <20100112125833.60597593.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f225.google.com ([209.85.220.225]:39601 "EHLO
	mail-fx0-f225.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754218Ab0ALTfW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Jan 2010 14:35:22 -0500
Received: by fxm25 with SMTP id 25so31141fxm.21
        for <linux-next@vger.kernel.org>; Tue, 12 Jan 2010 11:35:20 -0800 (PST)
In-Reply-To: <20100112125833.60597593.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

2010/1/12 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Ken,
>
> On Mon, 11 Jan 2010 20:28:41 +0000 Ken Lewis <kennylewis@gmail.com> w=
rote:
>>
>> I'm havng some problems testing linux-next at the moment. =A0I'm abl=
e to
>> build each release but the kernel panics at boot. =A0The problem's b=
een
>> about since the start of December and I haven't managed to find what
>> portion of my .config and the loophole in the build system that allo=
w
>> this to happen. =A0Can anyone else help me?
>>
> Have you tried building and booting (with the same config) just the
> version of Linus' kernel that those next- kernel's were built on? =A0=
(Just
> as a sanity check) =A0For next-20091231, Linus' kernel was commit
> 05a625486efc3209ae4d98e253dafa6ce0124385 (for example).

Linus' tree has built fine and works all the way through.  I'll try
copying the config across and using it.  BTW next-20100111 built but
panics on boot.

Thanks,
K3n
