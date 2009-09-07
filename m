From: James Morris <jmorris@namei.org>
Subject: Re: [PATCH] KEYS: Fix default security_session_to_parent()
Date: Mon, 7 Sep 2009 22:36:59 +1000 (EST)
Message-ID: <alpine.LRH.2.00.0909072236440.9851@tundra.namei.org>
References: <20090907203857.023912f8.sfr@canb.auug.org.au> <20090907122417.754.63235.stgit@warthog.procyon.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1752336AbZIGMhR@vger.kernel.org>
In-Reply-To: <20090907122417.754.63235.stgit@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: David Howells <dhowells@redhat.com>
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, 7 Sep 2009, David Howells wrote:

> Fix the default security_session_to_parent() in linux/security.h to have a
> body.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>

Thanks!


Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next


-- 
James Morris
<jmorris@namei.org>
