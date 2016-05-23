From: Xiong Zhou <jencce.kernel@gmail.com>
Subject: Re: linux-next: Tree for May 17
Date: Mon, 23 May 2016 16:13:28 +0800
Message-ID: <CADJHv_tz6NeJtYM4R6R6PQjYm=UL7QM0ErnprzFZORrLY6WDkQ@mail.gmail.com>
References: <20160517150412.665a3de4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36144 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752806AbcEWINa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 23 May 2016 04:13:30 -0400
In-Reply-To: <20160517150412.665a3de4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

hi,

On Tue, May 17, 2016 at 1:04 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Please do not add any v4.8 destined material to your linux-next included
> branches until after v4.7-rc1 has been released.
>
> Changes since 20160516:
>
> The vfs tree gained a conflict against the ext4 tree.
>
> The net-next tree gained a conflict against the arm64 tree.
>
> The spi tree lost its build failure.
>
> Non-merge commits (relative to Linus' tree): 9737
>  8314 files changed, 424907 insertions(+), 177068 deletions(-)
>
> ----------------------------------------------------------------------------
>
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you

Patches after 0516 are not there.

i'm chasing an oom issue between 0516 and 0518 trees while missed
0517 tag, so is the patch file the only way to get there trying 0517 tree?
