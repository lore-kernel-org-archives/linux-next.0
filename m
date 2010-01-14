From: Ken Lewis <kennylewis@gmail.com>
Subject: Re: [next-20091231] linux-next builds fine, but panics at runtime
Date: Thu, 14 Jan 2010 23:12:49 +0000
Message-ID: <5a44caba1001141512k7877d954w9fa43999b92dc573@mail.gmail.com>
References: <5a44caba1001111228m126d9524g1384d3518915b306@mail.gmail.com>
	 <20100112125833.60597593.sfr@canb.auug.org.au>
	 <5a44caba1001121135kfdc5226y4e8b0ddf111c9d09@mail.gmail.com>
	 <5a44caba1001121518r6685510bs9902e2a74a179981@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from fg-out-1718.google.com ([72.14.220.156]:10152 "EHLO
	fg-out-1718.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752312Ab0ANXMv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Jan 2010 18:12:51 -0500
Received: by fg-out-1718.google.com with SMTP id e21so484376fga.1
        for <linux-next@vger.kernel.org>; Thu, 14 Jan 2010 15:12:50 -0800 (PST)
In-Reply-To: <5a44caba1001121518r6685510bs9902e2a74a179981@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

2010/1/12 Ken Lewis <kennylewis@gmail.com>:
> 2010/1/12 Ken Lewis <kennylewis@gmail.com>:
>> 2010/1/12 Stephen Rothwell <sfr@canb.auug.org.au>:
>> Linus' tree has built fine and works all the way through. =A0I'll tr=
y
>> copying the config across and using it. =A0BTW next-20100111 built b=
ut
>> panics on boot.
> Linus' 05a625... kernel built and boots fine -- in use as I type this=
=2E

Taking the config I use with mainline and applying it to the
linux-next source tree has resolved the issue.  Thanks.

Take care.
Ken.
