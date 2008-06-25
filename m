From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build failure
Date: Wed, 25 Jun 2008 18:30:24 +1000
Message-ID: <200806251830.24421.rusty@rustcorp.com.au>
References: <20080625165825.60fdd9e9.sfr@canb.auug.org.au> <200806250935.55008.borntraeger@de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:53786 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751085AbYFYIa6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 04:30:58 -0400
In-Reply-To: <200806250935.55008.borntraeger@de.ibm.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Wednesday 25 June 2008 17:35:54 Christian Borntraeger wrote:
> Am Mittwoch, 25. Juni 2008 schrieb Stephen Rothwell:
> > Hi Rusty,
> >
> > Today's linux-next build (x86_64 allmodconfig (CONFIG_VIRTIO_CONSOLE=y,
> > CONFIG_VIRTIO=m)) failed like this:
>
> That is interesting. VIRTIO_CONSOLE (=y) has a depends on VIRTIO(m). Seems
> that Kconfig thinks that m is enough to fulfil a depends on.
>
> Rusty, what do you think about the following fixup patch? (please fold it
> into the other one):

Hmm, prefer either tristate "Virtio console" or "depends on VIRTIO = y". 
select has issues in that it ignores dependencies.

Rusty.
