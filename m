From: Christoph Lameter <cl@linux.com>
Subject: Re: Build issue with linux next. duplicate member _count in
 mm_types.h
Date: Thu, 7 Jul 2011 09:54:10 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1107070953350.17929@router.home>
References: <4E143120.2020501@cam.ac.uk> <alpine.DEB.2.00.1107060933460.17202@router.home> <4E15AF1C.7080103@example.com> <alpine.DEB.2.00.1107070841500.17376@router.home> <4E15B945.5060805@example.com> <alpine.DEB.2.00.1107070908320.17929@router.home>
 <4E15C59E.5000900@example.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp107.prem.mail.ac4.yahoo.com ([76.13.13.46]:34307 "HELO
	smtp107.prem.mail.ac4.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1756591Ab1GGOyN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 Jul 2011 10:54:13 -0400
In-Reply-To: <4E15C59E.5000900@example.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Piotr Hosowicz <piotr@hosowicz.com>
Cc: Jonathan Cameron <jic23@cam.ac.uk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Pekka Enberg <penberg@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, 7 Jul 2011, Piotr Hosowicz wrote:

> Mine is:
>
> aapi205:~# gcc --version
> gcc (Debian 4.6.0-10) 4.6.1 20110526 (prerelease)

Uhh... Guess its strict checks hit me there.
