From: Mauro Carvalho Chehab <mchehab@redhat.com>
Subject: Re: linux-next: usb tree build failure
Date: Tue, 14 Oct 2008 15:26:55 -0200
Message-ID: <20081014152655.0d89f02b@pedra.chehab.org>
References: <20081014150802.e043baf3.sfr@canb.auug.org.au>
	<208cbae30810132251k7c671a12rf259855a252d093@mail.gmail.com>
	<208cbae30810141041j2133d5a6s92d61fd5ea40fd9f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:53322 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751046AbYJNS1g (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Oct 2008 14:27:36 -0400
In-Reply-To: <208cbae30810141041j2133d5a6s92d61fd5ea40fd9f@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alexey Klimov <klimov.linux@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, Douglas Schilling Landgraf <dougsland@gmail.com>

Hi Alexey,

The V4L/DVB and USB conflicts on linux-next are due to the merge of my tree
upstream, plus the conflict between Greg's original patch and the one on my
tree that were already merged.

No action is required from your side. It is just a matter of me and Greg to
update our trees.

Cheers,
Mauro

It it just a matter of me updating my linux-next tree.


On Tue, 14 Oct 2008 21:41:52 +0400
"Alexey Klimov" <klimov.linux@gmail.com> wrote:

> Hello, all
> Sorry, bother you all again.
> Here is the patch that removes info() and err()-statements in
> drivers/media/radio/radio-mr800.c
> Also, in previous letter i sent you patch that removes
> warn()-statements from there.
> 
> May be it can help current situation.


-- 

Cheers,
Mauro
