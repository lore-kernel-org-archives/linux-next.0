From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH] CRED: Fix IA64 COW credentials handling
Date: Wed, 13 Aug 2008 08:52:15 +1000 (EST)
Message-ID: <alpine.LRH.1.10.0808130851300.17839@tundra.namei.org>
References: <20080812092454.20969.30774.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tundra.namei.org ([65.99.196.166]:59794 "EHLO tundra.namei.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751505AbYHLWwh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 18:52:37 -0400
In-Reply-To: <20080812092454.20969.30774.stgit@warthog.procyon.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: sfr@canb.auug.org.au, tony.luck@intel.com, linux-next@vger.kernel.org, linux-security-module@vger.kernel.org

On Tue, 12 Aug 2008, David Howells wrote:

> Fix the IA64 arch's use of COW credentials.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>

Applied the IA64 chunks to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next-creds


- James
-- 
James Morris
<jmorris@namei.org>
