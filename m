From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the m68knommu tree with the m68k tree
Date: Tue, 14 Sep 2010 10:47:42 +0200
Message-ID: <AANLkTim+7Q79hVv+r1PO2LeiiSCxb12CaqO3YuR8taL9@mail.gmail.com>
References: <20100914105129.02eb5b13.sfr@canb.auug.org.au>
	<4C8ECDFE.6010906@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:57183 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752428Ab0INIro convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Sep 2010 04:47:44 -0400
In-Reply-To: <4C8ECDFE.6010906@snapgear.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Ungerer <gerg@snapgear.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christian Dietrich <qy03fugy@stud.informatik.uni-erlangen.de>

On Tue, Sep 14, 2010 at 03:21, Greg Ungerer <gerg@snapgear.com> wrote:
> Stephen Rothwell wrote:
>>
>> Today's linux-next merge of the m68knommu tree got a conflict in
>> arch/m68k/sun3/sun3ints.c between commit
>> 72fe185cd9acbfc6e8a7afa884ae1152be706e52 ("m68k/m68knommu: Remove de=
ad
>> SMP config option") from the m68k tree and commit
>> 5313b581e4efc214c6132d32f580db6668e5c5a8 ("arch/m68k{,nommu}: Removi=
ng
>> dead SMP config option") from the m68knommu tree.
>>
>> These appear to be the same patch with some formatting differences. =
=C2=A0I
>> used the version from the m68k tree.
>
> Looks like Geert added the same patch to the m68k git tree.
> I'll drop it from the m68knommu git tree.

Sorry, I should have checked explicitly which patches were already in
the m68knommu git tree.
I did leave out one patch I knew (from email) Greg was going to take.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
