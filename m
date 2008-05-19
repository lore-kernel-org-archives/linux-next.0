From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr/x86 merge conflict
Date: Mon, 19 May 2008 16:50:20 +1000
Message-ID: <200805191650.20903.rusty@rustcorp.com.au>
References: <20080519150328.5913fd84.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:53481 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753646AbYESGu1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 02:50:27 -0400
In-Reply-To: <20080519150328.5913fd84.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Jason Baron <jbaron@redhat.com>

On Monday 19 May 2008 15:03:28 Stephen Rothwell wrote:
> Hi Rusty, Ingo,
>
> Today's linux-next merge of the rr tree got conflicts in
> kernel/stop_machine.c and include/linux/stop_machine.h because commit
> 069d5b32bfe605bd78c2f8b2ee6c63a776592867 from the rr tree and commit
> 931aa4ee2f3b833e7a0a149126cc92596f7907c6 from the x86 tree ("Add all cpus
> option to stop machine run") are essentially the same (though they are
> attributed to different authors).  The problem lies in that the rr tree
> then has a few more commits that change those files.
>
> I took the versions from the rr tree.

That's the correct solution: Matheiu forgot the From line.

Cheers,
Rusty.
