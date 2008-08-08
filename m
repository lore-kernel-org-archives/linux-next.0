From: David Howells <dhowells@redhat.com>
Subject: Re: next-20080808: bash: fork: Resource temporarily unavailable
Date: Fri, 08 Aug 2008 23:32:15 +0100
Message-ID: <17923.1218234735@redhat.com>
References: <20080808172141.GY14495@cs181140183.pp.htv.fi> <1218214935.3146.5.camel@dhcppc0>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:56956 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750849AbYHHWjF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Aug 2008 18:39:05 -0400
In-Reply-To: <20080808172141.GY14495@cs181140183.pp.htv.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Meyer <thomas@m3y3r.de>, Adrian Bunk <bunk@kernel.org>
Cc: dhowells@redhat.com, Linux-Kernel <linux-kernel@vger.kernel.org>, Linux-Next <linux-next@vger.kernel.org>


Adrian Bunk <bunk@kernel.org> wrote:

> The only commits that touched kernel/fork.c between next-20080807 and 
> next-20080808 are David's CRED patches.
> 
> David, can you look at this?

I can, but I'll need a config file as it boots fine for me and passes the LTP
testsuites I've run on it.

David
