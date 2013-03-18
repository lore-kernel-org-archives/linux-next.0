From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: linux-next: manual merge of the ftrace tree with Linus' tree
Date: Mon, 18 Mar 2013 09:26:27 -0400
Message-ID: <1363613187.25967.140.camel@gandalf.local.home>
References: <20130318130014.bad6e49cd6d4a112050173de@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:27272 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752220Ab3CRN02 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Mar 2013 09:26:28 -0400
In-Reply-To: <20130318130014.bad6e49cd6d4a112050173de@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sasha Levin <sasha.levin@oracle.com>, Andrew Morton <akpm@linux-foundation.org>

On Mon, 2013-03-18 at 13:00 +1100, Stephen Rothwell wrote:
> Hi Steven,
> 
> Today's linux-next merge of the ftrace tree got a conflict in
> kernel/trace/ftrace.c between commit b67bfe0d42ca ("hlist: drop the node
> parameter from iterators") from Linus' tree and commit e1df4cb682ab
> ("ftrace: Fix function probe to only enable needed functions") from the
> ftrace tree.
> 
> I fixed it up (see below) and can carry the fix as necessary (no action
> is required).
> 

Looks fine, thanks.

-- Steve
