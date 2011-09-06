From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: linux-next: no tree for Sept 6
Date: Tue, 6 Sep 2011 14:18:28 -0400
Message-ID: <CA+5PVA7Oj9BNTA93m8-rj4a7Ze_N7m3mG0-+GLG1zUSG+ekqJQ@mail.gmail.com>
References: <20110906164049.4dd3961cb82800b8d7cc8741@canb.auug.org.au>
	<CACqU3MXcZ72eYNd=duPYdR_gOe-ejnHoLSMqK_ZU3y=MR2-0+A@mail.gmail.com>
	<CA+5PVA7CETUa0i3U20ifz5YjXAywTGD2NEQt1GcJz1OwY_DtEg@mail.gmail.com>
	<CACqU3MXQw4+QyBmCPcO8ZmYu0T6N+DStXBoa=JUv+ej6cWMTnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:61799 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753892Ab1IFSS3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Sep 2011 14:18:29 -0400
In-Reply-To: <CACqU3MXQw4+QyBmCPcO8ZmYu0T6N+DStXBoa=JUv+ej6cWMTnw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Sep 6, 2011 at 1:29 PM, Arnaud Lacombe <lacombar@gmail.com> wro=
te:
> Hi,
>
> On Tue, Sep 6, 2011 at 1:23 PM, Josh Boyer <jwboyer@gmail.com> wrote:
>> On Tue, Sep 6, 2011 at 1:17 PM, Arnaud Lacombe <lacombar@gmail.com> =
wrote:
>>> Hi,
>>>
>>> On Tue, Sep 6, 2011 at 2:40 AM, Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>>>> Hi all,
>>>>
>>>> With master.kernel.org down, there is not much change from yesterd=
ay and
>>>> I cannot publish the resulting linux-next tree anyway, so there is=
 no
>>>> tree today.
>>>>
>>> What about github ? gitorious ?
>>>
>>> If you fork linus' tree on github, you should still be within the d=
isk
>>> usage limit. My linux-2.6-next.git bare tree mirror is about 303MB.
>>
>> Well... that would be helpful if all of the trees that linux-next
>> pulls from are hosted somewhere other than kernel.org as well. =A0A =
lot
>> of them are not, which means you would get an incomplete linux-next
>> tree at best. =A0Probably better to just wait.
>>
> That's just insane...

It's insane for people to host their git trees for kernel work on kerne=
l.org?

> git is distributed, but still used centrally. Kernel development
> should just not be impacted by such issues.

No... git is still used in a distributed fashion.  It's just that most
maintainers host the public trees that people pull from on kernel.org.
 Some have pushed public trees to github or elsewhere, but not all of
them.

josh
