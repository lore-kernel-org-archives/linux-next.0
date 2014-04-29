From: Fabio Estevam <festevam@gmail.com>
Subject: Re: kissb mkimage doesn't support extensa
Date: Tue, 29 Apr 2014 01:42:28 -0300
Message-ID: <CAOMZO5ADi5=pUYfknESjJfYXBn_xwQJ0zyG5=tRmzDpZoaf8Sw@mail.gmail.com>
References: <CAMuHMdU2L+m4-dKNAacqrLw66obsFYVKu8x1n6=up7Mkg1HL_Q@mail.gmail.com>
	<1398743403.8217.7.camel@concordia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ve0-f181.google.com ([209.85.128.181]:49927 "EHLO
	mail-ve0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751322AbaD2Em3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 29 Apr 2014 00:42:29 -0400
Received: by mail-ve0-f181.google.com with SMTP id oy12so9386097veb.12
        for <linux-next@vger.kernel.org>; Mon, 28 Apr 2014 21:42:29 -0700 (PDT)
In-Reply-To: <1398743403.8217.7.camel@concordia>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>

On Tue, Apr 29, 2014 at 12:50 AM, Michael Ellerman <mpe@ellerman.id.au> wrote:
> On Sun, 2014-03-02 at 11:25 +0100, Geert Uytterhoeven wrote:
>> http://kisskb.ellerman.id.au/kisskb/buildresult/10665903/
>>
>> Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k,
>> microblaze, mips, mips64, nios, nios2, ppc, s390, sh, sparc, sparc64,
>> blackfin, avr32
>
> I've upgraded to the latest version in Debian (2014.01), but it still doesn't
> seem to support xtensa.
>
>   $ /usr/bin/mkimage -A xtensa
>
>   Invalid CPU Type - valid names are: alpha, arm, x86, ia64, m68k, microblaze,
>   mips, mips64, nios2, powerpc, ppc, s390, sh, sparc, sparc64, blackfin, avr32,
>   nds32, or1k, sandbox, arm64

I will submit a patch to U-boot in order to include extensa and will
Cc you and Geert.
