From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: kissb mkimage doesn't support extensa
Date: Wed, 30 Apr 2014 23:34:59 +0400
Message-ID: <CAMo8Bf+6AZcSEqTvnkV2e0x85v9PViGdLy5m9YCDK0Z9GsO-Pg@mail.gmail.com>
References: <CAMuHMdU2L+m4-dKNAacqrLw66obsFYVKu8x1n6=up7Mkg1HL_Q@mail.gmail.com>
	<1398743403.8217.7.camel@concordia>
	<CAOMZO5AuVyZ9Dqo2wUjeN2E0CZVjXoCgR5t8zje-37yPtr_tHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:51033 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1945936AbaD3Te7 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Apr 2014 15:34:59 -0400
Received: by mail-oa0-f46.google.com with SMTP id i4so1829668oah.33
        for <linux-next@vger.kernel.org>; Wed, 30 Apr 2014 12:34:59 -0700 (PDT)
In-Reply-To: <CAOMZO5AuVyZ9Dqo2wUjeN2E0CZVjXoCgR5t8zje-37yPtr_tHA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>

On Wed, Apr 30, 2014 at 10:31 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Tue, Apr 29, 2014 at 12:50 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>> On Sun, 2014-03-02 at 11:25 +0100, Geert Uytterhoeven wrote:
>>> http://kisskb.ellerman.id.au/kisskb/buildresult/10665903/
>>>
>>> Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k,
>>> microblaze, mips, mips64, nios, nios2, ppc, s390, sh, sparc, sparc64,
>>> blackfin, avr32
>>
>> I've upgraded to the latest version in Debian (2014.01), but it still doesn't
>> seem to support xtensa.
>>
>>   $ /usr/bin/mkimage -A xtensa
>>
>>   Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k, microblaze,
>>   mips, mips64, nios2, powerpc, ppc, s390, sh, sparc, sparc64, blackfin, avr32,
>>   nds32, or1k, sandbox, arm64
>
> As mainline U-boot does not support xtensa currently, what about
> dropping the uImage format to be built?

There's xtensa port for U-boot at https://github.com/foss-xtensa/u-boot
Also KISSKB didn't even try to build uImage for xtensa until recently.
What's changed?

-- 
Thanks.
-- Max
