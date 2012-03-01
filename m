From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: linux-next: Tree for Feb 29 (spear_thermal.c)
Date: Wed, 29 Feb 2012 20:35:06 -0500
Message-ID: <CAP=VYLoDfhM1gh5Ex-kwOECupk5gwHaj1Nx07ByO1u5ujGXYmA@mail.gmail.com>
References: <20120229175205.d165fa5266f400bc080253a0@canb.auug.org.au>
	<4F4EAD36.4070706@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:42709 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752905Ab2CABfG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Feb 2012 20:35:06 -0500
In-Reply-To: <4F4EAD36.4070706@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Vincenzo Frascino <vincenzo.frascino@st.com>

On Wed, Feb 29, 2012 at 5:56 PM, Randy Dunlap <rdunlap@xenotime.net> wr=
ote:
> On 02/28/2012 10:52 PM, Stephen Rothwell wrote:
>
>> Hi all,
>>
>> Changes since 20120228:
>>
>> My fixes tree contains:
>> =A0 =A0 =A0 x86, efi: Fix unaligned access and endian issues--
>
>
> on x86_64:
>
> drivers/built-in.o: In function `spear_thermal_exit':
> spear_thermal.c:(.text+0x49c042): undefined reference to `clk_disable=
'
> spear_thermal.c:(.text+0x49c04b): undefined reference to `clk_put'
> drivers/built-in.o: In function `spear_thermal_probe':
> spear_thermal.c:(.text+0x49c0e6): undefined reference to `clk_get'
> spear_thermal.c:(.text+0x49c0fe): undefined reference to `clk_enable'
> spear_thermal.c:(.text+0x49c196): undefined reference to `clk_put'
> spear_thermal.c:(.text+0x49c1cc): undefined reference to `clk_disable=
'

Hi Randy,

I think this should go away once the spear_thermal is limited to
being built just for that particular ARM platform.

http://www.spinics.net/lists/linux-next/msg18959.html

Paul.
--

>
>
> Full randconfig file is attached.
>
> ---
> ~Randy
