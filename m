From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next: ide tree build failure
Date: Tue, 26 Aug 2008 22:04:04 +0200
Message-ID: <200808262204.05075.bzolnier@gmail.com>
References: <20080826140658.316d9727.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.184]:22863 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753875AbYHZUGp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Aug 2008 16:06:45 -0400
Received: by mu-out-0910.google.com with SMTP id g7so706278muf.1
        for <linux-next@vger.kernel.org>; Tue, 26 Aug 2008 13:06:43 -0700 (PDT)
In-Reply-To: <20080826140658.316d9727.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org


Hi,

On Tuesday 26 August 2008, Stephen Rothwell wrote:
> Hi Bart,
> 
> Today's linux-next build (x86_64_allmodconfig) failed like this:
> 
> ERROR: "ide_floppy_ioctl" [drivers/ide/ide-floppy_mod.ko] undefined!
> 
> Introduced by commit 487a606ecd39be80655bddc7f8d14bfdf48bf682
> ("ide-floppy: move all ioctl handling to ide-floppy_ioctl.c").
> 
> I added the following patch.

I integrated it into the guilty commit, thanks!
