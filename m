From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: Suspend issues on 2.6.27-rc2 (was: Heavy suspend and io problems in 2.6.27-rc1-00156-g94ad374)
Date: Thu, 7 Aug 2008 18:52:10 +0200
Message-ID: <200808071852.11080.rjw@sisk.pl>
References: <20080731210507.GA6094@denkbrett.schottelius.org> <20080804233712.GA4181@denkbrett.schottelius.org> <20080807083642.GA4370@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:35695 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752603AbYHGQtC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Aug 2008 12:49:02 -0400
In-Reply-To: <20080807083642.GA4370@denkbrett.schottelius.org>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico Schottelius <nico-linux-kernel-bugreport20080731@schottelius.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org

On Thursday, 7 of August 2008, Nico Schottelius wrote:
> Hello!

Hi,
 
> The problem continues to exist:
> 
> I tested it on vanilla 2.6.27-rc2: Same problem, system does not wake up.
> 
> Did not test the proposed patch, because it did not restore the console
> in any tested case yet, though it at least wakes the system up.

What graphics adapter is there in your box?

Rafael
