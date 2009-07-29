From: Philipp Reisner <philipp.reisner@linbit.com>
Subject: Re: linux-next: drbd tree build failure
Date: Wed, 29 Jul 2009 17:11:22 +0200
Message-ID: <200907291711.22466.philipp.reisner@linbit.com>
References: <20090727154816.24e81531.sfr@canb.auug.org.au> <20090728142040.9b2df926.sfr@canb.auug.org.au> <200907291110.56241.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail09.linbit.com ([212.69.161.110]:50533 "EHLO
	mail09.linbit.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751447AbZG2PLY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2009 11:11:24 -0400
In-Reply-To: <200907291110.56241.rusty@rustcorp.com.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Lars Ellenberg <lars.ellenberg@linbit.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wednesday 29 July 2009 03:40:55 Rusty Russell wrote:
> On Tue, 28 Jul 2009 01:50:40 pm Stephen Rothwell wrote:
> > Hi Philipp, Lars,
> >
> > On Mon, 27 Jul 2009 19:17:55 +0200 Philipp Reisner 
<philipp.reisner@linbit.com> wrote:
> > > Ok. Lars' patch is now complete and arrived in the git tree...
> > >
> > > It should build now with Rusty's paches.
> >
> > Thanks.
>
> This is untested, but fairly trivial transform to avoid cpumask_t in the
> struct as well:
>

Thanks,

I have commited that patch to the DRBD git tree.

-phil
-- 
: Dipl-Ing Philipp Reisner
: LINBIT | Your Way to High Availability
: Tel: +43-1-8178292-50, Fax: +43-1-8178292-82
: http://www.linbit.com

DRBD(R) and LINBIT(R) are registered trademarks of LINBIT, Austria.
