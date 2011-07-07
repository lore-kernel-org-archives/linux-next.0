From: Christoph Lameter <cl@linux.com>
Subject: Re: Build issue with linux next. duplicate member _count in
 mm_types.h
Date: Thu, 7 Jul 2011 14:14:14 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1107071413290.24437@router.home>
References: <4E143120.2020501@cam.ac.uk>  <alpine.DEB.2.00.1107060933460.17202@router.home>  <4E15AF1C.7080103@example.com>  <alpine.DEB.2.00.1107070841500.17376@router.home>  <4E15B945.5060805@example.com> <1310065670.21902.62.camel@jaguar>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp101.prem.mail.ac4.yahoo.com ([76.13.13.40]:34679 "HELO
	smtp101.prem.mail.ac4.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753143Ab1GGTOR (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jul 2011 15:14:17 -0400
In-Reply-To: <1310065670.21902.62.camel@jaguar>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@kernel.org>
Cc: piotr@hosowicz.com, Jonathan Cameron <jic23@cam.ac.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, 7 Jul 2011, Pekka Enberg wrote:

> > I attach it. Your patch seems to had worked, I finish making the package.
>
> I'm confused. Does Christoph's patch fix the problem for everyone?

Guess so (heard nothing to the contrary) but I still would like to know
what caused it. My best guess right now its gccs 4.6s stricter checking.
