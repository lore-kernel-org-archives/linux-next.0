From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Thu, 3 Dec 2015 10:57:26 +0100
Message-ID: <20151203095726.GA15428@lst.de>
References: <20151202161936.22b23668cf9dea9872b5079b@kernel.org> <20151202164527.GA31048@lst.de> <565F5D96.5050902@kernel.dk> <565FFFA5.6000003@bjorling.me> <20151203090638.GA14329@lst.de> <566010EE.6050806@bjorling.me>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:33849 "EHLO newverein.lst.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932655AbbLCJ52 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Dec 2015 04:57:28 -0500
Content-Disposition: inline
In-Reply-To: <566010EE.6050806@bjorling.me>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Matias =?iso-8859-1?Q?Bj=F8rling?= <m@bjorling.me>
Cc: Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>, Keith Busch <keith.busch@intel.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org

On Thu, Dec 03, 2015 at 10:52:46AM +0100, Matias Bj=F8rling wrote:
> The identify geometry command and bad block commands are part of the =
admin=20
> command set. Surely, as all these take a ns id, they can be moved and=
 be=20
> accessed naturally through the user queues.

Nah, these admin commands should go through the admin queue - but
having a request_queue as the argument to the callback just seems rathe=
r
off if it's not the right one.  Why can't you just pass the 'struct nvm=
_dev'
instead of the request_queue for these methods?
