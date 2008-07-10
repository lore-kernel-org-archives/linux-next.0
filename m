From: Samuel Ortiz <sameo@openedhand.com>
Subject: Re: linux-next: manual merge of the mfd tree
Date: Thu, 10 Jul 2008 02:11:00 +0200
Message-ID: <20080710001059.GA2637@sortiz.org>
References: <20080708171103.f9c9a3ce.sfr@canb.auug.org.au>
Reply-To: Samuel Ortiz <sameo@openedhand.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]:48766 "EHLO
	pug.o-hand.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753135AbYGJAJi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Jul 2008 20:09:38 -0400
Content-Disposition: inline
In-Reply-To: <20080708171103.f9c9a3ce.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

On Tue, Jul 08, 2008 at 05:11:03PM +1000, Stephen Rothwell wrote:
> Hi Samuel,
> 
> Today's linux-next merge of the mfd tree got a conflict in MAINTAINERS
> between commit 4e0d13cbb71de2b1baf71ddd3c14f7ba8da810e5 ("MFD
> maintainer") from Linus' tree and commit
> 52554ec1473a5334ffe589053268d7dd89007afa ("MFD maintainer") from the mfd
> tree.
>
> Same commit - different white space. I used Linus' version.
Yep, I removed this commit from my for-next branch. Your merge should go
fine now.

Cheers,
Samuel.
