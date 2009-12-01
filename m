From: Vlad Yasevich <vladislav.yasevich@hp.com>
Subject: Re: linux-next: manual merge of the sysctl tree with the net tree
Date: Tue, 01 Dec 2009 09:13:29 -0500
Message-ID: <4B152489.7000201@hp.com>
References: <20091130164415.f418834b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from g6t0184.atlanta.hp.com ([15.193.32.61]:29087 "EHLO
	g6t0184.atlanta.hp.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750929AbZLAON2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Dec 2009 09:13:28 -0500
In-Reply-To: <20091130164415.f418834b.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>


Stephen Rothwell wrote:
> Hi Eric,
> 
> Today's linux-next merge of the sysctl tree got a conflict in
> net/sctp/sysctl.c between commit 90f2f5318b3a5b0898fef0fec9b91376c7de7a2c
> ("sctp: Update SWS avaoidance receiver side algorithm") from the net tree
> and commit f8572d8f2a2ba75408b97dc24ef47c83671795d7 ("sysctl net: Remove
> unused binary sysctl code") from the sysctl tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.  I also
> removed the strategy member from the new added ctl_table entry.

Thanks for fixing this up Stephen.  I was basing my work on linux-next
which, it appears, didn't have the sysctl changes.

-vlad
