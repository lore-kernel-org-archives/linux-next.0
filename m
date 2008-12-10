From: Paul Moore <paul.moore@hp.com>
Subject: Re: linux-next: manual merge of the lblnet tree
Date: Wed, 10 Dec 2008 12:34:20 -0500
Message-ID: <200812101234.20822.paul.moore@hp.com>
References: <20081208190708.1d2c37ec.sfr@canb.auug.org.au> <200812081758.10731.paul.moore@hp.com> <493FF6E8.2090201@schaufler-ca.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g5t0006.atlanta.hp.com ([15.192.0.43]:6277 "EHLO
	g5t0006.atlanta.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753915AbYLJRey (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 10 Dec 2008 12:34:54 -0500
In-Reply-To: <493FF6E8.2090201@schaufler-ca.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: James Morris <jmorris@namei.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, David Howells <dhowells@redhat.com>

On Wednesday 10 December 2008 12:05:44 pm Casey Schaufler wrote:
> Paul Moore wrote:
> > On Monday 08 December 2008 4:16:24 pm James Morris wrote:
> >> On Mon, 8 Dec 2008, Paul Moore wrote:
> >>> James, is the security-testing tree rebased regularly or is
> >>> suitable to back a tree against?
> >>
> >> No, it doesn't get rebased.
> >
> > Okay, experiment time.  I think I managed to pull from all the
> > right spots, merge everything appropriately and end up with a
> > security/ directory that builds so I pushed it back out to the
> > lblnet-2.6_next tree.  I'm not quite sure the proper etiquette here
> > but I had to fix Casey's patch a bit since it would apply cleanly;
> > Casey if you could take a look I would appreciate it (it isn't
> > exactly like what Stephen posted earlier but it is pretty darn
> > close).
>
> The Smack Verification Laboratory reports that lblnet-2.6_next is
> working as expected for UDP and TCP.

Sounds expensive :)  Thanks for checking, assuming no problems I'll push 
those patches with the rest of the labeled networking patches when the 
next merge window opens.

-- 
paul moore
linux @ hp
