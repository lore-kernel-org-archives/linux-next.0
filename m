From: Phillip Lougher <phillip.lougher@gmail.com>
Subject: Re: linux-next: clean up time (pass 1)
Date: Thu, 2 Jun 2011 02:26:07 +0100
Message-ID: <BANLkTim6MbS1E=9LyX=rsDr+JNuojPC4GQ@mail.gmail.com>
References: <20110601110616.861247de.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:42258 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753250Ab1FBB0I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Jun 2011 21:26:08 -0400
In-Reply-To: <20110601110616.861247de.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Jun 1, 2011 at 2:06 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Looking through the trees currently included in linux-next, I get the
> feeling that some of them may be obsolete.
>
> Here is a list of tree that had no commits in them at the openning of the
> previous two merge windows:
>
> linux-spec
> pxa
> galak
> ceph
> configfs
> jfs
> squashfs

This is a surprise ... I'm sure I had commits in my squashfs
linux-next tree at the opening of the last but one merge window...

Linux 2.6.38 released 14 Mar 2011

$ git log --pretty="%ci %s"
...
2011-02-28 18:43:48 +0000 Squashfs: wrap squashfs_mount() definition
2011-02-28 18:35:44 +0000 Squashfs: xz_wrapper doesn't need to include squashfs_
2011-02-28 18:35:36 +0000 Squashfs: Update documentation to include compression
2011-02-28 18:35:28 +0000 Squashfs: Update Kconfig help text to include xz compr
2011-02-28 18:34:24 +0000 Squashfs: add compression options support to xz decomp
2011-02-28 18:21:59 +0000 Squashfs: extend decompressor framework to handle comp
2011-02-07 16:03:55 -0800 Linux 2.6.38-rc4

Phillip
