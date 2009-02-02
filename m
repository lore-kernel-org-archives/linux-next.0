From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next:  ide quilt series import failure
Date: Mon, 2 Feb 2009 19:30:31 +0100
Message-ID: <200902021930.31599.bzolnier@gmail.com>
References: <20090202094815.ffb1f4de.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mu-out-0910.google.com ([209.85.134.191]:10479 "EHLO
	mu-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756120AbZBBSg5 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Feb 2009 13:36:57 -0500
Received: by mu-out-0910.google.com with SMTP id g7so1148144muf.1
        for <linux-next@vger.kernel.org>; Mon, 02 Feb 2009 10:36:56 -0800 (PST)
In-Reply-To: <20090202094815.ffb1f4de.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Borislav Petkov <petkovbb@googlemail.com>

On Sunday 01 February 2009, Stephen Rothwell wrote:
> Hi Bart,
> 
> Today's linux-next import of the ide quilt series failed like this:
> 
> ide-remove-ide_arch_intr-v2.patch
> error: include/asm-m68k/ide.h: does not exist in index
> 
> include/asm-m68k has been moved by commit
> 49148020bcb6910ce71417bd990a5ce7017f9bd3 ("m68k,m68knommu: merge header
> files") which was merged into Linus' tree on 2009-01-27.
> 
> I will drop the ide tree for today.

Fixed.  [ For some reason I had leftover include/asm-m68k/ here... ]

Thanks,
Bart
