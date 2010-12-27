From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for December 27
Date: Mon, 27 Dec 2010 09:04:06 +0100
Message-ID: <AANLkTikbiART+SX_JwM=pcAg0NJffVgX1oU=aO42dmbC@mail.gmail.com>
References: <20101227170451.a9a9f873.sfr@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:38378 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752531Ab0L0IFE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 27 Dec 2010 03:05:04 -0500
In-Reply-To: <20101227170451.a9a9f873.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Dec 27, 2010 at 7:04 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> [The mirroring on kernel.org is running slowly]
>
> Changes since 20101221:
>

Can you try to upload/push via IPADDR?

$ host git.kernel.org
git.kernel.org is an alias for git.geo.kernel.org.
git.geo.kernel.org is an alias for git.eu.kernel.org.
git.eu.kernel.org has address 199.6.1.166
git.eu.kernel.org has address 130.239.17.7

Being in EU, I get nearly maximum of my DSL-6000 download-rate:

$ git clone git://130.239.17.7/pub/scm/linux/kernel/git/npiggin/linux-npiggin.git
Cloning into linux-npiggin...
remote: Counting objects: 1812908, done.
remote: Compressing objects: 100% (279491/279491), done.
Receiving objects:  13% (252336/1812908), 111.50 MiB | 689 KiB/s

> The sound tree gained a build failure, so I used the version that would
> have been in next-20101223.
>

I thought there was no "next-20101223" :-).

Can you please upload the patch-diff to
<http://www.kernel.org/pub/linux/kernel/v2.6/next/>?
Thanks in advance.

- Sedat -
