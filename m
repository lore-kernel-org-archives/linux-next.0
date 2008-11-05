From: James Morris <jmorris@namei.org>
Subject: Re: linux-next: manual merge of the creds tree
Date: Thu, 6 Nov 2008 10:19:55 +1100 (EST)
Message-ID: <alpine.LRH.1.10.0811061019280.6690@tundra.namei.org>
References: <20081105155620.8da6ac84.sfr@canb.auug.org.au> <26171.1225886896@redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:45759 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752354AbYKEXUV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 5 Nov 2008 18:20:21 -0500
In-Reply-To: <26171.1225886896@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Eric Paris <eparis@redhat.com>

On Wed, 5 Nov 2008, David Howells wrote:

> 
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Today's linux-next merge of the creds tree got a conflict in
> > security/selinux/hooks.c between commit
> > 41d9f9c524a53477467b7e0111ff3d644198f191 ("SELinux: hold tasklist_lock
> > and siglock while waking wait_chldexit") from security-testing tree and
> > commit a3338909826d32d821158a6adc43ce0a1654b31d ("CRED: Make execve()
> > take advantage of copy-on-write credentials") from the creds tree.
> > 
> > I can't see how to fix this easily, so I will have to drop the tree for
> > today.  Please try the merge for yourself and see if you can come up with
> > a solution, thanks.
> 
> James: is it worth you pulling my patches into your tree?

Possibly after I get back from foss.my next week.  Can you tru and get 
more of the API changes into subsytem trees?

-- 
James Morris
<jmorris@namei.org>
