From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rr tree
Date: Thu, 23 Oct 2008 23:25:15 +1100
Message-ID: <200810232325.16088.rusty@rustcorp.com.au>
References: <20081023145602.105edce2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:42790 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751826AbYJWMZM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 08:25:12 -0400
In-Reply-To: <20081023145602.105edce2.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

On Thursday 23 October 2008 14:56:02 Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next merge of the rr tree got a conflict in
> arch/x86/Kconfig between commit 363a5e3d7b4b69371f21bcafd7fc76e68c73733a
> ("x86: add MAXSMP") from cpus4096 tree and commit
> 7ff10dbd907d18bb26b1a8e8ac4ec32a72c0d0ee ("x86:enable-MAXSMP") from the
> rr tree.

OK, this is a real conflict, your fix looks good.

> There is also a conflict in the same file between commit
> 01f569c81fc075f276ec2e7c0b7cb4c72ba74635 ("x86: restore 4096 limit for
> NR_CPUS") from the cpus4096 tree and commit
> d08dde18aebb15633e5c4480814b77d93a4d68f6
> ("cpumask:CONFIG_NR_CPUS-always") from the rr tree.
>
> Overlapping changes.  I have fixed it up (see below) and can carry the fix.
>
> Rusty, your versions of these patches also had some leading spaces ...

Hmm, it did too.  checkpatch.pl doesn't comment on it.  Fixed.

Thanks,
Rusty.
