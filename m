From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Breakage from ARM when building x86
Date: Tue, 14 Feb 2012 10:09:33 -0700
Message-ID: <CACxGe6u3nLbF4737LE4ZOYZRu0g9LZzJ_kYjGkN97jPMcpX4bg@mail.gmail.com>
References: <20120214164453.003d9777@pyramind.ukuu.org.uk> <20120214165305.GA6362@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:48965 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756793Ab2BNRJx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Feb 2012 12:09:53 -0500
Received: by ghrr11 with SMTP id r11so144142ghr.19
        for <linux-next@vger.kernel.org>; Tue, 14 Feb 2012 09:09:53 -0800 (PST)
In-Reply-To: <20120214165305.GA6362@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-next@vger.kernel.org

On Tue, Feb 14, 2012 at 9:53 AM, Russell King <rmk@arm.linux.org.uk> wr=
ote:
> On Tue, Feb 14, 2012 at 04:44:53PM +0000, Alan Cox wrote:
>> Either this needs the headers fixing or should be protected by an AR=
M
>> config, not sure which
>
> At a guess, this is from linux-next ?
>
>> drivers/mfd/twl-core.c: In function =91twl_probe=92:
>> drivers/mfd/twl-core.c:1218:2: error: implicit declaration of functi=
on
>> =91irq_alloc_descs=92 [-Werror=3Dimplicit-function-declaration]
>> drivers/mfd/twl-core.c:1226:2: error: implicit declaration of functi=
on
>> =91irq_domain_add_legacy=92 [-Werror=3Dimplicit-function-declaration=
]
>> drivers/mfd/twl-core.c:1227:11: error: =91irq_domain_simple_ops=92 u=
ndeclared
>> (first use in this function) drivers/mfd/twl-core.c:1227:11: note: e=
ach
>> undeclared identifier is reported only once for each function it app=
ears
>> in cc1: some warnings being treated as errors
>
> This has nothing to do with me ;) =A0You're not the first to report i=
t today.
> I'm told by OMAP people that TWL gets used on x86 as well so it can't=
 be
> restricted to just ARM.
>
> This is probably due to the irq domain stuff coming out of Grant's tr=
ee.
>
> So no, really not anything to do with ARM.

This is irq_domain related.  It's related to an API change.  I'm
tracking to get it solved, either by moving the twl commit into the
irqdomain branch or by deferring the api change to v3.5.

I've also got a patch that converts x86 over to the new api, but I
don't have sufficient review to put it into the irqdomain tree yet.

g.
