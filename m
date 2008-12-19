From: "Jaswinder Singh" <jaswinderlinux@gmail.com>
Subject: Re: Firmware patches for SCSI
Date: Sat, 20 Dec 2008 02:11:04 +0530
Message-ID: <3f9a31f40812191241q40dafdb0lfd2f4487f2870e2@mail.gmail.com>
References: <3f9a31f40812191153n636888f4i549409453266d58c@mail.gmail.com>
	 <1229718543.18778.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.233]:40832 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750833AbYLSUlF (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 19 Dec 2008 15:41:05 -0500
In-Reply-To: <1229718543.18778.4.camel@localhost.localdomain>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: linux-scsi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sfr@canb.auug.org.au, linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

Hello James,

On Sat, Dec 20, 2008 at 1:59 AM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> Um ... depends how they got into linux-next.  The head commit just says
>

They got into linux-next via David Woodhouse. :
http://git.infradead.org/users/dwmw2/firmware-2.6.git

> Merge commit 'firmware/master'
>
> Which isn't very descriptive of where it came from.  It looks like
> either a tree that linux-next shouldn't pull (or one the owner forgot to
> push to linus).
>

Earlier due to Firmware issues firmware patches are going directly
though David Woodhouse.

Now firmware issues are solved so David wants that the _driver_
patches should be sent directly to the appropriate maintainers / mailing lists.

So I am curious that should I resend these patches based on which git tree.

Thank you,

Jaswinder Singh.
