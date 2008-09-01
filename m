From: Alan Cox <alan@redhat.com>
Subject: Re: linux-next: Tree for August 29
Date: Mon, 1 Sep 2008 18:24:39 -0400 (EDT)
Message-ID: <503446464.5113091220307879885.JavaMail.root@zmail02.collab.prod.int.phx2.redhat.com>
References: <200809011833.02570.bzolnier@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:55025 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751055AbYIAW1K (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Sep 2008 18:27:10 -0400
In-Reply-To: <200809011833.02570.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

> Still happens with next-20080901, also upon closer look it is not
> just an innocent trace dump as /proc/sys/kernel/pty/ dir and its
> content are gone.

That would not surprise me. The 0901 tree would have been built at the end of the weekend. I don't actually work 7 days a week, but 5.

I've pushed that (including a new implementation of the needed field) tonight.

Alan
