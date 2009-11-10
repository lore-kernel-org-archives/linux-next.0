From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build warnings
Date: Tue, 10 Nov 2009 12:50:17 +1030
Message-ID: <200911101250.17208.rusty@rustcorp.com.au>
References: <20091109183104.2bf7add6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:42588 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752867AbZKJCUP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 9 Nov 2009 21:20:15 -0500
In-Reply-To: <20091109183104.2bf7add6.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 9 Nov 2009 06:01:04 pm Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next build (x86_64 allmodconfig) produced these warnings:
> 
> drivers/usb/storage/libusual.c:239: warning: passing argument 1 of '__check_old_set_param' from incompatible pointer type
> include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, struct kernel_param *)' but argument is of type 'int (*)(const char *, const struct kernel_param *)'
> drivers/usb/storage/libusual.c:239: warning: passing argument 1 of '__check_old_set_param' from incompatible pointer type
> include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, struct kernel_param *)' but argument is of type 'int (*)(const char *, const struct kernel_param *)'
> drivers/usb/storage/libusual.c:239: warning: passing argument 1 of '__check_old_set_param' from incompatible pointer type
> include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, struct kernel_param *)' but argument is of type 'int (*)(const char *, const struct kernel_param *)'
> drivers/usb/storage/libusual.c:239: warning: passing argument 1 of '__check_old_set_param' from incompatible pointer type
> include/linux/moduleparam.h:165: note: expected 'int (*)(const char *, struct kernel_param *)' but argument is of type 'int (*)(const char *, const struct kernel_param *)'
> 
> Introduced by commit 9f94999724555729819ea0143eab1d0529c029d1
> ("param:param_ops").

Thanks Stephen!  Overzealous conversion; harmless but annoying.

I've fixed this properly now...
Rusty.
