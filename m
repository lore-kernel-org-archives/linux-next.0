From: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: VFIO compile failure on i386 allmodconfig in linux-next
Date: Thu, 28 Jun 2012 16:25:47 -0600
Message-ID: <1340922347.3179.60.camel@ul30vt>
References: <20120628175712.GA20250@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:12666 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754853Ab2F1WZs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 28 Jun 2012 18:25:48 -0400
In-Reply-To: <20120628175712.GA20250@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-next@vger.kernel.org

On Thu, 2012-06-28 at 13:57 -0400, Paul Gortmaker wrote:
> Hi Alex,
> 
> Just a heads up that the i386 allmodconfig failed on VFIO, in case
> you didn't see it.
> 
> http://kisskb.ellerman.id.au/kisskb/buildresult/6603285/
> 
> arch/x86/include/asm/uaccess_32.h:211:26: error: call to 'copy_from_user_overflow' declared with attribute error: copy_from_user() buffer size is not provably correct
> make[4]: *** [drivers/vfio/pci/vfio_pci_config.o] Error 1

Thank you for the report.  This looks bogus to me, it's complaining
about a copy_from_user into an __le32 because it can't determine the
number of bytes to be copied.  That number is a parameter to the
function, but the function is static and only called with values of 1, 2
or 4.  I've added a test that seems to make the compiler happy, so this
will be fixed in tomorrow's tree.  Thanks!

Alex
