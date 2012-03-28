From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH] ARM: pxa: fix regulator related build fail in magician_defconfig
Date: Wed, 28 Mar 2012 21:36:05 +0800
Message-ID: <CAN1soZzypFA_EsmF5AHzjwHNom2-nY2io=6R8qPyBbn5m3aa0Q@mail.gmail.com>
References: <1331084814.11802.YahooMailClassic@web29012.mail.ird.yahoo.com>
	<1331242494-3157-1-git-send-email-paul.gortmaker@windriver.com>
	<CAN1soZzDRR4XQ34WDL48=j+Ff8t5fsCFaccqZAKOQ1OAPeDXcA@mail.gmail.com>
	<4F608F4F.8020106@windriver.com>
	<20120314123236.GE3133@opensource.wolfsonmicro.com>
	<20120328094351.GB22414@n2100.arm.linux.org.uk>
	<20120328101852.GE3232@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:40100 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082Ab2C1NgG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Mar 2012 09:36:06 -0400
Received: by vbbff1 with SMTP id ff1so689327vbb.19
        for <linux-next@vger.kernel.org>; Wed, 28 Mar 2012 06:36:05 -0700 (PDT)
In-Reply-To: <20120328101852.GE3232@opensource.wolfsonmicro.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lost.distance@yahoo.com, Bergmann Arnd <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

On Wed, Mar 28, 2012 at 6:18 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, Mar 28, 2012 at 10:43:51AM +0100, Russell King - ARM Linux wr=
ote:
>> On Wed, Mar 14, 2012 at 12:32:36PM +0000, Mark Brown wrote:
>
>> > Yes, that's what you should do. =A0Calling dev_name() is only poss=
ible if
>> > you have the struct device and removing the need for the struct de=
vice
>> > is exactly what we're trying to avoid here.
>
>> So what the hell is happening here to fix the breakage which the
>> regulator tree caused in mainline? =A0From this thread, it looks lik=
e
>> it's been known about since 8th March which is now twenty days ago,
>> and it's still broken.
>
> Yes, please at least apply Paul's patches - honestly, given how old
> these boards are and the general lack of activity I'd rather expect t=
hat
> the only thing anyone's doing with them these days is build tests.

Applied. I'll submit this fix to Arnd and Olof.

Best Regards
Haojian
