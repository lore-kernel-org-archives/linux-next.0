From: Krzysztof Halasa <khc@pm.waw.pl>
Subject: Re: linux-next: hdlc tree build failure
Date: Thu, 14 Aug 2008 20:45:34 +0200
Message-ID: <m34p5nmo4x.fsf@maximus.localdomain>
References: <20080814153732.63307d0e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from khc.piap.pl ([195.187.100.11]:49006 "EHLO khc.piap.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752166AbYHNSpg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Aug 2008 14:45:36 -0400
In-Reply-To: <20080814153732.63307d0e.sfr@canb.auug.org.au> (Stephen Rothwell's message of "Thu\, 14 Aug 2008 15\:37\:32 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi,

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Today's linux-next build (x86_64 allmodconfig) failed like this:
>
> drivers/net/wan/hdlc_ppp.c: In function 'ppp_cp_parse_cr':
> drivers/net/wan/hdlc_ppp.c:384: error: 'struct hdlc_device' has no
> member named 'stats'

Oops, sorry about that, my fault, already fixed it.

> I have to wonder if this was even build tested ...

It was, without the dev->stats patch which I made later. Then
I rebased, and even saw the problem while doing so :-(
-- 
Krzysztof Halasa
