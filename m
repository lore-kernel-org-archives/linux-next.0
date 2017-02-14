From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] tile: fix build failure
Date: Tue, 14 Feb 2017 09:48:42 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1702140948210.3635@nanos>
References: <1485275961-20112-1-git-send-email-sudip.mukherjee@codethink.co.uk> <0a7c53b5-0d1f-baa1-b159-b188e68e8f26@mellanox.com> <58A23A20.30000@gmail.com> <20170214100157.1740cdee@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:42647 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751453AbdBNIsv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Feb 2017 03:48:51 -0500
In-Reply-To: <20170214100157.1740cdee@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Chris Metcalf <cmetcalf@mellanox.com>, linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org

On Tue, 14 Feb 2017, Stephen Rothwell wrote:
> > linux-next is still failing for this error. Who will pick this up?
> 
> Presumably the tip tree (timers/core).  Added Thomas to cc.

Applied.
