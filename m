From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build error
Date: Tue, 17 Feb 2009 22:34:14 +1030
Message-ID: <200902172234.14660.rusty@rustcorp.com.au>
References: <20090217161252.ef44979c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:35919 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751241AbZBQMEU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Feb 2009 07:04:20 -0500
In-Reply-To: <20090217161252.ef44979c.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Anders Kaseorg <andersk@mit.edu>, Jeff Arnold <jbarnold@mit.edu>, Tim Abbott <tabbott@mit.edu>

On Tuesday 17 February 2009 15:42:52 Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> In file included from kernel/kallsyms.c:15:
> include/linux/kallsyms.h:22: warning: 'struct module' declared inside parameter list

Thanks, this does not happen on x86, I guess some weird include tangle.

Fix is simple (declare struct module), I've done it now.

Thanks,
Rusty.
