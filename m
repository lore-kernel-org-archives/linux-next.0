From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: Repository not clone-able via git-protocol VS.
 http(s) is fine
Date: Fri, 3 Jun 2011 11:49:26 +0200
Message-ID: <BANLkTim49-HsdyWhHmoM_30iCGRehmQkzQ@mail.gmail.com>
References: <BANLkTikTDfGYyL3vTK_HmEp_8vCm-dbwcA@mail.gmail.com>
	<BANLkTimK+ip-pLkL9zR-VtbdNQ6cc7Yt4A@mail.gmail.com>
	<20110603194602.0d5912d8.sfr@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:39016 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750965Ab1FCJt1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Jun 2011 05:49:27 -0400
Received: by qwk3 with SMTP id 3so746225qwk.19
        for <linux-next@vger.kernel.org>; Fri, 03 Jun 2011 02:49:26 -0700 (PDT)
In-Reply-To: <20110603194602.0d5912d8.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next <linux-next@vger.kernel.org>, ftpadmin@kernel.org

[ Ooops, De-CC <ftpmaster@debian.org> ]

On Fri, Jun 3, 2011 at 11:46 AM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi,
>
> On Fri, 3 Jun 2011 11:29:34 +0200 Sedat Dilek <sedat.dilek@googlemail=
=2Ecom> wrote:
>>
>> FYI:
>> The personal GIT repo of Stephen is git-clone-able:
>>
>> $ git clone git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-=
next.git
>> Cloning into linux-next...
>> remote: Counting objects: 2633561
>
> That repository is just a symlink to the linux-next repository. =C2=A0=
Your
> problem is probably that there is a problem with the mirrors.
>

SymLink seen from the filesystem?
Not sure what's going on... could be a temporary issue.

- Sedat -
