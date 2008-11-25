From: James Morris <jmorris@namei.org>
Subject: Re: userns tree ready
Date: Tue, 25 Nov 2008 12:05:17 +1100 (EST)
Message-ID: <alpine.LRH.1.10.0811251204450.18891@tundra.namei.org>
References: <20081125001651.GA10661@us.ibm.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:32900 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754570AbYKYBFi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 24 Nov 2008 20:05:38 -0500
In-Reply-To: <20081125001651.GA10661@us.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Serge E. Hallyn" <serue@us.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org

On Mon, 24 Nov 2008, Serge E. Hallyn wrote:

> Hi Stephen,
> 
> I've created a new userns tree - although the patches are completely
> unchanged from before they were pulled along with David's patches.
> They apply fine either right after James' security-next tree or at
> the end of linux-next.  The tree is at
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/sergeh/userns-2.6#next
> 
> like before, and is based on James's security-next tree.

I can merge this into my tree, although if it breaks, I'll need help from 
you to fix it.


-- 
James Morris
<jmorris@namei.org>
