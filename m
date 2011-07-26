From: Michal Simek <monstr@monstr.eu>
Subject: Re: linux-next: Tree for July 26
Date: Tue, 26 Jul 2011 11:34:27 +0200
Message-ID: <4E2E8A23.6000601@monstr.eu>
References: <20110726155744.5c1bee67177bd94211ed8c2b@canb.auug.org.au>
Reply-To: monstr@monstr.eu
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ey0-f171.google.com ([209.85.215.171]:48117 "EHLO
	mail-ey0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753085Ab1GZJec (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Jul 2011 05:34:32 -0400
In-Reply-To: <20110726155744.5c1bee67177bd94211ed8c2b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Stephen,

Stephen Rothwell wrote:
> Hi all,
> 
> The powerpc allyesconfig build (at least) still fails today.
> 
> Changes since 20110725:
> 
> Undropped tree: iscsi-target
> 
> Linus' tree lost its build failure but gained another for which I applied
> a patch (supplied by Linus).
> 
> The m68knommu tree lost its conflicts.
> 
> The microblaze tree gained a conflict agains Linus' tree.

Have fixed this problem by reverting one pci patch. Will wait one more day 
before I send pull request.

Thanks,
Micha


-- 
Michal Simek, Ing. (M.Eng)
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel 2.6 Microblaze Linux - http://www.monstr.eu/fdt/
Microblaze U-BOOT custodian
