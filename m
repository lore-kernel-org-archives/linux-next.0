From: Tejun Heo <tj@kernel.org>
Subject: Re: linux-next: build warnings after merge of the libata tree
Date: Thu, 21 Jul 2016 10:44:59 -0400
Message-ID: <20160721144459.GA22680@htj.duckdns.org>
References: <20160721152603.4cf94e55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33780 "EHLO
	mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752718AbcGUOpC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Jul 2016 10:45:02 -0400
Content-Disposition: inline
In-Reply-To: <20160721152603.4cf94e55@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tom Yan <tom.ty89@gmail.com>

Hello, Stephen.

On Thu, Jul 21, 2016 at 03:26:03PM +1000, Stephen Rothwell wrote:
> Hi Tejun,
> 
> After merging the libata tree, today's linux-next build (arm
> multi_v7_defconfig) produced these warning:
> 
> drivers/ata/libata-scsi.c: In function 'ata_mselect_caching':
> drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
>     if (mpage[i + 2] & 0xfb != buf[i] & 0xfb) {
>                             ^
> drivers/ata/libata-scsi.c: In function 'ata_mselect_control':
> drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
>     if (mpage[i + 2] & 0xfb != buf[i] & 0xfb) {
>                             ^
> 
> Introduced by commit
> 
>   9b7844a8c34a ("libata-scsi: fix read-only bits checking in ata_mselect_*()")

Already reverted the patch.  Sorry about that.

Thanks.

-- 
tejun
