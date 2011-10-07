From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [PATCH -next] infiniband: fix ipath_chip_init.c build errors
Date: Fri, 07 Oct 2011 15:05:44 -0700
Message-ID: <4E8F77B8.3000805@xenotime.net>
References: <20111007174230.702f4a0bf1fe71dab5e10961@canb.auug.org.au> <4E8F683D.9020604@xenotime.net> <CAL1RGDXoiRfR1Ku67tRgbhxzyWQmDrjKCztnVd6wbwi0Uud90Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:60330 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1758605Ab1JGWSs (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 7 Oct 2011 18:18:48 -0400
In-Reply-To: <CAL1RGDXoiRfR1Ku67tRgbhxzyWQmDrjKCztnVd6wbwi0Uud90Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Roland Dreier <roland@purestorage.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Mike Marciniszyn <infinipath@qlogic.com>, linux-rdma@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On 10/07/11 14:21, Roland Dreier wrote:
> On Fri, Oct 7, 2011 at 1:59 PM, Randy Dunlap <rdunlap@xenotime.net> wrote:
>> Add <linux/stat.h> to fix build errors:
> 
> When did this break?  I build ipath in my test config all the time...

First I saw it was in today's linux-next (20111007).

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
