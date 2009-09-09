From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH] KEYS: Add missing linux/tracehook.h #inclusions
Date: Wed, 9 Sep 2009 18:38:55 +1000 (EST)
Message-ID: <alpine.LRH.2.00.0909091838430.23322@tundra.namei.org>
References: <20090908104012.ff4bd25f.sfr@canb.auug.org.au> <20090909073021.21257.61971.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:51601 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751347AbZIIIjK (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 9 Sep 2009 04:39:10 -0400
In-Reply-To: <20090909073021.21257.61971.stgit@warthog.procyon.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 9 Sep 2009, David Howells wrote:

> Add #inclusions of linux/tracehook.h to those arch files that had the tracehook
> call for TIF_NOTIFY_RESUME added when support for that flag was added to that
> arch.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>


Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next


-- 
James Morris
<jmorris@namei.org>
