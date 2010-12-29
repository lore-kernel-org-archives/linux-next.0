From: Anca Emanuel <anca.emanuel@gmail.com>
Subject: Re: linux-next: Tree for December 29
Date: Wed, 29 Dec 2010 08:41:29 +0200
Message-ID: <AANLkTikq50KLGwS1_=uA=TXz2b=LNzr_TKUSiZu-an1m@mail.gmail.com>
References: <20101229130700.0ef93735.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:54491 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750786Ab0L2Glb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Dec 2010 01:41:31 -0500
In-Reply-To: <20101229130700.0ef93735.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Greg KH <greg@kroah.com>

  CC [M]  drivers/staging/cx25821/cx25821-video.o
drivers/staging/cx25821/cx25821-video.c: In function =91video_open=92:
drivers/staging/cx25821/cx25821-video.c:817: error: implicit
declaration of function =91lock_kernel=92
drivers/staging/cx25821/cx25821-video.c:834: error: implicit
declaration of function =91unlock_kernel=92
make[4]: *** [drivers/staging/cx25821/cx25821-video.o] Error 1
make[3]: *** [drivers/staging/cx25821] Error 2
make[2]: *** [drivers/staging] Error 2
