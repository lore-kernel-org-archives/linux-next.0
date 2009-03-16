From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: linux-next: manual merge of the suspend tree with the cpus4096 tree
Date: Mon, 16 Mar 2009 23:09:47 +0100
Message-ID: <200903162309.48578.rjw@sisk.pl>
References: <20090316200005.2a98d95b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:50981 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755635AbZCPWJh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 16 Mar 2009 18:09:37 -0400
In-Reply-To: <20090316200005.2a98d95b.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>, Mike Travis <travis@sgi.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

On Monday 16 March 2009, Stephen Rothwell wrote:
> Hi Rafael,

Hi,

> Today's linux-next merge of the suspend tree got a conflict in
> drivers/xen/manage.c between commit
> f7df8ed164996cd2c6aca9674388be6ef78d8b37 ("cpumask: convert misc driver
> functions") from the cpus4096 tree and commit
> 73263bc09332c5c8de7c60cb76b5b24e2da66b42 ("PM: Rework handling of
> interrupts during suspend-resume") from the suspend tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.  As you
> said, it is trivial.

Please do, if that's not a problem.

Thanks,
Rafael
