From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the target-updates tree
Date: Wed, 07 Oct 2015 15:27:17 +0300
Message-ID: <87bncaj23e.fsf@ashishki-desk.ger.corp.intel.com>
References: <20151007144932.3e68e0f7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:26056 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751742AbbJGM1V (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 7 Oct 2015 08:27:21 -0400
In-Reply-To: <20151007144932.3e68e0f7@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Nicholas A. Bellinger" <nab@linux-iscsi.org>, Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Caused by commit
>
>   7bd1d4093c2f ("stm class: Introduce an abstraction for System Trace Module devices")
>
> from the char-misc tree interacting with commit
>
>   f71933438300 ("configfs: remove old API")
>
> I have reverted the target-updated commit for today.  If there is a
> better resolution (and I assume that there is), please let me know.

I'm going to follow up to this email with a fix that updates stm class
code to the new api, I'm not sure whos branch it should go to, because
it only works with Christoph's configfs patches in the -next.

Regards,
--
Alex
