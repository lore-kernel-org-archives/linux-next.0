From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [-next PATCH] Add param ops struct for hvc_iucv driver.
Date: Wed, 18 Nov 2009 11:30:43 +1030
Message-ID: <200911181130.43385.rusty@rustcorp.com.au>
References: <20091117132103.18413.53658.sendpatchset@localhost.localdomain> <20091117132448.GC5124@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:57127 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752531AbZKRBAj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Nov 2009 20:00:39 -0500
In-Reply-To: <20091117132448.GC5124@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Sachin Sant <sachinp@in.ibm.com>, linux-s390@vger.kernel.org, schwidefsky@de.ibm.com, linux-next@vger.kernel.org

On Tue, 17 Nov 2009 11:54:48 pm Heiko Carstens wrote:
> On Tue, Nov 17, 2009 at 06:51:03PM +0530, Sachin Sant wrote:
> > The following compile tested patch adds a param_ops structure for hvc_iucv.
> > 
...
> Rusty, could you pick this one up?
> 
> Acked-by: Heiko Carstens <heiko.carstens@de.ibm.com>

Thanks, applied, fixed spaces which should have been tabs.

Cheers,
Rusty.
