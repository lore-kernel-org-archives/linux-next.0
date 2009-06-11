From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build failure
Date: Thu, 11 Jun 2009 22:38:56 +0930
Message-ID: <200906112238.57075.rusty@rustcorp.com.au>
References: <20090611190728.510af289.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:36439 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752468AbZFKNI7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 11 Jun 2009 09:08:59 -0400
In-Reply-To: <20090611190728.510af289.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 11 Jun 2009 06:37:28 pm Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next build (sparc defconfig) failed like this:
>
> arch/sparc/mm/extable.c: In function 'trim_init_extable':
> arch/sparc/mm/extable.c:78: error: too few arguments to function
> 'within_module_init'

Thanks, I've applied your fix.

Thanks,
Rusty.
