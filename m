From: Phillip Lougher <phillip.lougher@gmail.com>
Subject: Re: linux-next: clean up time (pass 1)
Date: Thu, 2 Jun 2011 03:25:36 +0100
Message-ID: <BANLkTim-MPrnZ9+EaNtCQLsG9aukNhsiUw@mail.gmail.com>
References: <20110601110616.861247de.sfr@canb.auug.org.au>
	<BANLkTim6MbS1E=9LyX=rsDr+JNuojPC4GQ@mail.gmail.com>
	<20110602113826.a41bbd3d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:65360 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759221Ab1FBCZi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Jun 2011 22:25:38 -0400
In-Reply-To: <20110602113826.a41bbd3d.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Jun 2, 2011 at 2:38 AM, Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> Hi Phillip,
>
> On Thu, 2 Jun 2011 02:26:07 +0100 Phillip Lougher <phillip.lougher@gm=
ail.com> wrote:
>>
>> > squashfs
>>
>> This is a surprise ... I'm sure I had commits in my squashfs
>> linux-next tree at the opening of the last but one merge window...
>>
>> Linux 2.6.38 released 14 Mar 2011
>>
>> $ git log --pretty=3D"%ci %s"
>> ...
>> 2011-02-28 18:43:48 +0000 Squashfs: wrap squashfs_mount() definition
>> 2011-02-28 18:35:44 +0000 Squashfs: xz_wrapper doesn't need to inclu=
de squashfs_
>> 2011-02-28 18:35:36 +0000 Squashfs: Update documentation to include =
compression
>> 2011-02-28 18:35:28 +0000 Squashfs: Update Kconfig help text to incl=
ude xz compr
>> 2011-02-28 18:34:24 +0000 Squashfs: add compression options support =
to xz decomp
>> 2011-02-28 18:21:59 +0000 Squashfs: extend decompressor framework to=
 handle comp
>> 2011-02-07 16:03:55 -0800 Linux 2.6.38-rc4
>
> plus or minus 1 day (and timezone jitter :-)):
>
> $ git rev-list --no-merges next/20110314/origin..next/20110314/squash=
fs | wc -l
> 0
> $ git rev-list --no-merges next/20110315/origin..next/20110315/squash=
fs | wc -l
> 0
> $ git rev-list --no-merges next/20110316/origin..next/20110316/squash=
fs | wc -l
> 6
>

Bugger, maybe I forgot to push, though I thought I did  :-)

Phillip

> It doesn't really matter, it was just a quick metric to choose a subs=
et
> of trees to look at.
>
> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>
