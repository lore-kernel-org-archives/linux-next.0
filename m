From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: X200 suspend issue / linux-next: Tree for January 21
Date: Tue, 27 Jan 2009 16:31:59 +0100
Message-ID: <200901271632.00026.rjw@sisk.pl>
References: <20090121150249.a87aca09.sfr@canb.auug.org.au> <20090121144420.GA20617@denkbrett.schottelius.org> <20090127140558.GA24950@elf.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:60326 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751785AbZA0Pcn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 27 Jan 2009 10:32:43 -0500
In-Reply-To: <20090127140558.GA24950@elf.ucw.cz>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pavel Machek <pavel@suse.cz>
Cc: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tuesday 27 January 2009, Pavel Machek wrote:
> On Wed 2009-01-21 15:44:20, Nico -telmich- Schottelius wrote:
> > Hello!
> > 
> > News: The system freezes for almost a second and wakes up again!
> > 
> > At least no crash this time!
> 
> Good.
> 
> Maybe the suspends-then-autoresumes exists in 2.6.29-rc2, too...? Can
> you try disabling CONFIG_USB?

That would be http://bugzilla.kernel.org/show_bug.cgi?id=12399 , I think.

Thanks,
Rafael
