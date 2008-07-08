From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: linux-next:  ide/m68k build failure
Date: Tue, 8 Jul 2008 19:45:52 +0200
Message-ID: <200807081945.52423.bzolnier@gmail.com>
References: <20080708225555.e3dae9be.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from yw-out-2324.google.com ([74.125.46.28]:1788 "EHLO
	yw-out-2324.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753199AbYGHSuy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 8 Jul 2008 14:50:54 -0400
Received: by yw-out-2324.google.com with SMTP id 9so1214191ywe.1
        for <linux-next@vger.kernel.org>; Tue, 08 Jul 2008 11:50:53 -0700 (PDT)
In-Reply-To: <20080708225555.e3dae9be.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

On Tuesday 08 July 2008, Stephen Rothwell wrote:
> Hi Bart,
> 
> Today's linux-next build (m68k defconfig) failed like this:
> 
> drivers/ide/legacy/falconide.c:120: error: 'NODEV' undeclared (first use in this function)
> 
> Caused by commit 6c99c52c52e6a1532b502df89a6cffe19626d295 ("ide: add
> ide_host_free() helper").
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

thanks, integrated with the guilty patch
