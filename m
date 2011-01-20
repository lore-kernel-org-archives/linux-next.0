From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Reorganization of git.secretlab.ca branches
Date: Wed, 19 Jan 2011 17:21:07 -0700
Message-ID: <AANLkTikiODDhBU8z2yYc+zegAhe_siv30_dUED---R0-@mail.gmail.com>
References: <AANLkTim0+NLeK=RK3aVSrX+ij113rz+BTExr8zUhCErY@mail.gmail.com> <20110120111610.6a704c18.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:40471 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752977Ab1ATAV2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Jan 2011 19:21:28 -0500
Received: by iyj18 with SMTP id 18so3860iyj.19
        for <linux-next@vger.kernel.org>; Wed, 19 Jan 2011 16:21:28 -0800 (PST)
In-Reply-To: <20110120111610.6a704c18.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>

On Wed, Jan 19, 2011 at 5:16 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Grant,
>
> On Wed, 19 Jan 2011 10:35:26 -0700 Grant Likely <grant.likely@secretl=
ab.ca> wrote:
>>
>> I've reorganized my git tree to be clearer, so I'd like to update th=
e
>> list of branches that you're pulling from me for linux-next:
>>
>> Here are the branches you're currently pulling:
>>
>> gcl-current =A0 git =A0 =A0 git://git.secretlab.ca/git/linux-2.6#mer=
ge
>> 52xx-and-virtex =A0 =A0 =A0 git =A0 =A0 git://git.secretlab.ca/git/l=
inux-2.6#next
>> devicetree =A0 =A0git =A0 =A0 git://git.secretlab.ca/git/linux-2.6#n=
ext-devicetree
>> spi =A0 =A0 =A0 =A0 =A0 git =A0 =A0 git://git.secretlab.ca/git/linux=
-2.6#next-spi
>>
>> I've been using 2 branches for each subsystem that I'm maintaining;
>> one for bug fixes that should be merged relatively quickly, and one
>> for linux-next. =A0Most of the time the 'merge' branches are empty, =
but
>> once in a while I've got a bugfix that I want to give wider testing
>> before asking Linus to pull. =A0So, I'm thinking that I'd like to ch=
ange
>> the trees that you merge to:
>>
>> 52xx-and-virtex-current =A0 =A0 =A0 git =A0 =A0 git://git.secretlab.=
ca/git/linux-2.6#powerpc/merge
>> 52xx-and-virtex =A0 =A0 =A0 git =A0 =A0 git://git.secretlab.ca/git/l=
inux-2.6#powerpc/next
>>
>> devicetree-current =A0 =A0git =A0 =A0 git://git.secretlab.ca/git/lin=
ux-2.6#devicetree/merge
>> devicetree =A0 =A0git =A0 =A0 git://git.secretlab.ca/git/linux-2.6#d=
evicetree/next
>>
>> spi-current =A0 =A0 =A0 =A0 =A0 git =A0 =A0 git://git.secretlab.ca/g=
it/linux-2.6#spi/merge
>> spi =A0 =A0 =A0 =A0 =A0 git =A0 =A0 git://git.secretlab.ca/git/linux=
-2.6#spi/next
>>
>> Does this sound reasonable to you?
>
> Looks good and all done.

Thanks.

> I think you may have not put your powerpx fix
> into your powerpc/merge branch yet, though.

It's in my devicetree/merge branch.

g.
