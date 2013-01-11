From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: linux-next: please cleanup the cpuidle tree
Date: Fri, 11 Jan 2013 10:10:12 +0100
Message-ID: <50EFD6F4.7030903@linaro.org>
References: <20130108092751.4bd60a67280e284369553c18@canb.auug.org.au> <50EB5636.4080705@linaro.org> <20130108102227.19d4102cb1ddf516ad4082d1@canb.auug.org.au> <20130111115608.dffec30f37e42a8f15a3f117@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f52.google.com ([209.85.214.52]:54681 "EHLO
	mail-bk0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753552Ab3AKJKR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Jan 2013 04:10:17 -0500
Received: by mail-bk0-f52.google.com with SMTP id w5so773378bku.39
        for <linux-next@vger.kernel.org>; Fri, 11 Jan 2013 01:10:15 -0800 (PST)
In-Reply-To: <20130111115608.dffec30f37e42a8f15a3f117@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@sisk.pl>

On 01/11/2013 01:56 AM, Stephen Rothwell wrote:
> Hi Daniel,
>=20
> On Tue, 8 Jan 2013 10:22:27 +1100 Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>>
>> On Tue, 08 Jan 2013 00:11:50 +0100 Daniel Lezcano <daniel.lezcano@li=
naro.org> wrote:
>>>
>>> On 01/07/2013 11:27 PM, Stephen Rothwell wrote:
>>>>
>>>> All the commits in the cpuidle tree have been included upstream be=
fore
>>>> v3.6-rc1.  They were rewritten before being merged upstream and so=
 are
>>>> now causing merge conflicts in linux-next.  Could you please reset=
 the
>>>> head of your tree
>>>> (git://git.linaro.org/people/dlezcano/cpuidle-next.git#cpuidle-nex=
t) to
>>>> be somewhere in the tree that yours is merged into (pm or Linus').
>>>
>>> Sure. I believe it is done now.
>>
>> Yep, thanks.
>=20
> Unfortunately, you reset your tree to be a version of the pm tree tha=
t has
> now been rebased :-(  This is now causing more conflicts in linux-nex=
t.
> Maybe you should reset your tree to be the same as one of Linus' -rc
> releases for now.

Ok, done.

Thanks
  -- Daniel


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
