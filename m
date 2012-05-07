From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: linux-next: manual merge of the crypto tree with Linus' tree
Date: Mon, 7 May 2012 13:02:48 +0200
Message-ID: <CACRpkdar8OLHcBmm5cDT7S_V1dbLG0L5FXuvw0=bhEjkjz88Pw@mail.gmail.com>
References: <20120507121137.bdfc96ed31649040506d9c75@canb.auug.org.au>
	<201205070809.21709.arnd@arndb.de>
	<20120507090427.GA26654@gondor.apana.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gg0-f174.google.com ([209.85.161.174]:49796 "EHLO
	mail-gg0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755418Ab2EGLCt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 7 May 2012 07:02:49 -0400
Received: by gglu4 with SMTP id u4so223994ggl.19
        for <linux-next@vger.kernel.org>; Mon, 07 May 2012 04:02:48 -0700 (PDT)
In-Reply-To: <20120507090427.GA26654@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Westin <andreas.westin@stericsson.com>, Lee Jones <lee.jones@linaro.org>

On Mon, May 7, 2012 at 11:04 AM, Herbert Xu <herbert@gondor.apana.org.a=
u> wrote:
> On Mon, May 07, 2012 at 08:09:21AM +0000, Arnd Bergmann wrote:
>> On Monday 07 May 2012, Stephen Rothwell wrote:
>> > + static void __init u8500_cryp1_hash1_init(void)
>> > + {
>> > + =A0 =A0 =A0 db8500_add_cryp1(&u8500_cryp1_platform_data);
>> > + =A0 =A0 =A0 db8500_add_hash1(&u8500_hash1_platform_data);
>> > + }
>>
>> This is actually not correct any more because of the
>> other changes: each device addition should also pass the parent
>> pointer so the device is created in the right position.
>>
>> Stephen, your fix is ok for linux-next and I expect everything
>> to still work, but we should not merge it into v3.5 this way.
>>
>> Thanks for the fixup.
>
> OK, I'll drop the last patch
>
> =A0 =A0 =A0 =A0mach-ux500: crypto - core support for CRYP/HASH module

OK we need to revisit this and we can drop the U5500 hunks at
the same time.

Yours,
Linus Walleij
