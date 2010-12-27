From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for December 27
Date: Mon, 27 Dec 2010 13:09:17 +0100
Message-ID: <AANLkTikDXepvbUEHBCR=W99FY-yuowQs1mYAAYt_xoSh@mail.gmail.com>
References: <20101227170451.a9a9f873.sfr@canb.auug.org.au>
	<AANLkTikbiART+SX_JwM=pcAg0NJffVgX1oU=aO42dmbC@mail.gmail.com>
	<20101227201155.ee8cd1ab.sfr@canb.auug.org.au>
	<AANLkTinVO8Mf4LnSj5fbtpHXHtwc8Wf306XEDgaqH437@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:42325 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753439Ab0L0MJS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Dec 2010 07:09:18 -0500
In-Reply-To: <AANLkTinVO8Mf4LnSj5fbtpHXHtwc8Wf306XEDgaqH437@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Dec 27, 2010 at 10:55 AM, Sedat Dilek
<sedat.dilek@googlemail.com> wrote:
> On Mon, Dec 27, 2010 at 10:11 AM, Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
>> Hi,
>>
>> On Mon, 27 Dec 2010 09:04:06 +0100 Sedat Dilek <sedat.dilek@googlema=
il.com> wrote:
>>>
>>> Can you try to upload/push via IPADDR?
>>
>> I can only upload to master.kernel.org, the rest is done by the mirr=
oring
>> software. =C2=A0I have no access to any of the other kernel.org mach=
ines.
>>
>
> I was wondering about still "slow mirrors" as also checking out befor=
e
> Xmas was very slow.
> Now, seeing from an end-users point, the checking-out is just fine.
> I tried to clone
> "$GIT_MIRROR/pub/scm/linux/kernel/git/npiggin/linux-npiggin.git" wher=
e
> GIT_MIRROR was:
>
> 1. git://130.239.17.7
> 2. git://199.6.1.166
> 3. git//git.kernel.org
> 4. git//git.eu.kernel.org
>
> All checkouts had around 680-690KiB/s.
>

DAMN!
The above was with cloning the vfs-tree from Nick Piggin, with
linux-next GIT it is a difference from where you clone (from my
GeoIP-location):

$ git clone git://130.239.17.7/pub/scm/linux/kernel/git/next/linux-next=
=2Egit
Cloning into linux-next...
remote: Counting objects: 3164616, done.
remote: Compressing objects: 100% (416281/416281), done.
remote: Total 3164616 (delta 2756821), reused 3128824 (delta 2721031)
Receiving objects: 100% (3164616/3164616), 535.89 MiB | 685 KiB/s, done=
=2E
Resolving deltas: 100% (2756821/2756821), done.

$ git clone git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git
Cloning into linux-next...
remote: Counting objects: 3164616, done.
fatal: The remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed

Anyway, it would be great if someone of the resposibles for the
kernel-mirrors would take care of these problems.

- Sedat -
