From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: Heavy suspend and io problems in 2.6.27-rc1-00156-g94ad374
Date: Mon, 4 Aug 2008 21:32:40 +0200
Message-ID: <200808042132.41020.rjw@sisk.pl>
References: <20080731210507.GA6094@denkbrett.schottelius.org> <20080804090654.GA4747@denkbrett.schottelius.org> <20080804161443.GA4905@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:46753 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754336AbYHDT36 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 4 Aug 2008 15:29:58 -0400
In-Reply-To: <20080804161443.GA4905@denkbrett.schottelius.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico Schottelius <nico-linux-kernel-bugreport20080731@schottelius.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On Monday, 4 of August 2008, Nico Schottelius wrote:
> Hello again!
> 
> I retested it with linux-next + updates from its branches
> (=2.6.27-rc1-next-20080804-denkbrett-03792-g1d2be1a)
> 
> with and without the patch.
> 
> The result is still the same as below.
> 
> No xorg is running, btw.
> 
> Sincerly,
> 
> Nico
> 
> ps: I am using this tree:
> 
>    http://unix.schottelius.org/cgi-bin/gitweb.cgi?p=foreign/linux-2.6;a=summary
> 
>    Which is linux-next-20080804 + merges from the listed branches.

Well, fine, but this is not exactly helpful.

Can you test the current Linus' tree with the patch from bug #11178, please?

Thanks,
Rafael
