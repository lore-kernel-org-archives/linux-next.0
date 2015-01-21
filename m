From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 20 -- Kernel panic - Unable to mount
 root fs
Date: Wed, 21 Jan 2015 13:38:59 -0800
Message-ID: <20150121213859.GA22520@roeck-us.net>
References: <20150121033600.GN29656@ZenIV.linux.org.uk>
 <54BF2496.4000807@roeck-us.net>
 <20150121043637.GO29656@ZenIV.linux.org.uk>
 <20150121110539.GA8924@kria>
 <54BFAA5D.4040108@roeck-us.net>
 <20150121182905.GQ29656@ZenIV.linux.org.uk>
 <54BFF8B3.6060802@roeck-us.net>
 <20150121200626.GR29656@ZenIV.linux.org.uk>
 <54C01418.5060204@roeck-us.net>
 <20150121212833.GS29656@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:52215 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751751AbbAUVjl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Jan 2015 16:39:41 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YE301-000PFo-97
	for linux-next@vger.kernel.org; Wed, 21 Jan 2015 21:39:41 +0000
Content-Disposition: inline
In-Reply-To: <20150121212833.GS29656@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Sabrina Dubroca <sd@queasysnail.net>, Paul Moore <pmoore@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-audit@redhat.com, Richard Guy Briggs <rgb@redhat.com>

On Wed, Jan 21, 2015 at 09:28:33PM +0000, Al Viro wrote:
> On Wed, Jan 21, 2015 at 01:03:20PM -0800, Guenter Roeck wrote:
> > 
> > failing case:
> > 
> > path_lookupat: calling path_init 'usr' flags=40
> > path_init: link_path_walk() returned 0
> > path_lookupat: path_init 'usr' flags=40[50] returned 0
> > walk_component: lookup_fast() returned 1
> > walk_component: lookup_slow() returned 0
> > walk_component: inode=  (null), negative=1
> > do_path_lookup(usr, 0x10)
> > path_lookupat: calling path_init 'usr' flags=50
> > path_init: link_path_walk() returned 0
> > path_lookupat: path_init 'usr' flags=50[50] returned 0
> > mkdir[c74012a0,/kkk] => 0						<==== SIC!
> 
> Cute. 'k' being 0x6b, aka POISON_FREE...  OK, the next question is what's
> been freed under us - I don't believe that it's dentry itself...
> Oh, fuck.  OK, I see what happens.  Look at kern_path_create(); it does
> LOOKUP_PARENT walk, leaving nd->last pointing to the last component of
> the *COPY* of the name it's just created, walked and freed.
> 
Cool.

> OK...  Fortunately, struct nameidata is completely opaque outside of fs/namei.c,
> so we only need to care about a couple of codepaths.
> 
> Folks, could you check if the following on top of linux-next fixes the problem?
> 
> diff --git a/fs/namei.c b/fs/namei.c
> index 323957f..cda89c3 100644

Yes, this patch fixes the problem for me.

Guenter
