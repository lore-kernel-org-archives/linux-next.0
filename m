From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH next-20130118 1/2] KEYS: Fix build-error when SYSTEM_TRUSTED_KEYRING=n
Date: Sat, 19 Jan 2013 01:07:45 +0000
Message-ID: <8514.1358557665@warthog.procyon.org.uk>
References: <1358556871-6651-1-git-send-email-sedat.dilek@gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:37630 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753850Ab3ASBHz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Jan 2013 20:07:55 -0500
In-Reply-To: <1358556871-6651-1-git-send-email-sedat.dilek@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: dhowells@redhat.com, Rusty Russell <rusty@rustcorp.com.au>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

Sedat Dilek <sedat.dilek@gmail.com> wrote:

> -	select KEYS
> +	depends on KEYS

This change was pushed upstream a few hours ago.  It may not have made it into
linux-next yet.

David
