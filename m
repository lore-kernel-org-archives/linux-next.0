From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Apr 9
Date: Tue, 9 Apr 2013 16:32:13 +0200
Message-ID: <CA+icZUUboWkL8vHvN6+xk=9kz8SXexxgMN-g+xuPB24T1wTSRw@mail.gmail.com>
References: <CA+icZUX-RMW=pHzhOumB2_R99BRAf2qGC4n5bzyLqU6pOCMDFw@mail.gmail.com>
	<20130409235941.11eef57a42cb97efec72f037@canb.auug.org.au>
	<CA+icZUVk-iLtodZi_46qmk410Ei+tW6RR5kV2fx0N8v6neKTPQ@mail.gmail.com>
	<20130410002311.8a0b0503bcbda151b9de9469@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:50019 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761650Ab3DIOcP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Apr 2013 10:32:15 -0400
In-Reply-To: <20130410002311.8a0b0503bcbda151b9de9469@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, Apr 9, 2013 at 4:23 PM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> Hi Sedat,
>
> On Tue, 9 Apr 2013 16:11:50 +0200 Sedat Dilek <sedat.dilek@gmail.com>=
 wrote:
>>
>> [ CC Al Viro ]
>
> You forgot to do that ...
>
>> Is there a "magic" git-command to revert all commits coming from you=
r
>> latest vfs-merge (commit c1c04d3667608a630ae0821995b465a523e83fb1)?
>>
>> 2013-04-09 11:36 Stephen Rothwell   =E2=94=82 M=E2=94=80=E2=94=90 =E2=
=94=82 =E2=94=82 =E2=94=82 =E2=94=82 =E2=94=82 =E2=94=82         =E2=94=
=82 20130405/vfs
>
> You would normally do "git revert -m 1 c1c04d366760". However, that d=
oes
> not revert cleanly in today's linux-next (due to more patches modifyi=
ng
> the files involved).
>

Just wanted to improve my git Know-How.

>> After reverting all these commits I would like to pull-in latest
>> vfs.git#for-next.
>
> It would probably be easier to wait for tomorrow's linux-next.  Or ju=
st
> test Al's tree in its own.

Doug reported problems on his way "reverting the current vfs stuff"
and Al's new tree was reported as OK.
A lot of merge-conflicts... that's what I see when trying to pull in
Al's tree in today's Linux-Next.
So, I better wait for tommorrow.

Anyway, a warning in your CHANGELOG is very much appreciated on such
KNOWN ISSUES.

Regards,
- Sedat -

> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
