From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: linux-next: failed to import the device-mapper quilt series
Date: Mon, 24 Oct 2011 20:22:39 +0100
Message-ID: <20111024192239.GA18667@agk-dp.fab.redhat.com>
References: <20111025061010.26d2b727559242a5d188918e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:1726 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752694Ab1JXTWo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Oct 2011 15:22:44 -0400
Content-Disposition: inline
In-Reply-To: <20111025061010.26d2b727559242a5d188918e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Oct 25, 2011 at 06:10:10AM +1100, Stephen Rothwell wrote:
> And indeed, this file does not exist even though this patch is trying to
> patch it (not create it).

Hmmm.  Yes, that patch is corrupted.  I'll regenerate it.

Alasdair
