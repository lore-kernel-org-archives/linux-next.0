From: Frank Haverkamp <haver@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/2] GenWQE: Fix endian issues detected by sparse
Date: Tue, 07 Jan 2014 15:39:16 +0100
Message-ID: <1389105556.15325.22.camel@oc7383187364.ibm.com>
References: <CA+r1Zhimt7Xusnc4kkkVqfoRhfZRnreMmZqaN7WP7rSpZ3XTvw@mail.gmail.com>
	 <1387553171-31469-1-git-send-email-haver@linux.vnet.ibm.com>
	 <20140107064130.GA5494@mwanda>
	 <1389097816.15325.7.camel@oc7383187364.ibm.com>
	 <20140107124501.GK5443@mwanda>
Reply-To: haver@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e06smtp12.uk.ibm.com ([195.75.94.108]:34079 "EHLO
	e06smtp12.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750832AbaAGOjY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 Jan 2014 09:39:24 -0500
Received: from /spool/local
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <haver@linux.vnet.ibm.com>;
	Tue, 7 Jan 2014 14:39:22 -0000
In-Reply-To: <20140107124501.GK5443@mwanda>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: fengguang.wu@intel.com, jim.epost@gmail.com, sfr@canb.auug.org.au, gregkh@linuxfoundation.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, kbuild-all@01.org, weiyj.lk@gmail.com

Hi Dan,

Am Dienstag, den 07.01.2014, 15:45 +0300 schrieb Dan Carpenter:
> Oops sorry...  I'm also still catching up from the holidays.  I think I
> was even CC'd on your earlier fix.

No problem. Let me send my latest set of patches for our GenWQE driver
which includes the ioctl return code fix and the removal of dev_err().
In addition fixes for properly compiling the driver on Sparc and Alpha.

> 
> regards,
> dan carpenter
> 

There are two more patches out from Wei Yongjun who removed obsolete
includes and fixed the error handling in genwqe_device_create().

Regards

Frank
