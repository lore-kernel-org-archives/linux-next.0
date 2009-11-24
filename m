From: Jean Delvare <khali@linux-fr.org>
Subject: Re: tree addition request
Date: Tue, 24 Nov 2009 08:39:47 +0100
Message-ID: <20091124083947.0743c7d5@hyperion.delvare>
References: <20091123223044.GM23772@trinity.fluff.org>
	<20091124105114.2149e4a0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from poutre.nerim.net ([62.4.16.124]:56295 "EHLO poutre.nerim.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757628AbZKXHjt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Nov 2009 02:39:49 -0500
In-Reply-To: <20091124105114.2149e4a0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ben Dooks <ben-linux@fluff.org>, linux-next@vger.kernel.org, Russell King <rmk@arm.linux.org.uk>

Hi Stephen, Ben,

On Tue, 24 Nov 2009 10:51:14 +1100, Stephen Rothwell wrote:
> On Mon, 23 Nov 2009 22:30:44 +0000 Ben Dooks <ben-linux@fluff.org> wrote:
> > git://git.fluff.org/bjdooks/linux.git next-i2c

Ben, if this tree is somewhat official, please consider listing it in
MAINTAINERS.

> I already have an i2c quilt series from Jean Delvare
> <khali@linux-fr.org>, how does this relate to that?

Ben and me co-maintain the i2c subsystem. I take care of i2c-core and
PC driver, while Ben maintains the embedded platform drivers. There
should be no overlapping in our trees.

Ideally my tree would be included first, in case Ben has changes which
depend on i2c-core changes (which would belong to my tree). But I can't
remember such a case in the past, so I don't expect it to be frequent.

-- 
Jean Delvare
