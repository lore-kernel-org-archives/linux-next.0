From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the libata tree
Date: Wed, 27 Jul 2016 16:32:31 +1000
Message-ID: <20160727163231.51e88384@canb.auug.org.au>
References: <20160721152603.4cf94e55@canb.auug.org.au>
	<20160721144459.GA22680@htj.duckdns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54601 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751660AbcG0Gcd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Jul 2016 02:32:33 -0400
In-Reply-To: <20160721144459.GA22680@htj.duckdns.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tom Yan <tom.ty89@gmail.com>

Hi Tejun,

On Thu, 21 Jul 2016 10:44:59 -0400 Tejun Heo <tj@kernel.org> wrote:
>
> On Thu, Jul 21, 2016 at 03:26:03PM +1000, Stephen Rothwell wrote:
> > Hi Tejun,
> > 
> > After merging the libata tree, today's linux-next build (arm
> > multi_v7_defconfig) produced these warning:
> > 
> > drivers/ata/libata-scsi.c: In function 'ata_mselect_caching':
> > drivers/ata/libata-scsi.c:3637:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
> >     if (mpage[i + 2] & 0xfb != buf[i] & 0xfb) {
> >                             ^
> > drivers/ata/libata-scsi.c: In function 'ata_mselect_control':
> > drivers/ata/libata-scsi.c:3702:28: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]
> >     if (mpage[i + 2] & 0xfb != buf[i] & 0xfb) {
> >                             ^
> > 
> > Introduced by commit
> > 
> >   9b7844a8c34a ("libata-scsi: fix read-only bits checking in ata_mselect_*()")  
> 
> Already reverted the patch.  Sorry about that.

This patch is still in the libata tree
(git://git.kernel.org/pub/scm/linux/kernel/git/tj/libata.git#for-next)
-- 
Cheers,
Stephen Rothwell
