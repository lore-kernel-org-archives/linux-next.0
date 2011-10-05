From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the devicetree tree
Date: Tue, 4 Oct 2011 23:54:40 -0600
Message-ID: <CACxGe6vboBY+Wrw74f-dgu6MGfQ=ASiZm1e4qPYZh0K-0fWmtw@mail.gmail.com>
References: <20111005162414.da7b35fd2baf34efa63d2f2a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:54403 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932975Ab1JEFzB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Oct 2011 01:55:01 -0400
In-Reply-To: <20111005162414.da7b35fd2baf34efa63d2f2a@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

On Tue, Oct 4, 2011 at 11:24 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Grant,
>
> After merging the devicetree tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/tty/serial/altera_jtaguart.c:483:3: error: implicit declaration of function 'of_match_ptr' [-Werror=implicit-function-declaration]
> drivers/tty/serial/altera_jtaguart.c:483:34: error: 'altera_jtaguart_match' undeclared here (not in a function)
>
> Caused by commit 85888069cf5d ("tty: use of_match_ptr() for
> of_match_table entry").

Thanks Stephen.

Looks like a missing include of linux/of.h from that driver.  I'll fix
up my tree.

g.
