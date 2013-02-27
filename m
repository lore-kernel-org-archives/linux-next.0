From: Mark Jackson <mpfj-list@mimc.co.uk>
Subject: Re: linux-next: JFFS2 corruption
Date: Wed, 27 Feb 2013 15:12:01 +0000
Message-ID: <512E2241.9040705@mimc.co.uk>
References: <512CD9BA.3080300@mimc.co.uk> <20130227101824.6e18ba21fb99070594420f29@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mercuryimc.plus.com ([80.229.200.144]:39989 "EHLO
	centos1.newflow.co.uk" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758160Ab3B0PME (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 27 Feb 2013 10:12:04 -0500
In-Reply-To: <20130227101824.6e18ba21fb99070594420f29@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, lkml <linux-kernel@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>

On 26/02/13 23:18, Stephen Rothwell wrote:
> Hi Mark,
> 
> On Tue, 26 Feb 2013 15:50:18 +0000 Mark Jackson <mpfj-list@mimc.co.uk> wrote:
>>
>> Just tested the current next-20130226 on a custom AM335X board, and if I mount
>> our JFFS2 image as read/write, the next reboot shows the image as being corrupt.
>>
>> If I reprogram the jffs2 image into NAND and only mount the volume as read-only,
>> no corruption occurs and the system remains intact.
>>
>> I have also tested:-
>>
>> (a) reprogram ubifs image into nand
>> (b) boot the volume as read-only (corrupt -> no)
>> (c) remount the volume as read/write
>> (d) rebooting the volume as read-only (corrupt -> yes)
> 
> Thanks for all the testing.  Sam questions as in my other email.

Okay, just tested 3v8 plus:-

https://patchwork.kernel.org/patch/1931251/
https://patchwork.kernel.org/patch/1931221/
https://patchwork.kernel.org/patch/1931201/
and changed drivers/mtd/nand/elm.c, line 388 "ti,am33xx-elm" to "ti,am3352-elm"

This produces an identical corruption.

I have also tested next-20130225 and next-20130227, and both cause the same corruption.

Regards
Mark J.
