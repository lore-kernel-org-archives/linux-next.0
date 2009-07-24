From: Philipp Reisner <philipp.reisner@linbit.com>
Subject: Re: [Drbd-dev] [PATCH 00/16] drbd: a block device for HA clusters
Date: Fri, 24 Jul 2009 17:20:21 +0200
Message-ID: <200907241720.22771.philipp.reisner@linbit.com>
References: <1246894775-10855-1-git-send-email-philipp.reisner@linbit.com> <20090721185156.GA10126@johann> <20090722145917.055eddc1.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail09.linbit.com ([212.69.161.110]:45200 "EHLO
	mail09.linbit.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752100AbZGXPUY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Jul 2009 11:20:24 -0400
In-Reply-To: <20090722145917.055eddc1.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>, Andrew Morton <akpm@linux-foundation.org>, drbd-dev@lists.linbit.com, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

On Wednesday 22 July 2009 06:59:17 Stephen Rothwell wrote:
> Hi Lars,
>
> On Tue, 21 Jul 2009 20:51:56 +0200 Lars Ellenberg 
<lars.ellenberg@linbit.com> wrote:
> > Stephen: expect an explicit linux-next merge request
> > within the next few days.
>
> OK, just to be clear your tree should be based on Linus' tree (or some
> other *stable*, non rebasing, tree - *not* linux-next).
>

Hi Stephen,

Please add git://git.drbd.org/linux-2.6-drbd.git to linux-next.

The tree was initially based on v2.6.30-rc1. Later 2.6.31-rc1 was
merged in. 
I verified that it still merges with 2.6.31-rc4 without conflicts.

Thanks!

-Philipp
-- 
: Dipl-Ing Philipp Reisner
: LINBIT | Your Way to High Availability
: Tel: +43-1-8178292-50, Fax: +43-1-8178292-82
: http://www.linbit.com

DRBD(R) and LINBIT(R) are registered trademarks of LINBIT, Austria.
