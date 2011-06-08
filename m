From: Dan Magenheimer <dan.magenheimer@oracle.com>
Subject: RE: linux-next: Tree for June 6 (frontswap)
Date: Wed, 8 Jun 2011 10:01:30 -0700 (PDT)
Message-ID: <d0e92f96-df09-4ac2-ad5e-53cdd92aba94@default>
References: <20110606132036.aebd73a4.sfr@canb.auug.org.au>
 <20110606130628.e0110e18.randy.dunlap@oracle.com>
 <b06ff74d-fc79-4c01-b159-9d352ca1a0f5@default
 20110608092844.66352540.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:27698 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751343Ab1FHRBy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 8 Jun 2011 13:01:54 -0400
In-Reply-To: <20110608092844.66352540.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> From: Randy Dunlap
> Sent: Wednesday, June 08, 2011 10:29 AM
> To: Dan Magenheimer
> Cc: Stephen Rothwell; linux-next@vger.kernel.org; LKML
> Subject: Re: linux-next: Tree for June 6 (frontswap)
> 
> On Mon, 6 Jun 2011 13:23:09 -0700 (PDT) Dan Magenheimer wrote:
> 
> > > Does frontswap need to depend on SWAP?
> >
> > Indeed you are correct!  Thanks for catching that!
> 
> Please fix the tree in linux-next so that this build error does not
> continue.

Sorry, I thought it was just an observation, didn't know
it was breaking your build, so didn't know there was a rush.
I am away from my machines for the rest of the day, but will
get it fixed and resubmitted first thing tomorrow (US time).

Dan
