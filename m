From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: next-20081114 build failure
Date: Sun, 16 Nov 2008 11:43:11 +0000
Message-ID: <1852.1226835791@redhat.com>
References: <20081116223008.4772920e.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:58710 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751731AbYKPLn4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 16 Nov 2008 06:43:56 -0500
In-Reply-To: <20081116223008.4772920e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Today's linux-next build (mips defconfig) failed like this:
> 
> fs/nfsctl.c:45: error: implicit declaration of function 'current_cred'
> 
> This is why you need explicit includes ...

Oops.  I really need to cull the number of creds trees I've got.  I didn't
apply your patches to all of them.

David
