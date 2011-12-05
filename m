From: Julie Sullivan <kernelmail.jms@gmail.com>
Subject: linux-next web page needs updating
Date: Mon, 5 Dec 2011 21:39:56 +0000
Message-ID: <CAAVPGON4_H+LYr2io6pJphpRWcquz9-OdNvZnUwBGbAiy_tgBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:37194 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932489Ab1LEVj4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 5 Dec 2011 16:39:56 -0500
Received: by yenm1 with SMTP id m1so2235483yen.19
        for <linux-next@vger.kernel.org>; Mon, 05 Dec 2011 13:39:56 -0800 (PST)
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org

On Fri, Dec 2, 2011 at 8:57 PM, Dan Carpenter <dan.carpenter@oracle.com=
> wrote:
> On Fri, Dec 02, 2011 at 07:36:54AM -0300, Joilnen Leite wrote:
>> Should I to do git pull ?
>> or like said http://linux.f-seidel.de/linux-next/pmwiki/pmwiki.php?n=
=3DLinux-next.FAQ
>>
>> $ git remote add linux-next
>> git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git
>> $ git fetch linux-next
>> $ git fetch --tags linux-next
>> ... # later on
>> $ git remote update
>
> No. =A0Don't update. =A0After the fetch do a git checkout next-201112=
01.
>
> The problem is that you have to update from one tree to the other
> tree but linux-next doesn't follow a linear plan like that. =A0Linux
> next is rebuilt every day independently from the day before.
>
> regards,
> dan carpenter


Joilnen, if you haven't figured this out already and still can't set
linux-next up as a remote:
This line (still on the linux-next web page to date):

git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git

is actually now wrong (it's been replaced on kernel.org), so you need
to replace it with this line:

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

instead. HTH,

Cheers
Julie
