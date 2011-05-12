From: Javier Cardona <javier@cozybit.com>
Subject: Re: linux-next: build failure after merge of the final tree (wireless
 tree related)
Date: Thu, 12 May 2011 10:22:20 -0700
Message-ID: <BANLkTiknar_vMtmr659yNCVFz-V0W9XvOQ@mail.gmail.com>
References: <20110512141019.72ccb7a7.sfr@canb.auug.org.au> <BANLkTik+=yh3eq6Snp9SfC0xn--Deccefw@mail.gmail.com>
 <20110512145633.69302dd4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:52423 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758108Ab1ELRWl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 12 May 2011 13:22:41 -0400
In-Reply-To: <20110512145633.69302dd4.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, devel@lists.open80211s.org

On Wed, May 11, 2011 at 9:56 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> On Wed, 11 May 2011 21:37:16 -0700 Javier Cardona <javier@cozybit.com=
> wrote:
>>
>> Hi Stephen,
>>
>> On Wed, May 11, 2011 at 9:10 PM, Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>> > Hi John,
>> >
>> > After merging the final tree, today's linux-next build (i386 defco=
nfig)
>> > failed like this:
>> >
>> > net/mac80211/cfg.c: In function 'sta_apply_parameters':
>> > net/mac80211/cfg.c:746: error: 'struct sta_info' has no member nam=
ed 'plink_state'
>>
>> Sorry, I just saw this. =A0My apologies. =A0The fixup is valid but I=
'm
>> trying to understand why it is needed.
>> ieee80211_vif_is_mesh(&sdata->vif) compiles to 'false' when
>> CONFIG_MAC80211_MESH is not defined... wouldn't the compiler remove
>> that dead code? (Obviously it did not...)
>
> The compiler will elide that code but only after compiling it, so the
> code still has to be correct.

Thanks for the explanation.

>> Anyway, given that this is necessary, it's probably cleaner to exten=
d
>> the #ifdef block to the entire body of the outer if as follows:
>
> I think you have the #ifdef one line too low.

My intent was to have the #endif one line above, but either way works.
 That's the problem of preparing patches on pajamas.
How can I help at this point?  Would resubmitting the patch help or
just add noise?

Cheers,

Javier

> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>



--=20
Javier Cardona
cozybit Inc.
http://www.cozybit.com
