From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: Tree for November 12 - lguest build failure
Date: Wed, 12 Nov 2008 21:10:55 +1030
Message-ID: <200811122110.56290.rusty@rustcorp.com.au>
References: <20081112182818.6e259488.sfr@canb.auug.org.au> <20081112091102.GA8063@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:60836 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750886AbYKLKlE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 12 Nov 2008 05:41:04 -0500
In-Reply-To: <20081112091102.GA8063@linux.vnet.ibm.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, sfr@canb.auug.org.au, lguest@ozlabs.org

On Wednesday 12 November 2008 19:41:02 Kamalesh Babulal wrote:
> Hi Rusty,
>
>  lguest build fails with next-20081112 kernel,
>
> drivers/lguest/lguest_device.c: In function =E2=80=98lg_find_vq=E2=80=
=99:
> drivers/lguest/lguest_device.c:252: error: too many arguments to func=
tion
> =E2=80=98vring_size=E2=80=99 make[2]: *** [drivers/lguest/lguest_devi=
ce.o] Error 1

Hey, what idiot put in a patch which broke lguest?  Oh wait...

Thanks, applied!
Rusty.
