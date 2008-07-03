From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: inux-next: Tree for July 1
Date: Thu, 3 Jul 2008 17:36:54 +0200
Message-ID: <20080703153654.GB2157@osiris.boeblingen.de.ibm.com>
References: <20080702011434.6fb403d5.sfr@canb.auug.org.au> <20080702215306.61367733.akpm@linux-foundation.org> <20080702215846.f6b0491b.akpm@linux-foundation.org> <20080702221132.15a57a72.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate5.uk.ibm.com ([195.212.29.138]:8496 "EHLO
	mtagate5.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754805AbYGCPhZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Jul 2008 11:37:25 -0400
Content-Disposition: inline
In-Reply-To: <20080702221132.15a57a72.akpm@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Wed, Jul 02, 2008 at 10:11:32PM -0700, Andrew Morton wrote:
> 
> arch/s390/appldata/appldata_base.c: In function 'appldata_generic_handler':
> arch/s390/appldata/appldata_base.c:393: error: implicit declaration of function 'P_ERROR'
> 
> I dunno what that's all about - P_ERROR got deleted but it still has
> users.
> 
> That's enough s390ing for today...

Yes... I fixed that and also yet another compile bug.
We should pay more attention when pushing out new stuff. Sorry about that.
