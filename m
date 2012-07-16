From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for July 16
Date: Mon, 16 Jul 2012 09:56:45 +0200
Message-ID: <CA+icZUV1_QUyBh-PQoFy5jL5ft=neUvVyxx77PhiVgAnOCFUYA@mail.gmail.com>
References: <20120716171709.a2da2c69fd0052b1a519de65@canb.auug.org.au>
	<20120716074825.GK31729@ZenIV.linux.org.uk>
	<CA+icZUWBPm7wa=cHUwaFQkaVO5rKT39SZHpq68UdD8+HiLfUqQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:35756 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751568Ab2GPH4r (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Jul 2012 03:56:47 -0400
In-Reply-To: <CA+icZUWBPm7wa=cHUwaFQkaVO5rKT39SZHpq68UdD8+HiLfUqQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Jul 16, 2012 at 9:54 AM, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Mon, Jul 16, 2012 at 9:48 AM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>> On Mon, Jul 16, 2012 at 05:17:09PM +1000, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20120713:
>>>
>>> The ext4 tree lost its build failure.
>>>
>>> The vfs tree gained a build failure so I used the version from
>>> next-20120713.
>>
>> Details, please?
>
> [1] http://lkml.indiana.edu/hypermail/linux/kernel/1107.2/00046.html
>

Grr right subject - wrong email, Stephen's mail seems to be not in the
offline mail-archives, so I am quoting:

"Hi Al,

After merging the vfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/ext2/super.c: In function 'ext2_sync_fs':
fs/ext2/super.c:1191:2: error: implicit declaration of function
'dquot_writeback_dquots' [-Werror=implicit-function-declaration]
fs/ext3/super.c: In function 'ext3_sync_fs':
fs/ext3/super.c:2534:2: error: implicit declaration of function
'dquot_writeback_dquots' [-Werror=implicit-function-declaration]
fs/ext4/super.c: In function 'ext4_sync_fs':
fs/ext4/super.c:4493:2: error: implicit declaration of function
'dquot_writeback_dquots' [-Werror=implicit-function-declaration]

Caused by commits 05566b558a47 ("quota: Move quota syncing to ->sync_fs
method") and ad04033e79d2 ("quota: Split dquot_quota_sync() to writeback
and cache flushing part").  Please do build testing with and without
CONFIG QUOTA for quota changes ...

I have used the vfs tree from next-20120713 for today."

>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-next" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
