From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Feb 8 [ idr fixes from akpm-tree ]
Date: Fri, 8 Feb 2013 09:07:29 +0100
Message-ID: <CA+icZUVG_3-daoHOwuSLcaB4t987L23DeX0Q4cq=OGkO-3j5Ag@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f181.google.com ([209.85.216.181]:55110 "EHLO
	mail-qc0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751317Ab3BHIHa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 8 Feb 2013 03:07:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Feb 8, 2013 at 5:31 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Changes since 20130207:
>
> The sound-asoc tree gained a build failure so I used the version from
> next-20130207.
>
> The watchdog tree gained a conflict against the mfd tree.
>
> I applied a patch to restore some config defaults on PPC64.
>
> ----------------------------------------------------------------------------
>

Just FYI:

I know of thwo idr patches in akpm-tree which are broken, means revert
the one in Linux-Next and apply v2 from patchwork-service!
The idr-ipc patch for example breaks fakeroot usage.

- Sedat -

[ Revert these ones ]
http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=commitdiff;h=2b24826129aab0352de55e44a99726aed47526a3
http://git.kernel.org/?p=linux/kernel/git/next/linux-next.git;a=commitdiff;h=5c72f8a116ad9e57b688e03ae9b44bf831100af9

[ Apply v2 ]
https://patchwork.kernel.org/patch/2111991/
https://patchwork.kernel.org/patch/2112111/
