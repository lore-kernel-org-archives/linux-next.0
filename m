From: Ben Dooks <ben@trinity.fluff.org>
Subject: Re: linux-next: manual merge of the s5p tree with the arm-soc tree
Date: Wed, 20 Jul 2011 11:13:58 +0100
Message-ID: <20110720101358.GT21138@trinity.fluff.org>
References: <20110720113536.72c28c19d623c5e7f8604ca2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:59775 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751289Ab1GTKOH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jul 2011 06:14:07 -0400
Content-Disposition: inline
In-Reply-To: <20110720113536.72c28c19d623c5e7f8604ca2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Abraham <thomas.ab@samsung.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Arnd Bergmann <arnd@arndb.de>

On Wed, Jul 20, 2011 at 11:35:36AM +1000, Stephen Rothwell wrote:
> Hi Kukjin,
> 
> Today's linux-next merge of the s5p tree got conflicts in drivers/tty/serial/s3c2400.c and drivers/tty/serial/s3c24a0.c between commits 632b7cf6c056 ("ARM: mach-s3c2400: delete") and af0e060e24ce ("ARM: mach-s3c24a0: delete")from the arm-soc tree and commit 470805f8f958 ("serial: Remove redundant console_initcall from s3c and s5p console drivers") from the s5p tree.
> 
> The former removes these files, so I did that.

Yes, there's little chance of these socs ever being added, so nico
removed all reference to them.

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.
