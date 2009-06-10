From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build warning
Date: Wed, 10 Jun 2009 16:10:17 +0930
Message-ID: <200906101610.20265.rusty@rustcorp.com.au>
References: <20090609162636.d2351007.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:60187 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752595AbZFJGkV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 02:40:21 -0400
In-Reply-To: <20090609162636.d2351007.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 9 Jun 2009 03:56:36 pm Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
>
> arch/x86/kernel/cpu/cpufreq/powernow-k8.c:1287: warning: passing argument 1
> of 'check_supported_cpu' makes pointer from integer without a cast
> arch/x86/kernel/cpu/cpufreq/powernow-k8.c:514: note: expected 'void *' but
> argument is of type 'unsigned int'
>
> Introduced by commit b3594a9ce5fb32533084ec75f1954c93f461591d ("cpumask:
> avoid playing with cpus_allowed in powernow-k8.c").

Thanks, I've revisited this patch and fixed this too.

Thanks,
Rusty.
