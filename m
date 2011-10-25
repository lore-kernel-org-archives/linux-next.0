From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the pm tree with the s390 tree
Date: Tue, 25 Oct 2011 10:39:46 +0200
Message-ID: <201110251039.46327.rjw@sisk.pl>
References: <20111025182025.d57f82a57ceaa8fae7cc5127@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:59608 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755201Ab1JYIhQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 Oct 2011 04:37:16 -0400
In-Reply-To: <20111025182025.d57f82a57ceaa8fae7cc5127@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>

On Tuesday, October 25, 2011, Stephen Rothwell wrote:
> Hi Rafael,
> 
> Today's linux-next merge of the pm tree got a conflict in
> arch/s390/kernel/suspend.c between commit 4de2166b1804 ("[S390] sparse:
> fix sparse warnings about missing prototypes") from the s390 tree and
> commit 85055dd805f0 ("PM / Hibernate: Include storage keys in hibernation
> image on s390") from the pm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

The fix looks correct to me, so please carry it going forward (unless
Martin decides to pull it into his tree).

Thanks,
Rafael
