From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Date: Mon, 25 Jul 2016 15:11:48 +0200
Message-ID: <57961014.7030902@linaro.org>
References: <20160724153233.49f1574d@canb.auug.org.au>
 <alpine.DEB.2.11.1607250915160.5629@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:32995 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752645AbcGYNLz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 25 Jul 2016 09:11:55 -0400
Received: by mail-wm0-f45.google.com with SMTP id p129so19551915wmp.0
        for <linux-next@vger.kernel.org>; Mon, 25 Jul 2016 06:11:54 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.11.1607250915160.5629@nanos>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Rich Felker <dalias@libc.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@linaro.org>, Marc Zyngier <Marc.Zyngier@arm.com>

On 07/25/2016 09:16 AM, Thomas Gleixner wrote:
> On Sun, 24 Jul 2016, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the tip tree, today's linux-next build (x86_64 allmodc=
onfig)
>> produced this warning:
>>
>> In file included from include/linux/clocksource.h:18:0,
>>                  from include/linux/clockchips.h:13,
>>                  from drivers/clocksource/jcore-pit.c:14:
>> include/linux/of.h:1004:20: warning: comparison of distinct pointer =
types lacks a cast
>>         .data =3D (fn =3D=3D (fn_type)NULL) ? fn : fn  }
>>                     ^
>> include/linux/of.h:1020:3: note: in expansion of macro '_OF_DECLARE'
>>    _OF_DECLARE(table, name, compat, fn, of_init_fn_1_ret)
>>    ^
>> include/linux/clocksource.h:247:2: note: in expansion of macro 'OF_D=
ECLARE_1_RET'
>>   OF_DECLARE_1_RET(clksrc, name, compat, fn)
>>   ^
>> drivers/clocksource/jcore-pit.c:277:1: note: in expansion of macro '=
CLOCKSOURCE_OF_DECLARE'
>>  CLOCKSOURCE_OF_DECLARE(jcore_pit, "jcore,pit", jcore_pit_init);
>>  ^
>>
>> Introduced by commits
>>
>>   b7c4db861683 ("clocksource/drivers/clksrc-probe: Introduce init fu=
nctions with return code")
>>   177cf6e52b0a ("clocksources: Switch back to the clksrc table")
>>
>> interacting with commit
>>
>>   e0aa0655c60b ("clocksource: add J-Core timer/clocksource driver")
>>
>> from the sh tree.
>=20
> And why is that driver coming through the superh tree and not through=
 the
> clocksource maintainers? It's not only based on an old interface it's=
 probably
> unreviewed as well ...

Rich,

why are these changes in linux-next ?

Except I am missing something, I don't see a new version sent for revie=
w
on the mailing list. The interrupt controller driver is almost empty as
stated by Marc Zyngier and there is no explanation / discussion about i=
t.

I don't know the goal of adding those patches in linux-next via your
tree, may be you misunderstood how linux-next works and you should
remove them. But if the purpose was to merge the patches, I remind you
that being an arch maintainer does not give you the right to apply any
patches, everywhere, at all cost, without review, because you want them
in, you must follow the process, otherwise you take the risk to upset a
lot of people and to be kicked out.

 -- Daniel




--=20
 <http://www.linaro.org/> Linaro.org =C3=A2=C2=94=C2=82 Open source sof=
tware for ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
