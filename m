From: David Howells <dhowells@redhat.com>
Subject: Re: Fw: [PATCH] nfsctl: credentials error
Date: Fri, 24 Oct 2008 11:04:27 +0100
Message-ID: <3209.1224842667@redhat.com>
References: <20081024165524.1a1ff01c.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:33095 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750881AbYJXKFm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Oct 2008 06:05:42 -0400
In-Reply-To: <20081024165524.1a1ff01c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, Randy Dunlap <randy.dunlap@oracle.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> +#include <linux/cred.h>
> +#include <linux/sched.h>

The first inclusion should be superfluous in the face of the second.

David
