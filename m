From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Tue, 14 Apr 2015 17:02:15 -0400
Message-ID: <20150414210215.GD29810@thunk.org>
References: <20150414113025.06905c2a@canb.auug.org.au>
 <20150414014855.GU889@ZenIV.linux.org.uk>
 <20150414170000.GB29810@thunk.org>
 <20150414171743.GC889@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:39528 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754069AbbDNVCU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2015 17:02:20 -0400
Content-Disposition: inline
In-Reply-To: <20150414171743.GC889@ZenIV.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

On Tue, Apr 14, 2015 at 06:17:43PM +0100, Al Viro wrote:
> Except that you do not handle the slow unencrypted case - you end up with
> kfree() on the freshly kunmaped address.

Ah, right, we're actually kmalloc'ing the space that case as well ---
so hanging on the cpage is pointless; which was the point you were
making.   Sorry, I was being slow.

So what we have works, but it's not optimal.  Will fix.

   	   	       	   	    	      	    - Ted
