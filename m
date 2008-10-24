From: David Howells <dhowells@redhat.com>
Subject: Re: Fw: [PATCH] coda: credentials error
Date: Fri, 24 Oct 2008 11:08:19 +0100
Message-ID: <3238.1224842899@redhat.com>
References: <20081024165421.1221819a.sfr@canb.auug.org.au>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.redhat.com ([66.187.237.31]:33167 "EHLO mx2.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750881AbYJXKJZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Oct 2008 06:09:25 -0400
In-Reply-To: <20081024165421.1221819a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, James Morris <jmorris@namei.org>, Randy Dunlap <randy.dunlap@oracle.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>


That looks okay.  This could go upstream now as linux/cred.h is already
upstream, even if the other patches aren't yet.

David
