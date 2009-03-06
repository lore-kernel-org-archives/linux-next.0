From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next:  tree build failure
Date: Fri, 6 Mar 2009 15:31:02 +1030
Message-ID: <200903061531.03148.rusty@rustcorp.com.au>
References: <20090305184107.0926b4cd.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:35507 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750950AbZCFFX7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Mar 2009 00:23:59 -0500
In-Reply-To: <20090305184107.0926b4cd.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

On Thursday 05 March 2009 18:11:07 Stephen Rothwell wrote:
> Caused by commit 6034a37f9dff70fea021bf3a2dcdc356bccb88b3
> ("cpumask:use-cpu_sibling_mask") which introduced uses of
> cpu_sibling_mask which is only defined for x86 ...

Thanks.  I've moved that patch back.

I *think* it can use topology_thread_cpumask(), but I have to check that it's defined in all the right cases.

Thanks very much,
Rusty.
