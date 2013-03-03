From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [git.k.o] Old linux-next WebGit points to $NewWebGitURL/tree
Date: Sun, 3 Mar 2013 09:26:25 +0100
Message-ID: <CA+icZUWoqYWirP7F-pEUzqK4KoN357ST5eM=3a-esG_nP2G3yA@mail.gmail.com>
References: <CA+icZUW4SJ1OTmKtcHWYkaW5pYzJZU8Gv7BtxAeto++aqYB6gA@mail.gmail.com>
	<CA+icZUVyWAog7sxKXLSODaeO8v9BJReR8LhruC1gLux57oJ7Hg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:64088 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752307Ab3CCI01 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 3 Mar 2013 03:26:27 -0500
In-Reply-To: <CA+icZUVyWAog7sxKXLSODaeO8v9BJReR8LhruC1gLux57oJ7Hg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: webmaster@kernel.org
Cc: Konstantin Ryabitsev <mricon@kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>

Same happens with ext4 GIT...

OLD: http://git.kernel.org/?p=linux/kernel/git/tytso/ext4.git

NEW: http://git.kernel.org/cgit/linux/kernel/git/tytso/ext4.git/tree/

FIXED: http://git.kernel.org/cgit/linux/kernel/git/tytso/ext4.git

- Sedat -


On Sat, Mar 2, 2013 at 2:40 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> [0] should be...
> <http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git>.
>
> - Sedat -
>
> On Sat, Mar 2, 2013 at 2:39 PM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
>> Hi,
>>
>> invoking the old linux-next WebGit URL [0] results in [1].
>> [2] would be correct.
>>
>> Regards,
>> - Sedat -
>>
>> [0] git.kernel.org - linux/kernel/git/next/linux-next.git/summary
>> [1] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/
>> [2] http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/
