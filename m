From: Alan Cox <alan@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the tty tree
Date: Thu, 19 Jul 2012 11:41:12 +0100
Message-ID: <20120719114112.1ccccb54@bob.linux.org.uk>
References: <20120719143627.adc9d5e5333449d6c8588a99@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:57454 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752594Ab2GSKYK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 19 Jul 2012 06:24:10 -0400
In-Reply-To: <20120719143627.adc9d5e5333449d6c8588a99@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

> Caused by commit adc8d746caa6 ("tty: move the termios object into the
> tty").  Grep and build testing are your friends ...
> 
> I have used the tty tree from next-20120712 again for today.

Doh, patch sent
