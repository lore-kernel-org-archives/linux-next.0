From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next:  rr_cpumask tree build failure
Date: Tue, 30 Dec 2008 09:22:08 +1030
Message-ID: <200812300922.08889.rusty@rustcorp.com.au>
References: <20081230025557.89d2565e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:60917 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753366AbYL2WwQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 29 Dec 2008 17:52:16 -0500
In-Reply-To: <20081230025557.89d2565e.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>

On Tuesday 30 December 2008 02:25:57 Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next build (powerpc allnoconfig) failed like this:
> 
> drivers/base/cpu.c: In function 'print_cpus_kernel_max':
> drivers/base/cpu.c:136: error: 'CONFIG_NR_CPUS' undeclared (first use in this function)
> 
> Caused by commit e057d7aea9d8f2a46cd440d8bfb72245d4e72d79 ("cpumask: add
> sysfs displays for configured and disabled cpu maps") from the rr_cpumask
> tree.  Powerpc (at least) does not define CONFIG_NR_CPUS for a non SMP
> build.
> 
> I have reverted that commit for today.

Thanks, we defined that in a later patch which hadn't been put in the cpumask
tree yet.  I've moved it (and several others) in now.

Thanks,
Rusty.
