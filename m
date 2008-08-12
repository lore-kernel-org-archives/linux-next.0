From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH] CRED: Fix IA64 COW credentials handling
Date: Wed, 13 Aug 2008 00:43:14 +0100
Message-ID: <11534.1218584594@redhat.com>
References: <alpine.LRH.1.10.0808130847280.17839@tundra.namei.org> <20080812092454.20969.30774.stgit@warthog.procyon.org.uk>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:56294 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752262AbYHLXnr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 12 Aug 2008 19:43:47 -0400
In-Reply-To: <alpine.LRH.1.10.0808130847280.17839@tundra.namei.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Morris <jmorris@namei.org>
Cc: dhowells@redhat.com, sfr@canb.auug.org.au, tony.luck@intel.com, linux-next@vger.kernel.org, linux-security-module@vger.kernel.org

James Morris <jmorris@namei.org> wrote:

> > diff --git a/include/sound/ad1848.h b/include/sound/ad1848.h
> > deleted file mode 100644
> > index e69de29..0000000
> > diff --git a/sound/isa/ad1848/ad1848_lib.c b/sound/isa/ad1848/ad1848_lib.c
> > deleted file mode 100644
> > index e69de29..0000000
> 
> Where did this come from ? :-)

Ummm... I don't know.  GIT being bad I expect.  I'll have a look in the
morning.

David
