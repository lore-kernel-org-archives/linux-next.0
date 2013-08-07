From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: build failure after merge of the ext4 tree
Date: Wed, 7 Aug 2013 07:16:57 +0200
Message-ID: <CA+icZUUt4domktYZZn0Qp3BZoSFqmKic4qSnVP4cuTKwUww_=A@mail.gmail.com>
References: <20130729110816.12958c3a26400f444a9a5012@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-we0-f182.google.com ([74.125.82.182]:54197 "EHLO
	mail-we0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754707Ab3HGFRB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2013 01:17:01 -0400
In-Reply-To: <20130729110816.12958c3a26400f444a9a5012@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Theodore Ts'o <tytso@mit.edu>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 29, 2013 at 3:08 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Theodore,
>
> After merging the ext4 tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> fs/ext4/ialloc.c: In function '__ext4_new_inode':
> fs/ext4/ialloc.c:817:1: warning: label 'next_ino' defined but not used [-Wunused-label]
>  next_ino:
>  ^
> fs/ext4/ialloc.c:792:4: error: label 'next_inode' used but not defined
>     goto next_inode;
>     ^
>
> Hmm ...
>
> Caused by commit 4a8603ef197a ("ext4: avoid reusing recently deleted
> inodes in no journal mode").
>
> I have used the ext4 tree from next-20130726 for today.

Since this message ext4-tree was not updated.
The commit "ext4: avoid reusing recently deleted inodes in no journal
mode" was refreshed and has a different commit-id.
Did you test with this one? You still see the breakage?

- Sedat -

[1] http://git.kernel.org/cgit/linux/kernel/git/tytso/ext4.git/patch/?id=533ec0ed5bac34233087f0c10c698d20095d6628
