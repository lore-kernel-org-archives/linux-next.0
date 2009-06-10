From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build failure
Date: Wed, 10 Jun 2009 16:56:46 +0930
Message-ID: <200906101656.48204.rusty@rustcorp.com.au>
References: <20090609201205.2894522c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:34615 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755338AbZFJH0t (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 03:26:49 -0400
In-Reply-To: <20090609201205.2894522c.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 9 Jun 2009 07:42:05 pm Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next build (powerpc allnoconfig) failed like this:
>
> lib/extable.c: In function 'trim_init_extable':
> lib/extable.c:50: error: dereferencing pointer to incomplete type
> lib/extable.c:50: error: implicit declaration of function
..
> This is a build without CONFIG_MODULE.

Ah, my bad.  I'll wrap this and test this config too.

Thanks,
Rusty.
