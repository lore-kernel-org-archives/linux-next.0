From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: linux-next: Tree for November 7
Date: Sat, 8 Nov 2008 21:43:15 +0300
Message-ID: <20081108184315.GA9382@x200.localdomain>
References: <20081107205457.f64dea59.sfr@canb.auug.org.au> <200811081257.45184.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.191]:51244 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751056AbYKHSjy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 8 Nov 2008 13:39:54 -0500
Content-Disposition: inline
In-Reply-To: <200811081257.45184.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, "David S. Miller" <davem@davemloft.net>

On Sat, Nov 08, 2008 at 12:57:44PM +0100, Bartlomiej Zolnierkiewicz wrote:
> On Friday 07 November 2008, Stephen Rothwell wrote:
> > Changes since 20081106:
> 
> The following patch fixes the panic on loopback device registration
> (patch is an interdiff between old and new version of "net: Guaranetee
> the proper ordering of the loopback device." fix from Eric).
> 
> [ I'm sure this will get fixed in -net tree (if not fixed already)
>   but at the moment it is needed for linux-next. ]

This patch alone is a) not enough, and b) davem already pushed out correct
version.
