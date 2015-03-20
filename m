From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: manual merge of the spi tree with the jc_docs tree
Date: Fri, 20 Mar 2015 07:41:06 -0600
Message-ID: <20150320074106.74ed3ba5@lwn.net>
References: <20150320162354.3ed4a511@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tex.lwn.net ([70.33.254.29]:38549 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751033AbbCTNlE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 20 Mar 2015 09:41:04 -0400
In-Reply-To: <20150320162354.3ed4a511@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Adrian Remonda <adrianremonda@gmail.com>

On Fri, 20 Mar 2015 16:23:54 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next merge of the spi tree got a conflict in
> Documentation/spi/spidev_test.c between commit 988b22c519c8 ("spi:
> spidev_test: Added functionalities") from the jc_docs tree and commits
> b78ce7ed5409 ("spi: spidev_test: Cleaned hexadecimal dump"),
> 31a5c5a72b90 ("") and  ("") from the spi tree.

Weird, I dropped all that; I wonder how I managed to undrop it?  Will do
so again, sorry for the trouble.

jon
