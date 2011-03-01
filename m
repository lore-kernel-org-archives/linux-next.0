From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the bkl-config tree with the tty tree
Date: Tue, 1 Mar 2011 23:24:27 +0100
Message-ID: <201103012324.27725.arnd@arndb.de>
References: <20110228174007.b6faf01e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:58249 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756496Ab1CAWYi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2011 17:24:38 -0500
In-Reply-To: <20110228174007.b6faf01e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>

Hi Stephen,

On Monday 28 February 2011 07:40:07 Stephen Rothwell wrote:
> Today's linux-next merge of the bkl-config tree got a conflict in
> drivers/staging/Kconfig between commits
> 4a6514e6d096716fb7bedf238efaaca877e2a7e8 ("tty: move obsolete and broken
> tty drivers to drivers/staging/tty/") and
> 4c37705877e74c02c968735c2eee0f84914cf557 ("tty: move obsolete and broken
> generic_serial drivers to drivers/staging/generic_serial/") from the tty
> tree and commit a3ba01b63468c925518da2da0ac3be11358f60cb ("BKL: move
> CONFIG_BKL to staging") from the bkl-config tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

I have cleared the branch in my repository now, since the contents
were very outdated. I have a newer branch named 'final' with all the patches
that are needed on top of -next to kill the BKL for good.

I'll send the patches out for review again and if everyone is happy,
I can update the config branch so they get into -next.


	Arnd
