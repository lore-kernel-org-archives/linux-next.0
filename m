From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: linux-next: build failure after merge of the moduleh tree
Date: Tue, 2 Aug 2011 11:15:33 +0100
Message-ID: <20110802101533.GQ10499@agk-dp.fab.redhat.com>
References: <20110802151306.4fb9904e55fe9b489a3cf29d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:25525 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750998Ab1HBKPi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Aug 2011 06:15:38 -0400
Content-Disposition: inline
In-Reply-To: <20110802151306.4fb9904e55fe9b489a3cf29d@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Thornber <thornber@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Alasdair G Kergon <agk@redhat.com>

On Tue, Aug 02, 2011 at 03:13:06PM +1000, Stephen Rothwell wrote:
> This really is a bug in the original patch as you should explicitly
> include module.h if you are using the module facilities.

Fixed, thanks.

Alasdair
