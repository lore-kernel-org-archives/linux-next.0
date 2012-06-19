From: Michal Simek <monstr@monstr.eu>
Subject: Re: linux-next: Tree for Jun 4
Date: Tue, 19 Jun 2012 08:51:01 +0200
Message-ID: <4FE02155.2010505@monstr.eu>
References: <20120604154053.31c23de0a68defd4a9f773fc@canb.auug.org.au>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:43641 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751928Ab2FSGvG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Jun 2012 02:51:06 -0400
Received: by bkcji2 with SMTP id ji2so4751304bkc.19
        for <linux-next@vger.kernel.org>; Mon, 18 Jun 2012 23:51:05 -0700 (PDT)
In-Reply-To: <20120604154053.31c23de0a68defd4a9f773fc@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On 06/04/2012 07:40 AM, Stephen Rothwell wrote:
> Hi all,
>
> Changes since 20120601:
>
> New tree: leds

Haven't tracked which branch contains it but there are two new patches
for Microblaze where at least one is wrong (compilation failure).
(Firstly merged Jun 4).
Based on that I think that these changes are not even tested on hw.

microblaze: fix the horror with restarts of sigreturn()
microblaze: fix handling of multiple pending signals

Al: Can you please give me some information about?
They should definitely go through my tree and has to be tested.
Please remove them from your branch which is merged to linux-next and send them as standard patches
to LKML and CC me.

Thanks,
Michal


-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
