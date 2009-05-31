From: Vegard Nossum <vegard.nossum@gmail.com>
Subject: Re: linux-next: kmemcheck tree
Date: Mon, 1 Jun 2009 00:21:58 +0200
Message-ID: <19f34abd0905311521s66174002n7736e4b058415d3c@mail.gmail.com>
References: <19f34abd0905300902g3e962867sa4fc9dbc40f4c2a2@mail.gmail.com>
	 <20090531151924.e5b02b93.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f222.google.com ([209.85.218.222]:51773 "EHLO
	mail-bw0-f222.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752280AbZEaWV6 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 31 May 2009 18:21:58 -0400
Received: by bwz22 with SMTP id 22so7151546bwz.37
        for <linux-next@vger.kernel.org>; Sun, 31 May 2009 15:21:59 -0700 (PDT)
In-Reply-To: <20090531151924.e5b02b93.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@elte.hu>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, linux-next@vger.kernel.org

2009/5/31 Stephen Rothwell <sfr@canb.auug.org.au>:
> Hi Vegard,
>
> On Sat, 30 May 2009 18:02:57 +0200 Vegard Nossum <vegard.nossum@gmail=
=2Ecom> wrote:
>>
>> It seems that we have fixed those syntax errors in the kmemcheck tre=
e
>> now, could you please add kmemcheck back into the mix?
>
> Sure. =C2=A0Do you want me to use the kmemcheck branch or the
> auto-kmemcheck-next branch (which hasn't been updated yet)? =C2=A0No =
desperate
> hurry, I won't be building a linux-next tree until tomorrow morning
> (about 18 hours from now).

The one we used before -- auto-kmemcheck-next. And so sorry, I didn't
realize this hadn't been updated yet. Ingo?

You can probably wait, then, I think.

>
>> (I am not sure if perhaps it would be better to wait until the 2.6.3=
0
>> comes out, as I don't think we'll make it for that one, and it would
>> only complicate things unnecessarily? Well, it's up to you :-))
>
> If you intend for this stuff to be merged in 2.6.31, then it needs to=
 get
> back into linux-next as soon as possible. =C2=A0A test merge (of the =
kmemcheck
> branch) into Friday's linux-next showed several conflicts (hopefully =
mostly
> simple) - I will report on these tomorrow.

Yes, I tried it myself too. Nothing very tricky, I guess, for you.
Just in case, here's what my version ended up looking like:

http://folk.uio.no/vegardno/kmemcheck-next-merge.txt

Thanks,


Vegard

--=20
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
